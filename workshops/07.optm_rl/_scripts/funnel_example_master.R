# =============================================================================
#### Info #### 
# =============================================================================
# Optimizing Stan code, Neal's Funnel example
#
# Lei Zhang, University of Birmingham
# l.zhang.13@bham.ac.uk
#
# Adapted from Stan Reference 2.12, 2016

# =============================================================================
library(rstan); library(ggplot2)


startTime = proc.time()

# =============================================================================
# direct model
# =============================================================================
rstan_options(auto_write = TRUE)
options(mc.cores = 2)

system.time(
    funnel_fit1 <- stan("_scripts/funnel.stan",
                        seed = 1212337896)
)


# =============================================================================
# adjust delta
# =============================================================================
system.time(
    funnel_fit2 <- stan("_scripts/funnel.stan",
                        seed = 1212337896, 
                        control = list(adapt_delta = 0.999, max_treedepth=20))
)


# =============================================================================
# reparameterized model
# =============================================================================
system.time(
    funnel_fit3 <- stan("_scripts/funnel_reparam.stan",
                        seed = 1212337896)
)

stopTime = proc.time()
elapsedTime = stopTime - startTime


myx <- extract(funnel_fit1,'x')$x
myy <- extract(funnel_fit1,'y')$y
qplot(myx[,1],myy)


myx <- extract(funnel_fit2,'x')$x
myy <- extract(funnel_fit2,'y')$y
qplot(myx[,1],myy)

# =============================================================================
# Trace plot
# =============================================================================
plot_trace1 <- stan_trace(funnel_fit1, pars = 'y', inc_warmup = F)
ggsave(plot = plot_trace1, "_plots/trace_y_directModel.png", width = 6, height = 4, type = "cairo-png", units = "in")

plot_trace2 <- stan_trace(funnel_fit2, pars = 'y', inc_warmup = F)
ggsave(plot = plot_trace2, "_plots/trace_y_adjustedDirectModel.png", width = 6, height = 4, type = "cairo-png", units = "in")

plot_trace3 <- stan_trace(funnel_fit3, pars = 'y', inc_warmup = F)
ggsave(plot = plot_trace3, "_plots/trace_y_reparameterizesModel.png", width = 6, height = 4, type = "cairo-png", units = "in")



# =============================================================================
# plot Normal Distribution
# =============================================================================
myconfig <- theme_bw(base_size = 20) +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.background = element_blank() )

## normal distribution
myMean1 = 0 
mySD1   = 1 

myMean2 = 10 
mySD2   = 3 

myXlim = c(min(myMean1, myMean2)-10, max(myMean1, myMean2)+10)

# dnorm
g1 <- ggplot(data.frame(x = myXlim), aes(x)) + 
    stat_function(fun = dnorm, args = list(mean = myMean1, sd = mySD1), size = 3, colour = 'navyblue')
g1 <- g1 + stat_function(fun = dnorm, args = list(mean = myMean2, sd = mySD2), size = 3, colour = 'tomato1')
g1 <- g1 + myconfig + labs(x = '', y = '') + ylim(0,0.5)
print(g1)

ggsave(plot = g1, "_plots/MattTrick.png", width = 6, height = 4, type = "cairo-png", units = "in")








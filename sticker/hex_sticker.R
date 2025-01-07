library(hexSticker)
library(ggplot2)

# Code for hexsticker

# Install showtext
install.packages("showtext")

# Load the package
library(showtext)

# Enable showtext
showtext_auto()

# You can add Google fonts directly:
font_add_google("Source Sans Pro")  # This is similar to the sparklyr font
font_add_google("Roboto")

showtext_auto()

# Create an empty plot as subplot
empty_plot <- ggplot() + theme_void()

sticker <- sticker(
  subplot = empty_plot,
  s_x = 1,
  s_y = 1,
  s_width = 0.1,
  s_height = 0.1,
  package = "BayesCog",
  p_x = 1,
  p_y = 0.6,
  p_color = "#FFFFFF",
  p_size = 20,
  p_family = "Roboto",  # Changed to Helvetica font
  h_fill = "#7d529b",
  h_color = "#7d529b",
  white_around_sticker = FALSE,
  filename = "hex_sticker.png"
)

sticker


#### Code for prior/posterior distributions

# Create data frame with x values
x <- seq(-4, 4, length.out = 1000)
df <- data.frame(x = x)

# Add different normal distributions
df$dist1 <- dnorm(x, mean = -1, sd = 1.1)
df$dist2 <- dnorm(x, mean = 0, sd = 0.9)
df$dist3 <- dnorm(x, mean = 1, sd = 1.5)

# Convert to long format
df_long <- tidyr::pivot_longer(df, cols = starts_with("dist"), 
                               names_to = "distribution", 
                               values_to = "density")

# Create plot
ggplot(df_long, aes(x = x, y = density, group = distribution)) +
  geom_line(color = "black", size = 1) +
  theme_minimal() +
  labs(x = "", y = "") +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())



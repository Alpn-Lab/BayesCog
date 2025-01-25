# =============================================================================
#### Info #### 
# =============================================================================
# R basics and probability functions
#
# Lei Zhang, University of Birmingham
# l.zhang.13@bham.ac.uk

# =============================================================================
#### Exercise I #### 
# =============================================================================

#------------------------------------------------------------------------------
## Get to know your R
# Display R version information
R.version
# Display detailed session information including loaded packages
sessionInfo()

#------------------------------------------------------------------------------
## Basic Commands
getwd()  # Get the current working directory path
setwd()  # Set the working directory (requires path as argument)
dir()    # List files in the current directory
ls()     # List objects in the current R environment
print('hello world')  # Basic print function
cat("Hello", "World")  # Concatenate and print strings with space between them
paste0('C:/', 'Group1')  # Concatenate strings without separator
? mean  # Get help documentation for the mean function
rm(list = ls())  # Remove all objects from the environment
#q()  # Quit R session (commented out)

#------------------------------------------------------------------------------
## Data Classes 
# numeric & integer
a1 <- 5  # Assign numeric value (default floating point)
a2 <- as.integer(a1)  # Convert to integer type
class(a1)  # Check class of a1 (numeric)
class(a2)  # Check class of a2 (integer)

# character
b1 <- 'Hello World!'  # Create string with single quotes
b2 <- "Hello World!"  # Create string with double quotes
class(b1)  # Check class (character)
class(b2)  # Check class (character)

## logical
c1 <- T; c2 <- TRUE; c3 <- F; c4 <- FALSE  # Different ways to create logical values
class(c1)  # Check class (logical)

# factor
f <- factor(letters[c(1, 1, 2, 2, 3:10)])  # Create factor from letters with some repetition
class(f)  # Check class (factor)
f

#------------------------------------------------------------------------------
## Data Types
# vector
v1 <- 1:12  # Create numeric vector using sequence
v2 <- c(2,4,1,5,1,6, 13:18)  # Create numeric vector by combining values and sequence
v3 <- c(rep('aa',4), rep('bb',4), rep('cc',4))  # Create character vector with repeated values
class(v1)  # Check class of v1
class(v2)  # Check class of v2
class(v3)  # Check class of v3

# matrix and array
m1 <- matrix(v1, nrow=3, ncol=4)  # Create matrix filled by column
m2 <- matrix(v1, nrow=3, ncol=4, byrow = T)  # Create matrix filled by row
arr <- array(v1, dim=c(2,2,3))  # Create 3D array
class(m1)  # Check class of matrix
class(arr)  # Check class of array

# dataframe
df <- data.frame(v1=v1, v2=v2, v3=v3, f=f)  # Create dataframe from vectors
class(df)  # Check class of dataframe
str(df)    # Display structure of dataframe
class(df$v1)  # Check class of first column
class(df$v2)  # Check class of second column
class(df$v3)  # Check class of third column
class(df$f)   # Check class of fourth column (factor)

# =============================================================================
#### Exercise II #### 
# =============================================================================

#------------------------------------------------------------------------------
## Control Flow

# if-else
#   - generate a random number between 0 and 1
#   - compare it against 1/3 and 2/3
#   - print this random number and its position relative to 1/3 and 2/3

t <- runif(1) # random number between 0 and 1
if (t <= 1/3) {
  cat("t =", t, ", t <= 1/3. \n")
} else if (t > 2/3) {
  cat("t =", t, ", t > 2/3. \n")
} else {
  cat("t =", t, ", 1/3 < t <= 2/3. \n")
}

# for-loop
#   - Get the name of each month 
#   - Print it one by one 
month_name <- format(ISOdate(2019,1:12,1),"%B")
for (j in 1:length(month_name) ) {
    cat()
}

#------------------------------------------------------------------------------
## User-defined Function

# example: standard error of the mean
sem <- function(x) {
    sqrt( var(x,na.rm=TRUE) / (length(na.omit(x))-1) )
}

# calculate the meam 
my_mean <- function(x) {
    x_bar <- 
    return(x_bar)
}

tmp <- rnorm(10)
my_mean(tmp)

# sanity check
all.equal(mean(tmp), my_mean(tmp))

#------------------------------------------------------------------------------
## basic plotting

x = rnorm(20)
y = x + rnorm(20,0,.8)
plot(x,y)
ggplot2::qplot(x,y)
lattice::xyplot(y ~ x)


# =============================================================================
#### Exercise III #### 
# =============================================================================

#------------------------------------------------------------------------------
## basic data management
data_dir = ('_data/RL_raw_data/sub01/raw_data_sub01.txt')
data = read.table(data_dir, header = T, sep = ",")
head(data)

# indexing
data[1,1]
data[1,]
data[,1]
data[1:10,]
data[,1:2]
data[1:10, 1:2]
data[c(1,3,5,6), c(2,4)]
data$choice

# rm NAs
sum(complete.cases(data))
data = data[complete.cases(data),]
dim(data[complete.cases(data),])

# read in all the data!
ns = 10
data_dir = '_data/RL_raw_data'

rawdata = c()
for (s in 1:ns) {
    sub_file = file.path(, sprintf('sub%02i/raw_data_sub%02i.txt',s,s))
    sub_data = read.table(sub_file, header = T, sep = ",")
    rawdata = rbind(rawdata, sub_data)
}
rawdata = rawdata[complete.cases(rawdata),]

rawdata$accuracy = (rawdata$choice == rawdata$correct) * 1.0

acc_mean = aggregate(rawdata$accuracy, by = list(rawdata$subjID), mean)[,2]

# =============================================================================
#### Exercise IV #### 
# =============================================================================

#------------------------------------------------------------------------------
# read descriptive data
load('_data/RL_descriptive.RData')
descriptive$acc = acc_mean
df = descriptive

#------------------------------------------------------------------------------
# one sample t-test , to test if 'acc' is above chance level
t.test(df$acc, mu = 0.5) 
# simple correlation, to test if IQ is correlated with acc
cor.test(df$IQ, df$acc)

# =============================================================================
#### Exercise V #### 
# =============================================================================

#------------------------------------------------------------------------------
## plot the scatter and the regression line
library(ggplot2)

myconfig <- theme_bw(base_size = 20) +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.background = element_blank() )

# scatter plot
g1 <- ggplot(df, aes(IQ,acc))
g1 <- g1 + geom_jitter(width=0.0, height=0.0, size=5, colour='skyblue', alpha=0.95)
g1 <- g1 + myconfig + labs(x = 'IQ', y = 'Choice accuracy (%)')

# add the regression line
g1 <- g1 + geom_smooth(method = "lm", se = T, colour='skyblue3')
g1
#ggsave(plot = g1, "_plots/scatter.png", width = 4, height = 3, type = "cairo-png", units = "in")

## simple regression
fit1 = lm(acc ~ IQ, data = df)
summary(fit1)

# Use the latest rocker/rstudio image
FROM rocker/rstudio:latest

# Install system dependencies (these are needed for some R packages)
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcairo2-dev \
    libgit2-dev \
    libglpk40 \
    libglu1-mesa-dev \
    libgmp3-dev \
    libgsl0-dev \
    libssl-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install R packages from CRAN
RUN R -e "install.packages(c(\
    'renv', \
    'ggplot2', \
    'lattice', \
    'rmarkdown', \
    'patchwork', \
    'rstan', \
    'reshape2', \
    'R.matlab', \
    'loo', \
    'corrr' \
    ), repos='https://cloud.r-project.org/')"

# Set the working directory
WORKDIR /home/rstudio

# Start the RStudio server
CMD ["/init"]
#####################  Dockerfile for BayesCog  ###############################
#
# Author: Aamir Sohail, University of Birmingham
# Copyright: (C) 2025. All rights reserved.
# GitHub Repository: https://github.com/alpnlab/BayesCog
#
# Description:
# This Dockerfile sets up an RStudio environment for the BayesCog repository
# using the Rocker RStudio image. It defaults to a specific version of Rstudio
# and installs specific versions of R packages listed in the renv.lock file. 
# These versions are known to work with the BayesCog repository.
# However, you can easily switch to the latest version (for bug fixes and 
# improved features) by commenting out the relevant lines.
###############################################################################

# Use specific R version
FROM rocker/rstudio:4.4.1

# To use latest version instead, use:
# FROM rocker/rstudio:latest

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

# Install R packages with specific versions (the same as in the renv.lock file)
RUN R -e "install.packages(c(\
    'renv=1.0.11', \
    'ggplot2=3.5.1', \
    'lattice=0.22-6', \
    'rmarkdown=2.29', \
    'patchwork=1.3.0', \
    'rstan=2.32.6', \
    'reshape2=1.4.4', \
    'R.matlab=3.7.0', \
    'loo=2.8.0', \
    'corrr=0.4.4' \
    ), repos='https://cloud.r-project.org/')"

# To use latest package versions instead, remove the version numbers:
# RUN R -e "install.packages(c(\
#     'renv', \
#     'ggplot2', \
#     'lattice', \
#     'rmarkdown', \
#     'patchwork', \
#     'rstan', \
#     'reshape2', \
#     'R.matlab', \
#     'loo', \
#     'corrr' \
#     ), repos='https://cloud.r-project.org/')"

WORKDIR /home/rstudio

CMD ["/init"]
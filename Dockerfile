#####################  Dockerfile for BayesCog  ###############################
#
# Author: Aamir Sohail, University of Birmingham
# Copyright: (C) 2025. All rights reserved.
# GitHub Repository: https://github.com/alpn-lab/BayesCog
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

# Install system dependencies as root
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

# Install remotes package first as root to ensure it's available system-wide
RUN R -e "install.packages('remotes', repos='https://cloud.r-project.org/')" && \
    R -e "if (!require('remotes')) stop('remotes package failed to install')"

# Install packages with specific versions using remotes::install_version
RUN R -e " \
    remotes::install_version('renv', '1.0.11', repos='https://cloud.r-project.org/'); \
    remotes::install_version('ggplot2', '3.5.1', repos='https://cloud.r-project.org/'); \
    remotes::install_version('lattice', '0.22-6', repos='https://cloud.r-project.org/'); \
    remotes::install_version('rmarkdown', '2.29', repos='https://cloud.r-project.org/'); \
    remotes::install_version('patchwork', '1.3.0', repos='https://cloud.r-project.org/'); \
    remotes::install_version('rstan', '2.32.6', repos='https://cloud.r-project.org/'); \
    remotes::install_version('reshape2', '1.4.4', repos='https://cloud.r-project.org/'); \
    remotes::install_version('R.matlab', '3.7.0', repos='https://cloud.r-project.org/'); \
    remotes::install_version('loo', '2.8.0', repos='https://cloud.r-project.org/'); \
    remotes::install_version('corrr', '0.4.4', repos='https://cloud.r-project.org/'); \
    "

# Verify installations worked
RUN R -e " \
    packages <- c('renv', 'ggplot2', 'lattice', 'rmarkdown', 'patchwork', 'rstan', 'reshape2', 'R.matlab', 'loo', 'corrr'); \
    for(pkg in packages) { \
        if (!require(pkg, character.only = TRUE)) { \
            stop(paste('Package', pkg, 'failed to install or load')); \
        } \
    }; \
    cat('All packages successfully installed and loaded!\n'); \
    "

# Alternative: To use latest package versions instead, uncomment this and comment out the version-specific installation above:
# RUN R -e " \
#     remotes::install_cran('renv', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('ggplot2', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('lattice', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('rmarkdown', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('patchwork', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('rstan', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('reshape2', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('R.matlab', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('loo', repos='https://cloud.r-project.org/'); \
#     remotes::install_cran('corrr', repos='https://cloud.r-project.org/'); \
#     "

WORKDIR /home/rstudio

CMD ["/init"]
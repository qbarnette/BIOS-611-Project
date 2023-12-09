# Use Rocker base image for R and RStudio
FROM rocker/verse

# Install package manager
RUN apt-get update && apt-get install -y man-db
#RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*

# Unminimize the image to install additional packages and utilities
RUN unminimize

# Install R packages 
RUN R -e "install.packages(c('httr', 'lmtest', 'lubridate', 'openxlsx', 'dplyr', 'tidyverse', 'ggplot2', 'knitr', 'reshape2', 'kableExtra'), repos='https://cloud.r-project.org/')"

# Set a password for RStudio
ENV PASSWORD=squirtle1996

# Expose RStudio port (8787 by default)
EXPOSE 8787


# Use Rocker base image for R and RStudio
FROM rocker/verse

# Install package manager
RUN apt-get update && apt-get install -y man-db

# Install necessary R packages
RUN R -e "install.packages(c('FactoMineR', 'factoextra', 'ggplot2', 'Rtsne', 'mclust', 'infotheo', 'fpc', 'tidyverse', 'lubridate', 'openxlsx'), dependencies=TRUE)"

# Set a password for RStudio
ENV PASSWORD=squirtle1996





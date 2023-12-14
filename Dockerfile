# Use Rocker base image for R and RStudio
FROM rocker/verse

# Install package manager
RUN apt-get update && apt-get install -y man-db
#RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*

# Unminimize the image to install additional packages and utilities
#RUN unminimize

# Install R packages 
#RUN R -e "install.packages(c('httr', 'lmtest', 'lubridate', 'openxlsx', 'dplyr', 'tidyverse', 'ggplot2', 'knitr', 'reshape2', 'kableExtra'), repos='https://cloud.r-project.org/')"

# Install R packages
RUN R -e "install.packages('httr', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('lmtest', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('lubridate', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('openxlsx', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('dplyr', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('tidyverse', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('ggplot2', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('knitr', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('reshape2', repos='https://cloud.r-project.org/')"
RUN R -e "install.packages('kableExtra', repos='https://cloud.r-project.org/')"


# Set a password for RStudio
ENV PASSWORD=squirtle1996

# Expose RStudio port (8787 by default)
EXPOSE 8787


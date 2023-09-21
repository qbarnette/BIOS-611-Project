# Use Rocker base image for R and RStudio
FROM rocker/verse

# Install package manager
RUN apt-get update && apt-get install -y man-db
#RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*

# Install R packages 
RUN R -e "install.packages('matlab')"

# Set a password for RStudio
ENV PASSWORD=squirtle1996


# Expose RStudio port (8787 by default)
EXPOSE 8787


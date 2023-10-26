# Define the data and scripts
DATA_FILE = merged_data.csv
STATE_SCRIPT = generate_state_figure.R
AGE_SCRIPT = generate_age_group_figure.R

# Target to generate the state figure
state_figure: $(DATA_FILE) $(STATE_SCRIPT)
    Rscript $(STATE_SCRIPT)

# Target to generate the age group figure
age_group_figure: $(DATA_FILE) $(AGE_SCRIPT)
    Rscript $(AGE_SCRIPT)

# Default target
all: state_figure age_group_figure

# Clean generated figures
clean:
    rm -f state_figure.png age_group_figure.png

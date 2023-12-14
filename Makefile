# Variables
DATA_FOLDER = source_data
OUTPUT_FOLDER = output
SCRIPT_FOLDER = scripts

.PHONY: clean

all: clean preprocess visualize analyze report

clean:
    # Remove any existing output files
	rm -rf $(OUTPUT_FOLDER)/*
	rm -f Report.pdf

preprocess: prep_data

visualize: age_group_figure state_figure sex_figure racecount_figure racetime_figure

analyze: linreg_race linreg_sex

report: report.pdf

prep_data:
	Rscript $(SCRIPT_FOLDER)/prep_data.R

racecount_figure: prep_data
	Rscript $(SCRIPT_FOLDER)/racecount_figure.R
	mv $(SCRIPT_FOLDER)/racecount_figure.png $(OUTPUT_FOLDER)/racecount_figure.png

racetime_figure: prep_data
	Rscript $(SCRIPT_FOLDER)/racetime_figure.R
	mv $(SCRIPT_FOLDER)/racetime_figure.png $(OUTPUT_FOLDER)/racetime_figure.png

sex_figure: prep_data
	Rscript $(SCRIPT_FOLDER)/sex_figure.R
	mv $(SCRIPT_FOLDER)/sex_figure.png $(OUTPUT_FOLDER)/sex_figure.png

state_figure: prep_data
	Rscript $(SCRIPT_FOLDER)/state_figure.R
	mv $(SCRIPT_FOLDER)/state_figure.png $(OUTPUT_FOLDER)/state_figure.png

age_group_figure: prep_data 
	Rscript $(SCRIPT_FOLDER)/age_group_figure.R
	mv $(SCRIPT_FOLDER)/age_group_figure.png $(OUTPUT_FOLDER)/age_group_figure.png

linreg_sex: prep_data 
	Rscript $(SCRIPT_FOLDER)/linreg_sex.R

linreg_race: prep_data
	Rscript $(SCRIPT_FOLDER)/linreg_race.R

report.pdf: Report.Rmd output/racecount_figure.png output/sex_figure.png output/state_figure.png output/age_group_figure.png output/racetime_figure.png 
	Rscript -e "rmarkdown::render('./Report.Rmd')"
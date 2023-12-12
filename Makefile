# Variables
DATA_FOLDER = source_data
OUTPUT_FOLDER = output
SCRIPT_FOLDER = scripts
REPORT_FOLDER = reports

# Targets
all: clean preprocess analyze visualize report

clean:
    # Remove any existing output files
	rm -rf $(OUTPUT_FOLDER)/*

preprocess: prep_data

analyze: linreg_race linreg_sex

visualize: age_group_figure state_figure sex_figure racecount_figure racetime_figure

#report: 
	#$(REPORT_FOLDER)/report.pdf
# Report target
	#$(REPORT_FOLDER)/report.pdf: $(REPORT_FOLDER)/report.Rmd
	#Rscript -e "rmarkdown::render('$(REPORT_FOLDER)/report.Rmd', output_dir = '$(REPORT_FOLDER)', output_file = 'report.pdf')"

clean-all: clean
    # Remove all generated files and folders except source code and data
	rm -rf $(OUTPUT_FOLDER)/*
	rm -rf $(REPORT_FOLDER)/*

# Individual targets for each script

#report:
	#$(REPORT_FOLDER)/report.Rmd
   # Rscript -e "rmarkdown::render('report.Rmd', output_dir = '$(REPORT_FOLDER)', output_file = 'report.pdf')"

# Report target
report: $(REPORT_FOLDER)/report.pdf

$(REPORT_FOLDER)/report.pdf: $(REPORT_FOLDER)/report.Rmd
	Rscript -e "rmarkdown::render('report.Rmd', output_format = 'pdf_document', output_dir = '$(REPORT_FOLDER)', output_file = 'report.pdf')"


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


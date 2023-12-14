## Introduction

In the United States, there are vast racial inequities in outcomes for missing people. Black and Indigenous people, especially women, are  more likely to go missing, but they are less likely to receive media attention, spend more time lost, and tend to have worse outcomes when compared to white people. 
The NamUs (National Missing and Unidentified Persons System) database is a comprehensive, publicly accessible repository that centralizes information on missing persons and unidentified decedents in the United States. It serves as a critical resource for law enforcement, families, and the public, facilitating the collaboration and exchange of information to aid in the resolution of missing persons cases.
This project models the relationship between race/ethnicity and time spent in the database to identify inequities in the length of time individuals remain missing.


## Using this Repository
This repository can be built using a Docker with the command below:

```bash
docker build -t 611-example .
```
Then start your container using the following command:

```bash
docker run -p 8787:8787 -v $(pwd):/home/rstudio/project -it 611-example
```

If using git bash on a windows machine, the following command will work to launch the container:

```bash
winpty docker run -p 8787:8787 -v "$(pwd)":/home/rstudio/project -it 611-example
```

You then visit http://localhost:8787 via a browser on your machine to access the machine and development environment.
Username: rstudio 
Password: squirtle1996

## Generating outputs

Run the following script in the rstudio terminal to remove the report and all intermediate figures from the output folder: 

```bash
make clean
```

To make all figures and reports, run the following bash scripts in the rstudio terminal:

```bash
make racecount_figure
make sex_figure
make make age_group_figure
make state_figure
make racetime_figure
```

After generating all figures, the following script will generate the final report:

```bash
make report
```


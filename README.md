# Project

This project is a test project for the RepCo workshop.
The aim is to calculate the sample size and power needed for studying the effect of clofarabine and fludarabine exposure on clinical outcome in allo-HCT.

## Usage

- Use this template to calculate the sample size needed for your time-to-event analysis with non-binary predictors
- Use this template to calculate the power of your time-to-event analysis with non-binary predictors

Needed:
-Install the package "powerSurvEpi"
-A database with your non-binary predictor(s) and the corresponding events (1 and 0) of the outcome(s) of interest. 
-A postulated hazard ratio based on a previous (pilot) study. 

## Project Structure 

The project structure distinguishes three kinds of folders:
- read-only (RO): not edited by either code or researcher
- human-writeable (HW): edited by the researcher only.
- project-generated (PG): folders generated when running the code; these folders can be deleted or emptied and will be completely reconstituted as the project is run.


```
.
├── .gitignore
├── CITATION.cff
├── LICENSE
├── README.md
├── requirements.txt
├── data               <- All project data, ignored by git
│   ├── processed      <- The final, canonical data sets for modeling. (PG)
│   ├── raw            <- The original, immutable data dump. (RO)
│   └── temp           <- Intermediate data that has been transformed. (PG)
├── docs               <- Documentation notebook for users (HW)
│   ├── manuscript     <- Manuscript source, e.g., LaTeX, Markdown, etc. (HW)
│   └── reports        <- Other project reports and notebooks (e.g. Jupyter, .Rmd) (HW)
├── results
│   ├── figures        <- Figures for the manuscript or reports (PG)
│   └── output         <- Other output for the manuscript or reports (PG)
└── R                  <- Source code for this project (HW)

```

## Add a citation file
Create a citation file for your repository using [cffinit](https://citation-file-format.github.io/cff-initializer-javascript/#/)

## License

This project is licensed under the terms of the [MIT License](/LICENSE).

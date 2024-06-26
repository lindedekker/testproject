# Project

This project is a test project for the RepCo workshop.
The aim is to calculate the sample size and power needed for studying the effect of clofarabine and fludarabine exposure on clinical outcome in allo-HCT.

## Usage

- Use this template to calculate the sample size needed for your time-to-event analysis with non-binary predictors
- Use this template to calculate the power of your time-to-event analysis with non-binary predictors

Needed:
-git clone https://github.com/lindedekker/testproject.git
-Install the package "powerSurvEpi" & "docstring"
-A database with your non-binary predictor(s) and the corresponding events (1 and 0) of the outcome(s) of interest. 
-A postulated hazard ratio based on a previous (pilot) study. 

## Notes 
This code was written in R version 4.3.1 for Windows

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

## Session info at 27-March-2024. You can also check the renv lock file. 

R version 4.3.1 (2023-06-16 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19045)

Matrix products: default


locale:
[1] LC_COLLATE=English_Netherlands.utf8  LC_CTYPE=English_Netherlands.utf8   
[3] LC_MONETARY=English_Netherlands.utf8 LC_NUMERIC=C                        
[5] LC_TIME=English_Netherlands.utf8    

time zone: Europe/Amsterdam
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

loaded via a namespace (and not attached):
[1] compiler_4.3.1    tools_4.3.1       rstudioapi_0.16.0
# Water Contamination and Quality: A look into 2 Toronto Beaches

## Overview of paper

## File Structure 
The repository is structured as follows:

-   `input/data` contains the raw dataset and the cleaned analysis dataset used in this paper.
-   `llm` contains LLM usage notes
-   `sketches` contains the rough sketches made to visualize the types of plots of interest. 
-   `paper` contains the files used to generate the paper. This includes the Quarto documen, reference bibliography file, and the PDF of the paper. 
-   `scripts` contains the R scripts that were used to simulate, download, clean, and test the data.

## How to Run

- Run `scripts/00-simulate_data.R` to simulate envisioned data
- Run `scripts/01-download_data.R` to download raw data from opendatatoronto
- Run `scripts/02-data_cleaning.R` to generate cleaned data
- Render `outputs/paper/paper.qmd` to generate the PDF of the paper


## Notes: 

My main workflow and structure of the Github is based on the notes in Rohan Alexander's book, available at https://github.com/RohanAlexander/starter_folder and https://tellingstorieswithdata.com/

### LLM Usage Disclosure: 
Aspects of my R code and paper were assisted with the help of Chat-GPT. The chat history is available in `inputs/llms`


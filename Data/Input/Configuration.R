## @knitr INFO
# Title: Software framework for the processing and statistical analysis of multivariate MS-data
# Owner: Laboratory of Integrative Metabolomics (LIMET), Ghent university
# Creator: Dr. Marilyn De Graeve
# Maintainer: <limet@ugent.be>
# Script: Configuration


##########Global_settings##########

## @knitr settings
## options
RUN_CODE <- 'run this part of the pipeline'
DONT_RUN_CODE <- 'skip this part of the pipeline, keeps order: pre-processing - targeted analysis - statistical analysis - annotation'

## Adjustments
#Project name:
EXPERIMENT <- 'Merge_variableMetadata' #structured and short, see READ_ME
POLARITY <- "fakedata" #{"positive", "negative"} #needed this format for annotation to work
# file_conversion and pre-processing need to be performed seperate
# only choose "both" when no pre-processing needed (eg. merge both ionisationmodes)
USER_COMMENT <- "Tutorial comment" #Add info about experiment, eg. explain (Multiple)Comparisons, to include in reports

RUN_PART_MERGEVM <- RUN_CODE

#
#####################



##########Merge_variableMetadata##########
if(RUN_PART_MERGEVM == RUN_CODE){
  
  ## options
  #Source of file1 variableMetadata:
  VARIABLEMETADATA_FROM_PIPELINE <- 'automatically finds variableMetadata from R pipeline code (based on projectname), present in input folder'
  VARIABLEMETADATA_EXTERN <- 'you choose name of variableMetadata.txt below, present in input folder' #see READ_ME for structure dataframe
  
  
  ## Adjustments
  # variableMetadata file 1:
  #If you choose 'VARIABLEMETADATA_EXTERN', add additional info here:
    VARIABLEMETADATA_EXTERN <- 'VM1.txt'  #'name.txt' of file. Ignore if file created from pipeline 
    COLLUMN_NR_START_SAMPLES <- 20  #always 20 (auto and manual must be same format); unless extra col merged!
  
  #Source of variableMetadata file 1:
  INPUT_VARIABLES1 <- VARIABLEMETADATA_EXTERN
  
  # variableMetadata file 2:
  INPUT_VARIABLES2 <- 'VM2.txt'  #'name.txt' of file.
  
}
#
#####################

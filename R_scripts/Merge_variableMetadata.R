# Title: Software framework for the processing and statistical analysis of multivariate MS-data
# Owner: Laboratory of Integrative Metabolomics (LIMET), Ghent university
# Creator: Dr. Marilyn De Graeve
# Maintainer: <limet@ugent.be>
# Script: Part I bis: Merge variableMetadata


##########R Pipeline - Extra: Merge variableMetadata##########
print(Sys.time())
print("R pipeline - Extra: Merge variableMetadata - start!")
# Extra: Merge variableMetadata

## data_loading
setwd(path_data_in)

#needs to be VM1 in config so no conflict with p2 vm if from choose data_from_pipeline
variableMetadata1 <- load_variableMetadata(INPUT_VARIABLES1) 
if (INPUT_VARIABLES1 == VARIABLEMETADATA_FROM_PIPELINE){
  INPUT_VARIABLES1 <- paste(name_project, '_variableMetadata.txt', sep="")
  if(exists("COLLUMN_NR_START_SAMPLES") == FALSE){ 		#if not yet defined, do here 
    COLLUMN_NR_START_SAMPLES <- 20  #always 20 (auto and manual must be same format)
  }
}
variableMetadata2 <- load_variableMetadata(INPUT_VARIABLES2) 
#note: automatically adds X to samples at this point

variableMetadata <- merge_two_variableMetadata(variableMetadata1, variableMetadata2)
COLLUMN_NR_START_SAMPLES <- COLLUMN_NR_START_SAMPLES + 1 #change COLLUMN_NR_START_SAMPLES outside function (no multiple return function in R)
write_dataframe_as_txt_file(variableMetadata, paste(name_project, '_variableMetadata.txt', sep="")) #input for R_pipeline, replaces input


## set directory to output
setwd(path_data_out)
write_dataframe_as_txt_file(variableMetadata, paste(name_project, '_variableMetadata_output_merge_variableMetadata.txt', sep="")) #copy for user


print("R pipeline - Extra: Merge variableMetadata - done!")
print(Sys.time())
#
#####################
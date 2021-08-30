# Data associated with the manuscript __Three new Cenomanian conifers from El Chango (Chiapas, Mexico) offer a snapshot of the geographic mosaic of the Mesozoic conifer decline__

## Description of the files

In folder "db":

data_matrix.txt > File readable by TNT that contains the continuous trait morphological matrix, the categorical traits morphological matrix, and the alignment of the molecular markers rbcL and matK for 72 extant and 3 fossil terminals. 

In folder "R_script"

TNT_output_processing.R > R script to perfom the post processing of TNT output files. We have code to calculate the bootstrap support values, and to modify the TNT output syntax into Nexus and Newick format to be able to visualize the trees in FigTree.

In folder "TNT_output"

bltree.nex > tree exported from TNT using the function "calculate branch lengths". The tree shows the number of steps per branch. The output format is not compatible with any other software. The syntax can be modified with the R script to a nexus file (readable by other software).

boot100.tre > Bootstrap trees calculated in TNT and exported as nexus file.

MPtrees.nex > The four most parsimonious trees obtained from the analysis, exported from TNT.



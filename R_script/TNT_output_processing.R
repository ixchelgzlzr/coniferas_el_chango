##########################
# Processing TNT outputs #
##########################

#Load libraries
#you might need to install the packages previously if you don't have them
#install.packages(stringr)
#install.packages(phangorn)
library(stringr)
library(phangorn)
library(TreeTools)
library(phytools)

#set wd
setwd( "your_directory_here")

#We want to represent the bootstrap values on a tree with branch lengths that 
#we exported from TNT, but we need to manually modify the tree syntax to a newick
#format so it can be read in Fig tree
  #read the tree with branch lengths
text <- readr::read_file("bltree.nex")

  #get rid of the multiple /// in the synthax
b<-str_remove_all(text, regex("[0123456789.]{5,}\\/"))

  #write a file with branch lengths in newick format
writeLines(b, 'tree_bl.txt') #for our records

  #read the newick format
tree <- read.newick('tree_bl.txt')

  #see the beautiful tree with branch lengths!
plotTree(tree)
writeNexus(tree, file = "nexus/tree_distances.tree")


#Now we move into bootstrap calculation on one of our MPT trees
  #Read the most parsimonious trees
mpt <- ReadTntTree('MPtrees.nex')
writeNexus(mpt, file = 'nexus/mpt.tre') #for our records

  #Read bootstrap trees
boot <- ReadTntTree('boot100.tre') #for our records
writeNexus(boot, file = "nexus/boots100.tre")

  #Define the tree that will be used as reference for bootstrap calculation
mpt1 <- as.phylo(mpt[[1]])

  #adding the bootstrap values to the tree!
mpt1.boot <- addConfidences(mpt1, boot)
writeNexus(mpt1.boot, file = "nexus/confid.tree")


###Now we have bootstrap values! As a final step we want to represent them on a tree 
# with branch lengths
#bootstrap on the tree with branch lengths
tree.bl.boot <- addConfidences(tree, boot)
writeNexus(tree.bl.boot, file = 'nexus/confid_bl_tree.tree') #this is the tree we show on our results


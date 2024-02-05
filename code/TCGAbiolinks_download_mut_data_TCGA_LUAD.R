library("TCGAbiolinks")
library("tidyverse")

# Download mutational data (hg38):
tcga_maf <- GDCquery(project = "TCGA-LUAD", 
                     data.category = "Simple Nucleotide Variation", # Simple nucleotide variation if legacy
                     access = "open", 
                     legacy = F)
tcga_maf$data.type <- "Masked Somatic Mutation"
GDCdownload(tcga_maf,
            directory = "/home/benedek_danko/R/coding_exercise_TCGA_infiltration/data")
tcga_maf <- GDCprepare(tcga_maf,
                       directory = "/home/benedek_danko/R/coding_exercise_TCGA_infiltration/data")
# Export as df:
write.table(as.data.frame(tcga_maf),
            "/home/benedek_danko/R/coding_exercise_TCGA_infiltration/data/TCGA_LUAD_SNV_harmonized.txt",
            sep="\t", row.names = F, col.names = T, quote = F)
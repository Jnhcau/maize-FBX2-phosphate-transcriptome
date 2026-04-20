#prepare gff/gtf
dexseq_prepare_annotation2.py -f Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.dexseq.gtf Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.gtf Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.dexseq.gff

#featureCounts
featureCounts -f -O -p -T 40 -F GTF -a Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.dexseq.gtf -o KO_WT *.bam


############ Downstream analysis in R ############
source("load_SubreadOutput.R")
library("DEXSeq")
samp <- data.frame(
  row.names = c(
    "NP_KO_leaf1",
    "NP_KO_leaf2",
    "NP_KO_leaf3",
    "NP_B104_leaf1",
    "NP_B104_leaf2",
    "NP_B104_leaf3"
  ),
  condition = rep(c("KO", "WT"), each = 3)
)

dxd.fc <- DEXSeqDataSetFromFeatureCounts("KO_WT.dexcounts",
                                         flattenedfile = "Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.dexseq.gtf",sampleData = samp)
                                         
dxd.fc <- estimateSizeFactors(dxd.fc)
dxd.fc <- estimateDispersions(dxd.fc)
dxd.fc <- testForDEU(dxd.fc)
dxd.fc <- estimateExonFoldChanges(dxd.fc, fitExpToVar = "condition")
results <- DEXSeqResults(dxd.fc)
save(results, file = "DEXSeq_results.RData")


plotDEXSeq(results,geneID="Zm00001eb000010", colorBy = "condition", legend = TRUE,cex.axis=1.2, cex=1.3, lwd=2,norCounts=TRUE)

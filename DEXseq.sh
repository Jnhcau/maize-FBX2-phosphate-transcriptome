dexseq_prepare_annotation2.py -f Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.dexseq.gtf Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.gtf Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.dexseq.gff

featureCounts -f -O -p -T 40 -F GTF -a Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.dexseq.gtf -o KO_WT *.bam


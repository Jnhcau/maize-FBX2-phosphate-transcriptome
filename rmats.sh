export LD_LIBRARY_PATH=/home/jianianhua/miniconda3/lib:$LD_LIBRARY_PATH
rmats.py --b1 LP.txt --b2 NP.txt --gtf Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.gtf --od LP_vs_NP-root -t paired --variable-read-length --readLength 150 --nthread 10 --tmp LP_vs_NP-root/tmp

rmats2sashimiplot --b1 LP.txt --b2 NP.txt -c 5:+:203935505:203935578:Zea_mays.Zm-B73-REFERENCE-NAM-5.0.52.gff3 -o test  --l1 SampleOne --l2 SampleTwo --group-info group.txt


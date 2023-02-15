

# Create a task that runs samtools index on a BAM file
az batch task create `
  --pool-id pool1 `
  --job-id minimalrequirementjob `
  --task-id minimalrequirementtask `
  --command-line "samtools index ./wgEncodeUwRepliSeqBg02esG1bAlnRep1.bam; exit 0"
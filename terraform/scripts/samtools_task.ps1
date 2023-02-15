param([String]$env = "dev")


if ("dev" -eq $env)
{
    echo "Launching SAMTOOLS task in DEV environment..."
    # Create a task that runs samtools index on a BAM file
    az batch task create `
      --pool-id pool1 `
      --job-id samtooljob `
      --task-id samtoolstask `
      --command-line "samtools index ./wgEncodeUwRepliSeqBg02esG1bAlnRep1.bam; exit 0"
}

if ("prd" -eq $env)
{
    echo "Launching SAMTOOLS task in PRD environment..."
    az batch task create `
      --pool-id batchpoolprd `
      --job-id samtooljob `
      --task-id samtoolstask `
      --command-line "samtools index ./wgEncodeUwRepliSeqBg02esG1bAlnRep1.bam; exit 0"
}

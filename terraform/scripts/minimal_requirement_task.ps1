param([String]$env = "dev")


if ("dev" -eq $env)
{
    echo "Initializing infrastructure for DEV environment..."
    az batch task create `
      --pool-id batchpooldev `
      --job-id minimalrequirementjob `
      --task-id minimalrequirementtask `
      --command-line "ls -ltrh /opt; exit 0"
}

if ("prd" -eq $env)
{
    echo "Initializing infrastructure for PRD environment..."
    az batch task create `
      --pool-id batchpoolprd `
      --job-id minimalrequirementjob `
      --task-id minimalrequirementtask `
      --command-line "ls -ltrh /opt; exit 0"
}


# Create a task with basic instruction
az batch task create `
  --pool-id pool1 `
  --job-id minimalrequirementjob `
  --task-id minimalrequirementtask `
  --command-line "ls -ltrh /opt; exit 0"

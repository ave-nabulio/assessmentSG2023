
# Create a task with basic instruction
az batch task create \
  --task-id minimalrequirementjob \
  --job-id joboptimalracer \
  --command-line "ls -ltrh /opt"

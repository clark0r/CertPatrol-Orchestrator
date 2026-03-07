docker run -d \
  -p 8880:8080 \
  -v certpatrol-data:/data \
  -e SECRET_KEY="change-this-secret" \
  -e MANAGER_HOST="0.0.0.0" \
  -e MANAGER_PORT="8080" \
  --name certpatrol \
  ghcr.io/clark0r/certpatrol-orchestrator

#!/bin/bash
cd ~/certpatrol/CertPatrol-Orchestrator

# update code to latest version
git reset --hard
git pull

# build container from latest code
docker build -t ghcr.io/clark0r/certpatrol-orchestrator:latest .

# push container to github container repo
docker push ghcr.io/clark0r/certpatrol-orchestrator:latest

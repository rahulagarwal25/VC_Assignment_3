#!/bin/bash
INSTANCE_NAME="python-app-instance"
ZONE="us-central1-a"

gcloud compute ssh $INSTANCE_NAME --zone=$ZONE --command "
  if ! command -v docker &> /dev/null; then
      sudo apt update && sudo apt install -y docker.io
      sudo systemctl enable --now docker
  fi
  sudo docker pull gcr.io/astute-charter-213919/python-app
  sudo docker run -d --restart=always -p 5000:5000 gcr.io/astute-charter-213919/python-app
"
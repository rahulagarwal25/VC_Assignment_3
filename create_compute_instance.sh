#!/bin/bash
INSTANCE_NAME="python-app-instance"
ZONE="us-central1-a"
PROJECT_ID="astute-charter-213919"

gcloud compute instances create $INSTANCE_NAME \
  --project=$PROJECT_ID \
  --zone=$ZONE \
  --machine-type=e2-micro \
  --image-family=debian-10 \
  --image-project=debian-cloud \
  --boot-disk-size=10GB \
  --tags=http-server \
  --preemptible
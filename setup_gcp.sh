#!/bin/bash
export GOOGLE_APPLICATION_CREDENTIALS=~/.gcp_credentials/credentials.json

echo "Activating GCP Service Account"
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

echo "Configuring Docker"
gcloud auth configure-docker --quiet

echo "Authentication successful"
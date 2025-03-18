#!/bin/bash

PROJECT_ID="astute-charter-213919"
ZONE="us-central1-c"
INSTANCE_NAME="python-app-instance"
DISK_TYPE="pd-balanced"
IMAGE="projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20250313"
MACHINE_TYPE="e2-micro"
SERVICE_ACCOUNT="g24ai1058-service@astute-charter-213919.iam.gserviceaccount.com"


gcloud compute instances create $INSTANCE_NAME \
    --project=$PROJECT_ID \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=$SERVICE_ACCOUNT \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/trace.append \
    --tags=http-server,https-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=$INSTANCE_NAME,image=$IMAGE,mode=rw,size=10,type=$DISK_TYPE \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=none \
    --threads-per-core=1


echo "Instance $INSTANCE_NAME created successfully."

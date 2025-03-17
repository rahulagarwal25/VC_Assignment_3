#!/bin/bash


docker run -d -p 5000:5000 \
  -v ~/.gcp_credentials/credentials.json:/app/credentials.json \
  -e GOOGLE_APPLICATION_CREDENTIALS=/app/credentials.json \
  python-app
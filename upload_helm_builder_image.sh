#!/bin/bash
git clone https://github.com/GoogleCloudPlatform/cloud-builders-community.git
cd cloud-builders-community/helm
echo "Entey the gcp project name you want to push the helm builder image"
read -p "gcp project name" project_name
let gcr_address=gcr.io/${project_name}/helm
docker build -t ${gcr_address} .
echo "Start to upload helm builder image for gcp cloudbuild"
echo "to ${gcr_address}..."
docker push ${gcr_address}
echo "Job done!"
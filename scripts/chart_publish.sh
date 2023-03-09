#!/bin/bash

set -x

# Set up script variables
CHARTS_DIR=../charts
HELMREPO_NAME=simplerepo
GITREPO_NAME=very-simple-helm-repo
GITREPO_OWNER=adamma-da

# Loop through the helm charts in the designated folder
for chart in $CHARTS_DIR/*; do
    # Get the chart name and version from the Chart.yaml file and load them into vars
    chart_name=$(yq eval '.name' $chart/Chart.yaml)
    chart_version=$(yq eval '.version' $chart/Chart.yaml)

    # Check if the chart version has already been pushed to the repo
    if helm search repo $HELMREPO_NAME/$chart_name -o yaml | grep --silent -w "version: $chart_version"; then
        echo "Chart $chart_name version $chart_version already exists in repository $HELMREPO_NAME"
    else
        # Handling the version incremented chart
        helm package $chart -d ../docs
        echo "Chart $chart_name version $chart_version has been pushed to repository $HELMREPO_NAME"
        
    fi
done
helm repo index ../docs --url https://adamma-da.github.com/very-simple-helm-repo/docs
#rm ../.cr-release-packages/*.tgz

#!/bin/bash
# @author: Wolfgang Kulhanek
# @email:  wkulhane@redhat.com
# ----------------------------
# Run a Local OpenShift Cluster in Home Directory
#
# Edit the oc_config.sh script for configuration options.
#
# This script persists data and configuration between restarts.
#
# This script has been written for macOS but should work just as well on
# any other Unix based environment

# Read configuration
source ./oc_config.sh

function startCluster() {
  oc cluster up \
    --image=$OSREGISTRY \
    --version=$OSVERSION \
    --host-data-dir=$OSHOME/OpenShiftData \
    --host-volumes-dir=$OSHOME/OpenShiftVolumes \
    --host-config-dir=$OSHOME/OpenShiftConfig \
    --public-hostname=127.0.0.1 \
    --use-existing-config
    # --metrics=true \
}

function setupDirectories {
  mkdir -p $OSHOME/OpenShiftConfig
  mkdir -p $OSHOME/OpenShiftData
  for i in `seq -f "%03g" 1 $NUM_VOLUMES`
  do
    mkdir -p $OSHOME/OpenShiftVolumes/volume_${i}
  done
}

function createPV() {
  for i in `seq -f "%03g" 1 $NUM_VOLUMES`
  do
    echo "apiVersion: v1
kind: PersistentVolume
metadata:
  name: volume${i}
spec:
  accessModes:
  - ReadWriteOnce
  capacity:
    storage: 5Gi
  hostPath:
    path: ${OSHOME}/OpenShiftVolumes/volume_${i}
  persistentVolumeReclaimPolicy: Recycle" | oc create -f -
  done
}

function setupTechPreview() {
  echo "window.OPENSHIFT_CONSTANTS.ENABLE_TECH_PREVIEW_FEATURE.pipelines = true;" > $OSHOME/OpenShiftConfig/master/tech-preview.js

  sed -i .bak "s|extensionScripts: null|extensionScripts:|" "${OSHOME}/OpenShiftConfig/master/master-config.yaml"
  sed -i .bak '/extensionScripts:/a\
\ \ - /var/lib/origin/openshift.local.config/master\/tech-preview.js\
' "${OSHOME}/OpenShiftConfig/master/master-config.yaml"

  rm "${OSHOME}/OpenShiftConfig/master/master-config.yaml.bak"
}

echo "**"
echo "** ------------------"
echo "** OC Cluster Wrapper"
echo "** ------------------"
echo
echo "** Checking for previous configuration..."
echo "**"
# Test if configuration exists
if [ ! -f "$OSHOME/OpenShiftConfig/master/master-config.yaml" ]; then
  # No configuration -> Set things up
  echo "**"
  echo "**  New Setup"
  echo "**"
  # Set up Directories
  setupDirectories

  echo "**"
  echo "**  Starting initial cluster"
  echo "**"
  # Start the cluster initially
  startCluster

  echo "**"
  echo "**  Configuring initial cluster"
  echo "**"
  oc login -u system:admin
#  oc login -u system:admin https://127.0.0.1:8443
  oc adm policy add-cluster-role-to-user cluster-admin developer

  echo "**"
  echo "**  Creating PVs"
  echo "**"
  # Create PVs
  createPV

  echo "**"
  echo "**  Shutting down cluster"
  echo "**"
  # Take cluster down
  oc cluster down

  echo "**"
  echo "**  Setting up Tech Preview Features"
  echo "**"
  # Set up Tech Preview Features
  setupTechPreview

  echo "**"
  echo "** Initial Setup Complete"
  echo "**"
else
  echo "**"
  echo "**  Found previous configuration"
  echo "**"
fi

# Set up Complete (or not first start)
# Now start cluster
echo "**"
echo "** Starting Cluster"
echo "**"
startCluster

echo "**"
echo "** Cluster Initialization Complete"
echo "**"

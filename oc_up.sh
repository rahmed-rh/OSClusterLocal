#!/bin/bash
# @author: Wolfgang Kulhanek
# @email:  wkulhane@redhat.com
# ----------------------------
# Run a Local OpenShift Cluster in Home Directory
#
# This script persists data and configuration between restarts.
#
# Setting up Persistent Volumes:
#   After the Cluster is up and running and you are logged in as
#   system:admin run the setup_pvs.sh script to set up your physical Volumes
#
# Change OSHOME to your preferred location.
#
# This script has been written for macOS but should work just as well on
# any other Unix based environment

# ----- No Changes below this line -----

source ./oc_config.sh

oc cluster up \
	--host-data-dir=$OSHOME/OpenShiftData \
	--host-volumes-dir=$OSHOME/OpenShiftVolumes \
	--host-config-dir=$OSHOME/OpenShiftConfig \
	--metrics=false \
	--public-hostname=127.0.0.1 \
	--image=registry.access.redhat.com/openshift3/ose \
	--version=v3.3.1.5 \
	--use-existing-config

# oc login -u system:admin https://127.0.0.1:8443
# oc adm policy add-cluster-role-to-user cluster-admin developer

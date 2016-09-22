#!/bin/bash
# @author: Wolfgang Kulhanek
# @email:  wkulhane@redhat.com
# ----------------------------
# Run a Local OpenShift Cluster in Home Directory
#
# This script persists data and configuration between restarts.
#
# Limitations: If your IP Address changes the cluster will no longer come
#              up since there are a lot of IP specific configurations
#              In that case clean up the environment and set up a new one.
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

# Workaround for bug in 1.3.rc1 and Docker 1.12.a (no longer necessary with Docker 1.12.1)
# docker run -v /:/rootfs -ti --rm --entrypoint=/bin/bash --privileged openshift/origin:v1.3.0-rc1 -c "mv /rootfs/bin/findmnt /rootfs/bin/findmnt.backup"

oc cluster up \
	--host-data-dir=$OSHOME/OpenShiftData \
	--host-volumes-dir=$OSHOME/OpenShiftVolumes \
	--host-config-dir=$OSHOME/OpenShiftConfig \
	--metrics=true \
	--use-existing-config

oc login -u system:admin
# oc adm policy add-cluster-role-to-user cluster-admin developer

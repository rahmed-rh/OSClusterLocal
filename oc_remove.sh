#!/bin/bash
# @author: Wolfgang Kulhanek
# @email:  wkulhane@redhat.com
# ----------------------------
# Delete / Reset up a Directory Structure to run a Local OpenShift
# Cluster in Home Directory.
#
# This script has been written for macOS but should work just as well on
# any other Unix based environment
#
# Change OSHOME in os_config.sh to your preferred location.
#
# -------------------------------------------------------------
# CAREFUL: THIS SCRIPT WILL REMOVE EVERYTHING UNDER OSHOME!!!!!
# -------------------------------------------------------------

source ./oc_config.sh

rm -rf $OSHOME/OpenShiftConfig
rm -rf $OSHOME/OpenShiftData
rm -rf $OSHOME/OpenShiftVolumes

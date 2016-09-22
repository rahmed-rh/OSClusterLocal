#!/bin/bash
# @author: Wolfgang Kulhanek
# @email:  wkulhane@redhat.com
# ----------------------------
# Set up a Directory Structure to run a Local OpenShift Cluster
# in Home Directory.
#
# Change OSHOME in os_config.sh to your preferred location.
# This script will also prepare the environment to use
# Persistent Volumes. The default is 5 persistent volumes.
#
# Change the NUMVOLUMES in os_config.sh if you need more / less PVs.
#
# This script has been written for macOS but should work just as well on
# any other Unix based environment

source oc_config.sh

for i in `seq 1 $NUM_VOLUMES`
do
  VOLUMENAME=volume${i}
  echo \
"apiVersion: v1
  kind: PersistentVolume
metadata:
  creationTimestamp: null
  name: ${VOLUMENAME}
spec:
  accessModes:
  - ReadWriteOnce
  capacity:
    storage: 1Gi
  hostPath:
    path: ${OSHOME}/OpenShiftVolumes/${VOLUMENAME}
  persistentVolumeReclaimPolicy: Retain
status: {}" >tmp.txt #| oc create -f -
done

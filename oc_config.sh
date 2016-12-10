#!/bin/bash
# @author: Wolfgang Kulhanek
# @email:  wkulhane@redhat.com
# ----------------------------
# Change OSHOME to your preferred location.
# Change the NUMVOLUMES variable to specify how many PVs to set up
# Change OSREGISTRY to use a different OpenShift registry (e.g. OpenShift Origin)
# Change OSVERSION to use a different OpenShift version
#
# This script has been written for macOS but should work just as well on
# any other Unix based environment

OSHOME=$HOME/OSCluster

OSREGISTRY=registry.access.redhat.com/openshift3/ose
OSVERSION=v3.3.1.7
NUM_VOLUMES=20

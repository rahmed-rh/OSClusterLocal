#!/bin/bash

function createNexusPVC() {
  echo "apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nexus
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: "5Gi"
" | oc create -f -
}

oc new-project cicd --display-name="CI/CD Shared Environment"
createNexusPVC
oc new-app sonatype/nexus3

oc volume dc nexus3 --add --name=nexus3-1 --type=PersistentVolumeClaim --claim-name=nexus --overwrite

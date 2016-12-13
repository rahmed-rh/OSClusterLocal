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
oc new-app sonatype/nexus3 --name=nexus3 -n cicd
oc expose svc/nexus3

# First remove all volumes
oc volume dc nexus3 --remove --confirm
sleep 1

# Then add a new volume
oc volume dc nexus3 --add --name=nexus3-1 --type=PersistentVolumeClaim \
 --claim-name=nexus --mount-path=/nexus-data

# Now add a Jenkins with persistent Storage
oc new-app jenkins-persistent --param MEMORY_LIMIT=1Gi \
 --param VOLUME_CAPACITY=5Gi --param JENKINS_PASSWORD=admin123 -n cicd

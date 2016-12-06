#!/bin/bash
oc login -u system:admin
oc delete is --all -n openshift
oc create -f https://raw.githubusercontent.com/openshift/origin/master/examples/image-streams/image-streams-rhel7.json -n openshift
oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/jboss-image-streams.json -n openshift


# OpenShift Cluster on Laptop

Instructions and support files to create an Open Shift Installation on your laptop (Mac)

### Prerequisites

- [Docker 1.12.1](https://www.docker.com/products/docker)
- [OpenShift Enterprise Client](https://access.redhat.com/downloads/content/290) or [OpenShift Origin Client](https://github.com/openshift/origin/releases)
  - Note that before OpenShift 3.3 has been released you will need to get it via Origin at [HomeBrew](http://brew.sh)
  - Once HomeBrew is installed you can install it via `brew install --devel openshift-cli`

### Installation Steps

1. Edit oc_config.sh to reflect your environment
  - Change OSHOME to your preferred location
  - Change the NUMVOLUMES if you need more / less Persistent Volumes than the default number of 5
2. Run oc_setup.sh
3. Make sure Docker is running
4. Run oc_up.sh to start your cluster
  - Pay attention to the output for the IP Address of your master
  - This is where you need to point your browser to for the OpenShift Console.
  - Default Developer Account is `developer` with password `developer`
5. Run oc_createpv.sh to create your Persistent Volumes (note this does't work yet...)

Use "oc cluster down" to shutdown the cluster when you are done.

Use oc_remove.sh to completely remove the cluster information (e.g. when your IP Address has changed and you need to set up from scratch).

### Limitations

- IP Addresses


# Other

Set up a Directory Structure to run a Local OpenShift Cluster in Home Directory.

  This script will also prepare the environment to use
 Persistent Volumes. The default is 5 persistent volumes.

 Change the NUMVOLUMES in os_config.sh if you need more / less PVs.

 This script has been written for macOS but should work just as well on
 any other Unix based environment

 Run a Local OpenShift Cluster in Home Directory

 This script persists data and configuration between restarts.

 Limitations: If your IP Address changes the cluster will no longer come
              up since there are a lot of IP specific configurations
              In that case clean up the environment and set up a new one.

 Setting up Persistent Volumes:
   After the Cluster is up and running and you are logged in as
   system:admin run the setup_pvs.sh script to set up your physical Volumes


 This script has been written for macOS but should work just as well on
 any other Unix based environment

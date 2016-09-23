# OpenShift Cluster on Laptop

Instructions and support files to create an Open Shift Installation on your laptop.

Note that these scripts have been written for macOS but should work just as well on any other Unix based environment.

### Prerequisites

- [Docker 1.12.1](https://www.docker.com/products/docker)
- [OpenShift Enterprise Client](https://access.redhat.com/downloads/content/290) or [OpenShift Origin Client](https://github.com/openshift/origin/releases)
  - Note that before OpenShift 3.3 has been released you will need to get it via Origin at [HomeBrew](http://brew.sh)
  - Once HomeBrew is installed you can install it via `brew install --devel openshift-cli`

### Installation Steps

1. Edit `oc_config.sh` to reflect your environment
  - Change OSHOME to your preferred location
  - Change the NUMVOLUMES if you need more / less Persistent Volumes than the default number of 5
2. Run `oc_setup.sh` to create the directories for the local OpenShift cluster to store configuration data and persistent volumes
3. Make sure Docker is running
4. Run `oc_up.sh` to start your cluster
  - Pay attention to the output for the IP Address of your master
  - This is where you need to point your browser to for the OpenShift Console.
  - Default Developer Account is `developer` with password `developer`
5. Run `oc_createpv.sh` to create your Persistent Volumes

Use `oc cluster down` to shutdown the cluster when you are done.

Use `oc_remove.sh` to completely remove the cluster information (e.g. when your IP Address has changed and you need to set up from scratch).

For subsequent uses (on the same IP Address) use `oc_up.sh` to start the cluster and `oc cluster down` to shut down the cluster.

### Limitations

- IP Addresses: When your IP Address changes (e.g. when moving from home office to office) the cluster will no longer work since IP Addresses are hard coded into configuration files.
  - One workaround (not tested) may be to set this up in a Virtual Machine where the local IP address always stays the same.

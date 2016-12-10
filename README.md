# OpenShift Cluster on Laptop

Instructions and support files to create an Open Shift Installation on your laptop.

Note that these scripts have been written for macOS but should work just as well on any other Unix based environment.

### Prerequisites

- [Docker 1.12.3](https://www.docker.com/products/docker)
- [OpenShift Enterprise Client](https://access.redhat.com/downloads/content/290) or [OpenShift Origin Client](https://github.com/openshift/origin/releases)

### Installation Steps

1. Edit `oc_config.sh` to reflect your environment
  - Change OSHOME to your preferred location
  - Change NUMVOLUMES if you need more / less Persistent Volumes than the default number of 20
  - Change OSREGISTRY if you want another OpenShift version (e.g. OpenShift Origin)
  - Change OSVERSION if you want another version of OpenShift
2. Make sure Docker is running
3. Run `oc_up.sh` to start your cluster
  - Default Developer Account is `developer` with password `developer`. This account will be set up with full Cluster Admin priviledges

Use `oc cluster down` to shutdown the cluster when you are done.

Use `oc_remove.sh` to completely remove the cluster information (e.g. when your IP Address has changed and you need to set up from scratch).

For subsequent uses use `oc_up.sh` to start the cluster (with the same configuration as before) and `oc cluster down` to shut down the cluster.

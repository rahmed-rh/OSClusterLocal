# OSClusterLocal
Instructions and support files to create an Open Shift Installation on your laptop (Mac)

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

#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

# Check for cluster name as first (and only) arg
CLUSTER_NAME=$1
NUM_NODES=$2
MACHINE_TYPE=n1-standard-1
NETWORK=default
ZONE=asia-northeast1-c
GKE_VERSION=1.8.5-gke.0

# DISK_C0BAN_13_NAME=c0ban-block-c0ban-13

# Source the config
if ! gcloud container clusters describe ${CLUSTER_NAME} > /dev/null 2>&1; then
  echo "* Creating Google Container Engine cluster \"${CLUSTER_NAME}\"..."
  # Create cluster
  gcloud container clusters create ${CLUSTER_NAME} \
    --num-nodes ${NUM_NODES} \
    --machine-type ${MACHINE_TYPE} \
    --num-nodes ${NUM_NODES} \
    --zone ${ZONE} \
    --cluster-version ${GKE_VERSION} \
    --network ${NETWORK} || error_exit "Error creating Google Container Engine cluster"
  echo "done."
else
  echo "* Google Container Engine cluster \"${CLUSTER_NAME}\" already exists..."
fi

# DISK
gcloud compute disks create --size 20GB --type pd-ssd lightning-test-0

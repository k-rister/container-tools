#!/bin/bash - 
#===============================================================================
#
#          FILE: env.sh
# 
#         USAGE: ./env.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jianzhu Zhang (), jianzzha@redhat.com
#  ORGANIZATION: NFV Perf
#       CREATED: 03/17/2020 12:38:49 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
CNI_IMAGE_DIGEST=$(skopeo inspect docker://quay.io/openshift/origin-sriov-cni:${OCP_VERSION} | jq --raw-output '.Digest')
export SRIOV_CNI_IMAGE=${SRIOV_CNI_IMAGE:-quay.io/openshift/origin-sriov-cni@${CNI_IMAGE_DIGEST}}
DP_IMAGE_DIGEST=$(skopeo inspect docker://quay.io/openshift/origin-sriov-network-device-plugin:${OCP_VERSION} | jq --raw-output '.Digest')
export SRIOV_DEVICE_PLUGIN_IMAGE=${SRIOV_DEVICE_PLUGIN_IMAGE:-quay.io/openshift/origin-sriov-network-device-plugin@${DP_IMAGE_DIGEST}}
INJECTOR_IMAGE_DIGEST=$(skopeo inspect docker://quay.io/openshift/origin-sriov-dp-admission-controller:${OCP_VERSION} | jq --raw-output '.Digest')
export NETWORK_RESOURCES_INJECTOR_IMAGE=${NETWORK_RESOURCES_INJECTOR_IMAGE:-quay.io/openshift/origin-sriov-dp-admission-controller@${INJECTOR_IMAGE_DIGEST}}
DAEMON_IMAGE_DIGEST=$(skopeo inspect docker://quay.io/openshift/origin-sriov-network-config-daemon:${OCP_VERSION} | jq --raw-output '.Digest')
export SRIOV_NETWORK_CONFIG_DAEMON_IMAGE=${SRIOV_NETWORK_CONFIG_DAEMON_IMAGE:-quay.io/openshift/origin-sriov-network-config-daemon@${DAEMON_IMAGE_DIGEST}}
WEBHOOK_IMAGE_DIGEST=$(skopeo inspect docker://quay.io/openshift/origin-sriov-network-webhook:${OCP_VERSION} | jq --raw-output '.Digest')
export SRIOV_NETWORK_WEBHOOK_IMAGE=${SRIOV_NETWORK_WEBHOOK_IMAGE:-quay.io/openshift/origin-sriov-network-webhook@${WEBHOOK_IMAGE_DIGEST}}
OPERATOR_IMAGE_DIGEST=$(skopeo inspect docker://quay.io/openshift/origin-sriov-network-operator:${OCP_VERSION} | jq --raw-output '.Digest')
export SRIOV_NETWORK_OPERATOR_IMAGE=${SRIOV_NETWORK_OPERATOR_IMAGE:-quay.io/openshift/origin-sriov-network-operator@${OPERATOR_IMAGE_DIGEST}}
export RELEASE_VERSION=${OCP_VERSION}
export OPERATOR_NAME=sriov-network-operator
export RESOURCE_PREFIX=openshift.io
export ENABLE_ADMISSION_CONTROLLER='false'



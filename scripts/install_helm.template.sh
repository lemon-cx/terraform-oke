#!/bin/bash
# Copyright 2017, 2019, Oracle Corporation and/or affiliates.  All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f .helm_completed ]; then
  curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
  helm repo add stable https://charts.helm.sh/stable --force-update

  echo "source <(helm completion bash)" >> ~/.bashrc
  echo "alias h='helm'" >> ~/.bashrc
  echo "helm completed"
  touch .helm_completed
fi
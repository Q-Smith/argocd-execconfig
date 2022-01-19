#!/bin/bash

TOKEN=$(curl -s -H 'Metadata-Flavor: Google' http://169.254.169.254/computeMetadata/v1/instance/service-accounts/$1/token)
echo $TOKEN | jq '.access_token | { apiVersion: "client.authentication.k8s.io/v1beta1", kind: "ExecCredential", status: {token: .} }'

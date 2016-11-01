#!/bin/bash
docker-machine create \
  --driver generic \
  --generic-ip-address=127.0.0.1 \
  --generic-ssh-key ~/.vagrant.d/insecure_private_key \
  vm

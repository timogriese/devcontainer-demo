#!/bin/bash
set -e

###############################################
# run OUTSIDE of the DevContainer in the WSL! #
###############################################

# all files linked to /etc/ssl/certs/... in the wsl
cp -v /usr/local/share/ca-certificates/LVM_Root_CA.crt ./certs/
cp -v /usr/local/share/ca-certificates/LVM_Root_CA_2.crt ./certs/
cp -v /usr/local/share/ca-certificates/LVM_Services_CA.crt ./certs/
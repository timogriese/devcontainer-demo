#!/bin/bash
set -e

###############################################
# run OUTSIDE of the DevContainer in the WSL! #
###############################################

# all files linked to /etc/ssl/certs/... in the wsl
cp -v /usr/share/keyrings/lap_lvm.de.gpg ./ubuntu-repos/
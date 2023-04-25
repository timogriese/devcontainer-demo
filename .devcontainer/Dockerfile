FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04
# 22.04 jammy

# switch to user root
USER root

#####################
# add the LVM certs #
#####################

# update the certs using ./scripts/updateLvmCerts.sh
ADD certs/LVM_Root_CA.crt /usr/local/share/ca-certificates/LVM_Root_CA.crt
ADD certs/LVM_Root_CA_2.crt /usr/local/share/ca-certificates/LVM_Root_CA_2.crt
ADD certs/LVM_Services_CA.crt /usr/local/share/ca-certificates/LVM_Services_CA.crt

############################################################
# Make use of the internal Ubuntu-Repos/Mirrors of the LVM #
############################################################

# remove default repo-sources
RUN sed -i 's/^deb/#deb/g' /etc/apt/sources.list

# add gpg key to validate cs-repo for apt
ADD ubuntu-repos/lap_lvm.de.gpg /usr/share/keyrings/lap_lvm.de.gpg

# add sources with the cs-repo server for apt
ADD ubuntu-repos/jammy.list /etc/apt/sources.list.d/jammy.list
ADD ubuntu-repos/jammy-mirror.list /etc/apt/sources.list.d/jammy-mirror.list

##################################
# End LVM specific configuration #
# from here on be generic        #
##################################

###############################################################################
# Basic preparations to make sure everything runs smoothly in Container-World #
###############################################################################

# install ca-certificates
RUN apt-get install -y ca-certificates

# https://stackoverflow.com/questions/20690833/how-to-run-dpkg-reconfigure-ca-certificates-noninteractively
RUN dpkg-reconfigure -p critical ca-certificates

# run apt-get update once, trade storage for convenience (we are local so storage is no convern, if used in the cloud don't do this)
RUN apt-get update

# install base packages
RUN apt-get install -y curl wget htop mc

# switch back to user 1000 (vscode)
USER 1000

# do some user specific stuff here
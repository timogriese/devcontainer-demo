FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04
#FROM docker-proxy.lvm.de/library/ubuntu:22.04

#ENV APT_PROXY="http://http-proxy.lvm.de:8080/"
#ENV http_proxy "http://http-proxy.lvm.de:8080/"
#ENV http_proxy "http://serversquid.lvm.de:8080/"
#ENV https_proxy "http://http-proxy.lvm.de:8080/"
#ENV https_proxy "http://serversquid.lvm.de:8080/"
#ENV ftp_proxy "ftp://http-proxy.lvm.de:8080/"
#ENV no_proxy "localhost","127.0.0.0/8",".local",".lvm.de","10.0.0.0/8","192.168.0.0/16","172.16.0.0/12"

USER root

## WSL-Config script for reference
# http://cs-repo.lvm.de/wsl
# http://10.225.66.167/wsl

# add gpg key to validate cs-repo for apt
#ADD lap_lvm.de.gpg /usr/share/keyrings/lap_lvm.de.gpg

# remove default source
#RUN sed -i 's/^deb/#deb/g' /etc/apt/sources.list

# add sources with the cs-repo server for apt
#ADD jammy.list /etc/apt/sources.list.d/jammy.list
#ADD jammy-mirror.list /etc/apt/sources.list.d/jammy-mirror.list

# run apt-get update once, do no care about storage
RUN apt-get update

# install ca-certificates
RUN apt-get install -y ca-certificates

# add the LVM root-certificate /etc/ssl/certs/... link to /usr/local/share/ca-certificates/...
#ADD LVM_Root_CA_2.crt /etc/ssl/certs/LVM_Root_CA_2.crt
ADD LVM_Root_CA.pem /etc/ssl/certs/LVM_Root_CA.pem
ADD LVM_Root_CA_2.crt /usr/local/share/ca-certificates/LVM_Root_CA_2.crt
#ADD LVM_Root_CA.pem /usr/local/share/ca-certificates/LVM_Root_CA.pem


#ADD LVM_Services_CA.pem /etc/ssl/certs/LVM_Services_CA.pem
#ADD LVM_Services_CA.pem /usr/local/share/ca-certificates/LVM_Services_CA.pem

# https://stackoverflow.com/questions/20690833/how-to-run-dpkg-reconfigure-ca-certificates-noninteractively
RUN dpkg-reconfigure -p critical ca-certificates

# install base packages
#RUN apt-get update && apt-get install -y curl wget htop mc

USER 1000
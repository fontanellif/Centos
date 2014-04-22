#!/bin/bash
#echo "* Create /etc/yum.repos.d/ntop.repo"
#unlink /etc/yum.repos.d/ntop.repo
#touch /etc/yum.repos.d/ntop.repo
#echo '[ntop]
#name=ntop packages
#baseurl=http://www.nmon.net/centos/$releasever/$basearch/
#enabled=1
#gpgcheck=1
#gpgkey=http://www.nmon.net/centos/RPM-GPG-KEY-deri' > /etc/yum.repos.d/ntop.repo
#echo "* Create /etc/yum.repos.d/epel.repo"
#unlink /etc/yum.repos.d/epel.repo
#touch /etc/yum.repos.d/epel.repo
#echo '[epel]
#name=Extra Packages for Enterprise Linux 6 - $basearch
#mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
#failovermethod=priority
#enabled=1
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6' > /etc/yum.repos.d/epel.repo
#wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#rpm -ivh epel-release-6-8.noarch.rpm
# rm epel-release-6-8.noarch.rpm
#yum repolist
echo "* Removing nBox"
yum remove pfring n2disk nProbe ntopng ntopng-data nbox
echo "* Install main dependecies"
yum clean all
yum update
yum groupinstall Development tools
#yum install kernel-headers kernel-devel
yum install libpcap-devel libxml2-devel glib2-devel
echo "* Install pfring n2disk nProbe ntopng ntopng-data nbox"
rm -rf /var/ntop/
yum install pfring n2disk nProbe ntopng ntopng-data nbox
reboot

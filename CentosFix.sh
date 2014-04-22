#!/bin/bash
#echo "* set LC_CTYPE to bash_profile"
#touch ~/.bash_profile
#echo 'export LC_CTYPE="en_US.UTF-8"' > ~/.bash_profile
#chmod +x ~/.bash_profile
#. ~/.bash_profile
echo "* ddclient"
wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
rpm -Uvh rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm
wget http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
rpm --import RPM-GPG-KEY.dag.txt
yum --enablerepo=rpmforge install ddclient
echo '* remember to configure /etc/ddclient/ddclient.conf file and after you can test it with the command ddclient -daemon=0 -debug -noquiet'
chkconfig –add ddclient –level 345
service ddclient start
echo "* openssh"
yum install openssh-server
chkconfig sshd on

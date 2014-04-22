#/bin/bash
VERSION=4.0.4
yum install libtool autoconf automake uuid-dev build-essential
mkdir -p /usr/local/zmq/
cd /usr/local/zmq/
wget http://download.zeromq.org/zeromq-$VERSION.tar.gz
tar zxvf zeromq-$VERSION.tar.gz
rm -rf zeromq-$VERSION.tar.gz
cd zeromq-$VERSION
./configure
make
sudo make install
cd ..
touch version.txt
echo "$VERSION" > version.txt

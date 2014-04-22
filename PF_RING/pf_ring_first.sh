#/bin/bash
# yum install flex bison libnuma-devel
cd ~/PF_RING/kernel
make
sudo insmod ./pf_ring.ko
cd ../userland
make
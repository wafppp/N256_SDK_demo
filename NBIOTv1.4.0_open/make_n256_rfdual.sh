#!/bin/bash

rm -rf *.tmp
cp make_n256_rfdual.sh  make_n256_rfdual.tmp 

if [ "$1" = "r" ];then
./build.sh mt2625_evb nbiot_m2m_demo  -f=feature_n256_rfdual.mk
else
./build.sh mt2625_evb clean
./build.sh mt2625_evb nbiot_m2m_demo  -f=feature_n256_rfdual.mk
fi

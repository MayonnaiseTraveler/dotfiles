#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#000b1e/g' \
         -e 's/rgb(100%,100%,100%)/#00f2ff/g' \
    -e 's/rgb(50%,0%,0%)/#091833/g' \
     -e 's/rgb(0%,50%,0%)/#ea00d9/g' \
 -e 's/rgb(0%,50.196078%,0%)/#ea00d9/g' \
     -e 's/rgb(50%,0%,50%)/#091833/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#091833/g' \
     -e 's/rgb(0%,0%,50%)/#00f2ff/g' \
	"$@"
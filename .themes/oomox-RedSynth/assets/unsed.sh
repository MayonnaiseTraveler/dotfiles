#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#180d25/g' \
         -e 's/rgb(100%,100%,100%)/#e3d3d3/g' \
    -e 's/rgb(50%,0%,0%)/#180d25/g' \
     -e 's/rgb(0%,50%,0%)/#f9188f/g' \
 -e 's/rgb(0%,50.196078%,0%)/#f9188f/g' \
     -e 's/rgb(50%,0%,50%)/#180d25/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#180d25/g' \
     -e 's/rgb(0%,0%,50%)/#f9188f/g' \
	"$@"

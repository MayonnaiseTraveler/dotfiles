#!/bin/sh
sed -i \
         -e 's/#180d25/rgb(0%,0%,0%)/g' \
         -e 's/#e3d3d3/rgb(100%,100%,100%)/g' \
    -e 's/#180d25/rgb(50%,0%,0%)/g' \
     -e 's/#f9188f/rgb(0%,50%,0%)/g' \
     -e 's/#180d25/rgb(50%,0%,50%)/g' \
     -e 's/#f9188f/rgb(0%,0%,50%)/g' \
	"$@"
#!/usr/bin/env bash
#	default color: 178984
oldglyph=#4b1523
newglyph=#3b0925

#	Front
#	default color: 36d7b7
oldfront=#902944
newfront=#7c144f

#	Back
#	default color: 1ba39c
oldback=#631c2f
newback=#550e36

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

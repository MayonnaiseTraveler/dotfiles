#!/usr/bin/env bash
#	default color: 178984
oldglyph=#4b1523
newglyph=#30243d

#	Front
#	default color: 36d7b7
oldfront=#902944
newfront=#5c4476

#	Back
#	default color: 1ba39c
oldback=#631c2f
newback=#3f2f51

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

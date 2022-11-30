#!/usr/bin/env bash
#	default color: 178984
oldglyph=#301f42
newglyph=#301f42

#	Front
#	default color: 36d7b7
oldfront=#5c3c7f
newfront=#5c3c7f

#	Back
#	default color: 1ba39c
oldback=#3f2957
newback=#3f2957

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

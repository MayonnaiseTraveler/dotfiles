#!/usr/bin/env bash
#	default color: 178984
oldglyph=#143b54
newglyph=#143b54

#	Front
#	default color: 36d7b7
oldfront=#25709f
newfront=#25709f

#	Back
#	default color: 1ba39c
oldback=#1a4d6d
newback=#1a4d6d

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

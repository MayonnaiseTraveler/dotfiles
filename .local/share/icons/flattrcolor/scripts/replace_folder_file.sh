#!/usr/bin/env bash
#	default color: 178984
oldglyph=#533763
newglyph=#533763

#	Front
#	default color: 36d7b7
oldfront=#9260ae
newfront=#9260ae

#	Back
#	default color: 1ba39c
oldback=#644277
newback=#644277

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

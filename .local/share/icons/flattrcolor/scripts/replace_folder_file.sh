#!/usr/bin/env bash
#	default color: 178984
oldglyph=#65092b
newglyph=#476f29

#	Front
#	default color: 36d7b7
oldfront=#bc1150
newfront=#7dc348

#	Back
#	default color: 1ba39c
oldback=#810c37
newback=#568631

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

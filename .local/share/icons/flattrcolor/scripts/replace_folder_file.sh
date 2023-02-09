#!/usr/bin/env bash
#	default color: 178984
oldglyph=#351328
newglyph=#564a25

#	Front
#	default color: 36d7b7
oldfront=#6e2853
newfront=#9c8844

#	Back
#	default color: 1ba39c
oldback=#4b1c39
newback=#6b5d2f

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

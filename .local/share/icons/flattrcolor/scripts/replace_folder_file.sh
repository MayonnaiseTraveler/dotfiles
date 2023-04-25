#!/usr/bin/env bash
#	default color: 178984
oldglyph=#6b0b2d
newglyph=#6b0b2d

#	Front
#	default color: 36d7b7
oldfront=#c51453
newfront=#c51453

#	Back
#	default color: 1ba39c
oldback=#870e39
newback=#870e39

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

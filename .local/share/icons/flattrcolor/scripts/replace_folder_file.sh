#!/usr/bin/env bash
#	default color: 178984
oldglyph=#560f29
newglyph=#560f29

#	Front
#	default color: 36d7b7
oldfront=#a41d4d
newfront=#a41d4d

#	Back
#	default color: 1ba39c
oldback=#701435
newback=#701435

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

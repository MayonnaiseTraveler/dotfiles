#!/usr/bin/env bash
#	default color: 178984
oldglyph=#711335
newglyph=#711335

#	Front
#	default color: 36d7b7
oldfront=#cb235f
newfront=#cb235f

#	Back
#	default color: 1ba39c
oldback=#8b1841
newback=#8b1841

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

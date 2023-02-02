#!/usr/bin/env bash
#	default color: 178984
oldglyph=#6e3043
newglyph=#6e3043

#	Front
#	default color: 36d7b7
oldfront=#bf5474
newfront=#bf5474

#	Back
#	default color: 1ba39c
oldback=#833a50
newback=#833a50

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

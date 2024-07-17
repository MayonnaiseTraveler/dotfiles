#!/usr/bin/env bash
#	default color: 178984
oldglyph=#021f1f
newglyph=#021f1f

#	Front
#	default color: 36d7b7
oldfront=#04575a
newfront=#04575a

#	Back
#	default color: 1ba39c
oldback=#033c3d
newback=#033c3d

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

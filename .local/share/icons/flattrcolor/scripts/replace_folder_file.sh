#!/usr/bin/env bash
#	default color: 178984
oldglyph=#531d31
newglyph=#531d31

#	Front
#	default color: 36d7b7
oldfront=#9b355c
newfront=#9b355c

#	Back
#	default color: 1ba39c
oldback=#6a253f
newback=#6a253f

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

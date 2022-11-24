#!/usr/bin/env bash
#	default color: 178984
oldglyph=#4f2028
newglyph=#56222c

#	Front
#	default color: 36d7b7
oldfront=#933c4b
newfront=#9e3f50

#	Back
#	default color: 1ba39c
oldback=#652933
newback=#6c2b37

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

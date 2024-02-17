#!/usr/bin/env bash
#	default color: 178984
oldglyph=#5a5f2f
newglyph=#011a1b

#	Front
#	default color: 36d7b7
oldfront=#9faa54
newfront=#015253

#	Back
#	default color: 1ba39c
oldback=#6d7439
newback=#013839

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

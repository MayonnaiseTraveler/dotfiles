#!/usr/bin/env bash
#	default color: 178984
oldglyph=#4e5066
newglyph=#4e5066

#	Front
#	default color: 36d7b7
oldfront=#8588af
newfront=#8588af

#	Back
#	default color: 1ba39c
oldback=#5b5e78
newback=#5b5e78

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

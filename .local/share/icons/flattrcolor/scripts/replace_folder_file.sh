#!/usr/bin/env bash
#	default color: 178984
oldglyph=#640828
newglyph=#331720

#	Front
#	default color: 36d7b7
oldfront=#bc0f4c
newfront=#6a3042

#	Back
#	default color: 1ba39c
oldback=#810a34
newback=#48212d

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

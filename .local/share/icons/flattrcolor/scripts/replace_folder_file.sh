#!/usr/bin/env bash
#	default color: 178984
oldglyph=#456a2e
newglyph=#456a2e

#	Front
#	default color: 36d7b7
oldfront=#78b950
newfront=#78b950

#	Back
#	default color: 1ba39c
oldback=#537f37
newback=#537f37

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

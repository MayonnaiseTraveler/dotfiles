#!/usr/bin/env bash
#	default color: 178984
oldglyph=#15364a
newglyph=#1c1d3b

#	Front
#	default color: 36d7b7
oldfront=#28678f
newfront=#383a74

#	Back
#	default color: 1ba39c
oldback=#1c4762
newback=#262850

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

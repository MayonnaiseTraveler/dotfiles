#!/usr/bin/env bash
#	default color: 178984
oldglyph=#252d3e
newglyph=#271b23

#	Front
#	default color: 36d7b7
oldfront=#485777
newfront=#533b4a

#	Back
#	default color: 1ba39c
oldback=#313b51
newback=#392833

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

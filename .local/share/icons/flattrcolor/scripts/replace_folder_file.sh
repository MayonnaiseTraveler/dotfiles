#!/usr/bin/env bash
#	default color: 178984
oldglyph=#271b23
newglyph=#252d3e

#	Front
#	default color: 36d7b7
oldfront=#533b4a
newfront=#485777

#	Back
#	default color: 1ba39c
oldback=#392833
newback=#313b51

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

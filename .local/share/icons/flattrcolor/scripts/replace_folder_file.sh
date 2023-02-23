#!/usr/bin/env bash
#	default color: 178984
oldglyph=#5e4536
newglyph=#5e4536

#	Front
#	default color: 36d7b7
oldfront=#a57860
newfront=#a57860

#	Back
#	default color: 1ba39c
oldback=#715342
newback=#715342

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

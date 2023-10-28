#!/usr/bin/env bash
#	default color: 178984
oldglyph=#481e26
newglyph=#481e26

#	Front
#	default color: 36d7b7
oldfront=#8a3849
newfront=#8a3849

#	Back
#	default color: 1ba39c
oldback=#5e2732
newback=#5e2732

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1

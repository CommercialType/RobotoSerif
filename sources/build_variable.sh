#!/bin/sh

echo "Building Variable Fonts\n"

# Roman
fontmake -o variable -m roman/Roboto\ Serif\ Variable\ Romans.designspace
# rename to match Google Naming Spec
mv variable_ttf/Roboto\ Serif\ Variable\ Romans-VF.ttf variable_ttf/RobotoSerifText[grad,opsz,wdth,wgth].ttf

# Italic
fontmake -o variable -m italic/Roboto\ Serif\ Variable\ Italics.designspace
# rename to match Google Naming Spec
mv variable_ttf/Roboto\ Serif\ Variable\ Italics-VF.ttf variable_ttf/RobotoSerifText-Italic[grad,opsz,wdth,wgth].ttf


echo "\n\nPost Processing: Adding DSIG\n\n"

ttfs=$(ls variable_ttf/*.ttf)
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
done


echo "\n\nPost Processing: Fixing Hinting\n\n"

for ttf in $ttfs
do
	gftools fix-nonhinting $ttf $ttf;
	if [ -f "$ttf.fix" ]; then mv "$ttf.fix" $ttf; fi
	backup=${ttf/".ttf"/"-backup-fonttools-prep-gasp.ttf"}
	if [ -f $backup ]; then rm $backup; fi
done


echo "\n\nBuilding Web Fonts\n\n"

for ttf in $ttfs
do 
	echo "sfnt2woff"
	sfnt2woff-zopfli $ttf
	echo "woff2_compress"
	woff2_compress $ttf
done

echo "\n\nFinished!\n\n"

#!/bin/sh

# Build Static Fonts
echo "\nBuilding Static Fonts\n"

mkdir "roman/ufo_instances"
cp -R "roman/features" "roman/ufo_instances/features"
mkdir "italic/ufo_instances"
cp -R "italic/features" "italic/ufo_instances/features"

fontmake -i -o ttf -m roman/Roboto\ Serif\ Variable\ Romans.designspace --output-dir instance_ttf
fontmake -i -o ttf -m italic/Roboto\ Serif\ Variable\ Italics.designspace --output-dir instance_ttf

rm -rf "roman/ufo_instances"
rm -rf "italic/ufo_instances"


echo "\n\nPost Processing: Adding DSIG\n\n"

ttfs=$(ls instance_ttf/*.ttf)
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

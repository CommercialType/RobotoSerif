# Roman

# build variable fonts
fontmake -o variable -m roman/Roboto\ Serif\ Variable\ Romans.designspace

# rename to match Google Naming Spec
mv variable_ttf/Roboto\ Serif\ Variable\ Romans-VF.ttf variable_ttf/RobotoSerifText[grad,opsz,wdth,wgth].ttf

# fix hinting/dsig
gftools fix-nonhinting variable_ttf/RobotoSerifText[grad,opsz,wdth,wgth].ttf variable_ttf/RobotoSerifText[grad,opsz,wdth,wgth].ttf
gftools fix-dsig --autofix variable_ttf/RobotoSerifText[grad,opsz,wdth,wgth].ttf

# build web fonts
sfnt2woff-zopfli variable_ttf/RobotoSerifText[grad,opsz,wdth,wgth].ttf
woff2_compress variable_ttf/RobotoSerifText[grad,opsz,wdth,wgth].ttf


# Italic

# build variable fonts
fontmake -o variable -m italic/Roboto\ Serif\ Variable\ Italics.designspace

# rename to match Google Naming Spec
mv variable_ttf/Roboto\ Serif\ Variable\ Italics-VF.ttf variable_ttf/RobotoSerifText-Italic[grad,opsz,wdth,wgth].ttf

# fix hinting/dsig
gftools fix-nonhinting variable_ttf/RobotoSerifText-Italic[grad,opsz,wdth,wgth].ttf variable_ttf/RobotoSerifText-Italic[grad,opsz,wdth,wgth].ttf
gftools fix-dsig --autofix variable_ttf/RobotoSerifText-Italic[grad,opsz,wdth,wgth].ttf

# build web fonts
sfnt2woff-zopfli variable_ttf/RobotoSerifText-Italic[grad,opsz,wdth,wgth].ttf
woff2_compress variable_ttf/RobotoSerifText-Italic[grad,opsz,wdth,wgth].ttf
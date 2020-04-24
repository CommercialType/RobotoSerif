# build variable fonts
fontmake -o variable -m roman/Roboto\ Serif\ Variable\ Romans\ 200423.designspace
fontmake -o variable -m italic/Roboto\ Serif\ Variable\ Italics\ 200423.designspace

# build web fonts
sfnt2woff-zopfli variable_ttf/Roboto\ Serif\ Variable\ Romans\ 200423-VF.ttf
woff2_compress variable_ttf/Roboto\ Serif\ Variable\ Romans\ 200423-VF.ttf
sfnt2woff-zopfli variable_ttf/Roboto\ Serif\ Variable\ Italics\ 200423-VF.ttf
woff2_compress variable_ttf/Roboto\ Serif\ Variable\ Italics\ 200423-VF.ttf

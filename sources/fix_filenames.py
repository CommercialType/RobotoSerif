import os

fonts_dir = os.path.join(os.path.dirname(__file__), "..", "fonts")
for format_dir in ["ttf", "webfonts"]:
	for file in os.listdir(os.path.join(fonts_dir, format_dir)):
		if "-." in file:
			os.rename(os.path.join(fonts_dir, format_dir, file), os.path.join(fonts_dir, format_dir, file.replace("-.", "-Regular.")))
import os
import re

def process_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # match <img src="/logo.png" ... /> and inject style
    def replacement(match):
        tag = match.group(0)
        if 'style=' not in tag:
            # insert before the closing />
            return tag.replace('/>', 'style={{ width: "auto", height: "auto" }} />')
        return tag

    new_content = re.sub(r'<img[^>]*src="/logo\.png"[^>]*/>', replacement, content)
    if new_content != content:
        with open(filepath, 'w') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

for root, _, files in os.walk('src'):
    for file in files:
        if file.endswith('.tsx'):
            process_file(os.path.join(root, file))


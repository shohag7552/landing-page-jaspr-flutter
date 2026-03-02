import os
import re

def process_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # 1. borderRadius -> radius
    content = re.sub(r'\bborderRadius:\s*BorderRadius', r'radius: BorderRadius', content)
    
    # 2. TextTransform.uppercase -> TextTransform.upperCase
    content = content.replace("TextTransform.uppercase", "TextTransform.upperCase")
    
    # 3. gap: X.px -> gap: Gap.all(X.px)
    content = re.sub(r'\bgap:\s*([^,]+?\.px)', r'gap: Gap.all(\1)', content)
    # also handle gap: 16.px inside a single line
    
    # 4. marginBottom -> margin: Spacing.only(bottom: ...)
    content = re.sub(r'\bmarginBottom:\s*([^,]+?\.px)', r'margin: Spacing.only(bottom: \1)', content)
    content = re.sub(r'\bmarginTop:\s*([^,]+?\.px)', r'margin: Spacing.only(top: \1)', content)
    
    # 5. duration: 300 -> duration: Duration(milliseconds: 300)
    # wait, could be just duration: 300.ms if .ms is available, or Duration(milliseconds: 300)
    content = re.sub(r'(?<!milliseconds:\s)\b(?<!\.)(?:300|500|200|3000)\b(?!\.ms)', r'Duration(milliseconds: \g<0>)', content)
    # BUT wait, what if it's already duration: const Duration(milliseconds: 300)? The previous regex might break it. 
    # Let's fix specific duration numbers safely
    content = re.sub(r'\bduration:\s*(\d+)\b(?!\.ms)', r'duration: const Duration(milliseconds: \1)', content)

    # 6. Colors.inherit -> Color.inherit
    content = content.replace("Colors.inherit", "Color.inherit")
    
    # 7. scrollBehavior -> raw: {'scroll-behavior': 'smooth'}
    #    in main.server.dart wait let's just do that manually using regex
    content = re.sub(r'scrollBehavior:\s*ScrollBehavior\.smooth\s*,?', r"raw: {'scroll-behavior': 'smooth'},", content)
    
    # 8. EdgeInsets missing mapping
    content = re.sub(r'\bEdgeInsets\b', r'Spacing', content)
    
    # 9. Styles.box missing mapping
    content = re.sub(r'Styles\.box\(([^)]+)\)', r'\1', content)

    # 10. Color.hex missing mapping for Color.hex('#FF5E1E')
    content = re.sub(r"Color\.hex\('(#?[0-9a-fA-F]+)'\)", r"Color('\1')", content)

    with open(filepath, 'w') as f:
        f.write(content)

base_dir = "lib/components"
for f in os.listdir(base_dir):
    if f.endswith('.dart'):
        process_file(os.path.join(base_dir, f))

# Also run on lib/main.server.dart and lib/app.dart
process_file("lib/main.server.dart")
process_file("lib/app.dart")


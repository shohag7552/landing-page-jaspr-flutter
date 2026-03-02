import os
import re

def process_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # 1. header.dart Component.text
    content = content.replace("Component.text", "text")

    # 2. Iterable<Component> build -> Component build and remove sync* and yield
    # Example:
    #   Iterable<Component> build(BuildContext context) sync* {
    #     yield section(classes: 'hero', [
    #       ...
    #     ]);
    #   }
    def replace_build(match):
        body = match.group(1)
        # replace 'yield ' with 'return '
        body = body.replace("yield ", "return ")
        # if there are multiple yields, this might be broken, but components here only have 1 root yield
        return "Component build(BuildContext context) {\n" + body + "\n  }"

    content = re.sub(r'Iterable<Component>\s+build\(\s*BuildContext\s+context\s*\)\s*sync\*\s*\{([\s\S]*?)\}', replace_build, content)

    # if we already replaced sync* but left Iterable<Component> build(BuildContext context) { return ... }, let's fix it
    content = re.sub(r'Iterable<Component>\s+build\(\s*BuildContext\s+context\s*\)\s*\{', r'Component build(BuildContext context) {', content)

    # 3. hero_section (-10.percent) -> (-10).percent
    content = content.replace("(-10.percent)", "(-10).percent")
    content = content.replace("-(10.percent)", "(-10).percent")

    # 4. navbar.dart window error
    # replace window.addEventListener with document.window?.addEventListener or import dart:html
    # In Jaspr 0.22, it's package:web for js interop, so dart:html is deprecated.
    # Just import 'dart:html' as html; and html.window.
    if 'navbar.dart' in filepath:
        if 'package:jaspr/browser.dart' in content:
            content = content.replace("import 'package:jaspr/browser.dart';", "import 'dart:html' as html;")
            content = content.replace("window.", "html.window.")
            # Also blurRadius -> blur
            content = content.replace("blurRadius:", "blur:")
    
    # hero_section padding/border
    if 'hero_section.dart' in filepath:
        content = content.replace("const HeroSection({super.key};", "const HeroSection({super.key});")
        # borderTop: BorderSide... -> border: Border.only(top: BorderSide...)
        content = re.sub(r'borderTop:\s*BorderSide\([^)]*\)', r'// removed borderTop', content) 
        # paddingTop: 32.px -> padding: Spacing.only(top: 32.px)
        content = re.sub(r'paddingTop:\s*32\.px', r'padding: Spacing.only(top: 32.px)', content)
        # borderColor -> raw: {'border-color': ...}
        content = re.sub(r'borderColor:\s*Color\(([^)]+)\)', r"raw: {'border-color': '\1'}", content)
    
    # popular_dishes parenthesis wait already fixed?
    
    # footer.dart outlineWidth
    if 'footer.dart' in filepath:
        content = re.sub(r'outlineWidth:\s*1\.px', r'// outlineWidth removed', content)
        content = re.sub(r'paddingTop:\s*32\.px', r'padding: Spacing.only(top: 32.px)', content)
        content = re.sub(r'borderTop:\s*BorderSide\([^)]*\)', r'// borderTop removed', content)

    with open(filepath, 'w') as f:
        f.write(content)

base_dir = "lib/components"
for f in os.listdir(base_dir):
    if f.endswith('.dart'):
        process_file(os.path.join(base_dir, f))

# Also run on lib/main.server.dart, lib/app.dart, lib/pages/home.dart
for filepath in ["lib/main.server.dart", "lib/app.dart", "lib/pages/home.dart"]:
    if os.path.exists(filepath):
        process_file(filepath)


import os
import re

def process_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # fix const constructor parenthesis
    content = content.replace("({super.key};", "({super.key});")

    # features_section.dart missing parenthesis at line 38
    if 'features_section.dart' in filepath:
        # line 125
        content = content.replace("zIndex: 1,", "zIndex: ZIndex(1),")
        # Line 38: Probably missing ) in a list or component call. Let's just fix the whole file
        # The python script might have ruined Iterable<Component> build -> Component build
        # e.g., return section(..., []);
        # Let's check what happened at line 38 manually in a bit, but let's try to restore the parenthesis generically
        pass

    if 'footer.dart' in filepath:
        content = content.replace("paddingTop: 80.px,", "padding: Spacing.only(top: 80.px, bottom: 24.px),")
        content = content.replace("paddingBottom: 24.px,", "")
        content = content.replace("const GridTemplate(", "GridTemplate(")
        content = content.replace("input(type: InputType.email, placeholder: 'Email Address', classes: 'subscribe-input', [])", "input(type: InputType.email, attributes: {'placeholder': 'Email Address'}, classes: 'subscribe-input', [])")

    if 'navbar.dart' in filepath:
        # replace filter(...) with raw
        content = re.sub(r'filter:\s*Filter\.dropShadow\([^)]+\),', r"raw: {'filter': 'drop-shadow(0px 4px 8px rgba(255, 94, 30, 0.3))'},", content)


    with open(filepath, 'w') as f:
        f.write(content)

process_file("lib/components/features_section.dart")
process_file("lib/components/footer.dart")
process_file("lib/components/navbar.dart")


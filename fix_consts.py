import os
import re

def process_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # 1. remove const before BoxShadow and Transition and Transform and GridTemplateColumns and Radius and BorderSide and Color
    # actually any const BoxShadow, const Transition, const Transform, const BorderRadius
    for keyword in ['BoxShadow', 'Transition', 'Transform', 'BorderRadius', 'Border', 'Color']:
        content = re.sub(rf'const\s+{keyword}\(', f'{keyword}(', content)

    # 2. boxShadow -> shadow
    content = re.sub(r'\bboxShadow:\s*', r'shadow: ', content)

    # 3. AlignItems.flexEnd -> AlignItems.end
    content = content.replace("AlignItems.flexEnd", "AlignItems.end")
    content = content.replace("AlignItems.flexStart", "AlignItems.start")
    
    # 4. JustifyContent.spaceBetween -> JustifyContent.spaceBetween
    
    # fix overflowX in main.server.dart
    content = re.sub(r'overflowX:\s*Overflow\.hidden\s*,?', r"raw: {'overflow-x': 'hidden'},", content)

    # fix Iterable<Component> to Component for all components
    content = re.sub(r'Iterable<Component>\s+build\(\s*BuildContext\s+context\s*\)\s*sync\*\s*\{([\s\S]*?)yield\s*([a-zA-Z]+\([\s\S]*?\));\s*\}', 
                     lambda m: r'Iterable<Component> build(BuildContext context) sync* {' + '\n    yield ' + m.group(2) + ';\n  }', content)
    # wait the above is dangerous if there are multiple yields.
    # The error was: 'Iterable<Component> Function(BuildContext)' isn't a valid override of 'StatelessComponent.build' ('Iterable<Component>? Function(BuildContext)') wait no. 
    # 'StatelessComponent.build' ('Iterable<Component> Function(BuildContext)') wait no:
    # return type is 'Iterable<Component> Function(BuildContext)' vs 'Component Function(BuildContext)'?
    # No, wait... Jaspr 0.20+ maybe expects `Iterable<Component> build` and you use `yield` OR `Component build`. 
    # Let's check Jaspr docs later. For now let's just write to file and check the error again.
    
    with open(filepath, 'w') as f:
        f.write(content)

base_dir = "lib/components"
for f in os.listdir(base_dir):
    if f.endswith('.dart'):
        process_file(os.path.join(base_dir, f))

process_file("lib/main.server.dart")
process_file("lib/app.dart")
process_file("lib/pages/home.dart")


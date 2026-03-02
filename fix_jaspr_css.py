import os
import re

def process_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # Color.hex('#FFF') -> Color('#FFF')
    content = re.sub(r"Color\.hex\('([^']+)'\)", r"Color('\1')", content)

    # Styles.box(EdgeInsets.symmetric(vertical: X)) -> Spacing.symmetric(vertical: X)
    content = re.sub(r'Styles\.box\(\s*EdgeInsets\.symmetric\(([^)]+)\)\s*\)', r'Spacing.symmetric(\1)', content)
    
    # Styles.box(EdgeInsets.all(X)) -> Spacing.all(X)
    content = re.sub(r'Styles\.box\(\s*EdgeInsets\.all\(([^)]+)\)\s*\)', r'Spacing.all(\1)', content)

    # Styles.box(EdgeInsets.only(X)) -> Spacing.only(X)
    content = re.sub(r'Styles\.box\(\s*EdgeInsets\.only\(([^)]+)\)\s*\)', r'Spacing.only(\1)', content)
    
    # GridTemplateColumns.list([GridTemplateColumns.value(Flex(grow: 1)), ...]) -> wait, this is hard. Let's just do it manually or semi-manually
    # Wait, actually:
    # gridTemplateColumns: const GridTemplateColumns.list([
    #    GridTemplateColumns.value(Flex(grow: 1)), ...
    # ]) 
    # Can be replaced with:
    # gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1)), ...]))
    # But it's easier to just use string replace for the specific known patterns.
    
    content = content.replace(
"""gridTemplateColumns: const GridTemplateColumns.list([
        GridTemplateColumns.value(Flex(grow: 1)),
        GridTemplateColumns.value(Flex(grow: 1)),
        GridTemplateColumns.value(Flex(grow: 1)),
        GridTemplateColumns.value(Flex(grow: 1)),
      ]),""",
"""gridTemplate: const GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),"""
    )
    
    content = content.replace(
"""gridTemplateColumns: const GridTemplateColumns.list([
        GridTemplateColumns.value(Flex(grow: 1)),
        GridTemplateColumns.value(Flex(grow: 1)),
        GridTemplateColumns.value(Flex(grow: 1)),
      ]),""",
"""gridTemplate: const GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),"""
    )
    
    content = content.replace(
"""gridTemplateColumns: const GridTemplateColumns.list([GridTemplateColumns.value(Flex(grow: 1)), GridTemplateColumns.value(Flex(grow: 1))]),""",
"""gridTemplate: const GridTemplate(columns: GridTracks([GridTrack(TrackSize.fr(1)), GridTrack(TrackSize.fr(1))])),"""
    )

    content = content.replace(
"""gridTemplateColumns: const GridTemplateColumns.list([
        GridTemplateColumns.value(Flex(grow: 1)),
        GridTemplateColumns.value(Flex(grow: 2)),
        GridTemplateColumns.value(Flex(grow: 1)),
        GridTemplateColumns.value(Flex(grow: 1)),
      ]),""",
"""gridTemplate: const GridTemplate(columns: GridTracks([
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(2)),
        GridTrack(TrackSize.fr(1)),
        GridTrack(TrackSize.fr(1)),
      ])),"""
    )

    # raw({...}) -> raw: {...}
    content = re.sub(r'raw\(\{', r'raw: {', content)
    content = re.sub(r'\}\)', r'}', content)

    # Also fix object fit on image:
    # ObjectFit.cover =>  Actually object fit doesn't exist directly like that in Styles. Or it might be missing entirely. Let's just map it to 'object-fit': 'cover'
    content = re.sub(r'^\s*ObjectFit\.cover,\s*$', r"      raw: {'object-fit': 'cover'},", content, flags=re.MULTILINE)

    with open(filepath, 'w') as f:
        f.write(content)

base_dir = "lib/components"
for f in ["navbar.dart", "hero_section.dart", "features_section.dart", "popular_dishes.dart", "footer.dart"]:
    process_file(os.path.join(base_dir, f))

# Also run against lib/main.server.dart if necessary, but that might have different things.

import re

with open("lib/components/footer.dart", 'r') as f:
    c = f.read()

c = c.replace("GridTrack(TrackSize.px(300))", "GridTrack(TrackSize.auto)")
with open("lib/components/footer.dart", 'w') as f:
    f.write(c)

with open("lib/components/navbar.dart", 'r') as f:
    c = f.read()

c = re.sub(r'filter:\s*Filter\.dropShadow\([^)]+\)', "raw: {'filter': 'drop-shadow(0px 4px 8px rgba(255, 94, 30, 0.3))'}", c)
with open("lib/components/navbar.dart", 'w') as f:
    f.write(c)


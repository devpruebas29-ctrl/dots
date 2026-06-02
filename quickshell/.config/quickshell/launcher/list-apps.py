#!/usr/bin/env python3
import os, json, configparser
from pathlib import Path

dirs = ["/usr/share/applications", "/usr/local/share/applications",
        str(Path.home()) + "/.local/share/applications"]

apps = []
seen = set()

for d in dirs:
  if not os.path.isdir(d): continue
  for f in os.listdir(d):
    if not f.endswith(".desktop"): continue
    fp = os.path.join(d, f)
    try:
      cfg = configparser.ConfigParser(strict=False)
      cfg.read(fp)
      entry = cfg["Desktop Entry"]
      if entry.get("NoDisplay") == "true": continue
      if entry.get("Type") != "Application": continue
      name = entry.get("Name", f.replace(".desktop",""))
      exec_ = entry.get("Exec", "").split("%")[0].strip()
      icon = entry.get("Icon", "")
      if name in seen: continue
      seen.add(name)
      apps.append({"name": name, "exec": exec_, "icon": icon})
    except: pass

apps.sort(key=lambda x: x["name"].lower())
print(json.dumps(apps))

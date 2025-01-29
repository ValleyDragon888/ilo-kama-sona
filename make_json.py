import json

import yaml

with open("flashcards.yaml", "r") as f:
    contents = yaml.safe_load(f)

with open("project/assets/flashcards.json", "w+") as f:
    f.write(json.dumps(contents, indent=4))

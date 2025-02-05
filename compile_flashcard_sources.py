import json
import yaml
import csv

## tokipona-flashcards.yaml ##
with open("flashcard-source/tokipona-flashcards.yaml", "r") as f:
    contents = yaml.safe_load(f)

with open("project/assets/flashcards.json", "w+") as f:
    f.write(json.dumps(contents, indent=4))

## tokipona-definitions.csv ##
output = {}
with open('flashcard-source/tokipona-definitions.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
    for row in spamreader:
        output[row[0]] = row[1]
with open("project/assets/tokipona-definitions.json", "w+") as f:
    f.write(json.dumps(output, indent=4))

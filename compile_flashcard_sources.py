import json
import yaml
import csv

def remove_space_placeholder(lessons):
    new_lessons = {}
    for course in lessons.keys():
        new_lessons[course] = {}
        for lesson_name in lessons[course].keys():
            new_lesson_name = lesson_name.replace("-", " ")
            new_lessons[course][new_lesson_name] = lessons[course][lesson_name]
    return new_lessons

## tokipona-flashcards.yaml ##
with open("flashcard-source/tokipona-flashcards.yaml", "r") as f:
    contents = yaml.safe_load(f)
contents = remove_space_placeholder(contents)

with open("project/assets/tokipona-flashcards.json", "w+") as f:
    f.write(json.dumps(contents, indent=4))

## tokipona-definitions.csv ##
output = {}
with open('flashcard-source/tokipona-definitions.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter='\t', quotechar='|')
    for row in spamreader:
        output[row[0]] = row[1]
with open("project/assets/tokipona-definitions.json", "w+") as f:
    f.write(json.dumps(output, indent=4))

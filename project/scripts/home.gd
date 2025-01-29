extends CanvasLayer

var courses = ["pu", "toki pona app"]
var selected = 0
@onready var lessons = preload("res://assets/flashcards.json")
var current_lessons
var lesson_selected = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lessons = lessons.get_data()
	current_lessons = lessons["pu"]
	update_course_showing()

func _process(delta: float) -> void:
	pass

func update_course_showing():
	$VBoxContainer/HBoxContainer/CourseIndicator.text = courses[selected]
	if courses[selected] == "pu":
		$VBoxContainer/HBoxContainer/CourseIndicator.add_theme_font_override("font", load("res://assets/fonts/nasin-nanpa-4.0.1.otf"))
	else:
		$VBoxContainer/HBoxContainer/CourseIndicator.remove_theme_font_override("font")
		
	current_lessons = lessons[courses[selected]]
	$VBoxContainer/LessonSelect.get_popup().clear()
	for i in range(len(current_lessons)):
		$VBoxContainer/LessonSelect.get_popup().add_item(current_lessons.keys()[i], i)
	
	$VBoxContainer/LessonSelect.get_popup().id_pressed.connect(_on_new_lesson_selected)
	

func _on_kama_pressed() -> void:
	selected -= 1
	if selected < 0: selected = len(courses)-1
	update_course_showing()

func _on_tawa_pressed() -> void:
	selected += 1
	if selected >= len(courses): selected = 0
	update_course_showing()

func _on_lesson_select_pressed() -> void:
	pass

func _on_new_lesson_selected(id: int):
	print(id)
	lesson_selected = id
	$VBoxContainer/LessonSelect.text = current_lessons.keys()[id]

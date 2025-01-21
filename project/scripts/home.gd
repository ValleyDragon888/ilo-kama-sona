extends CanvasLayer

var courses = ["pu", "toki pona app"]
var selected = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_course_showing()

func _process(delta: float) -> void:
	pass

func update_course_showing():
	$VBoxContainer/HBoxContainer/CourseIndicator.text = courses[selected]
	if courses[selected] == "pu":
		$VBoxContainer/HBoxContainer/CourseIndicator.add_theme_font_override("font", load("res://assets/fonts/nasin-nanpa-4.0.1.otf"))
	else:
		$VBoxContainer/HBoxContainer/CourseIndicator.remove_theme_font_override("font")

func _on_kama_pressed() -> void:
	selected -= 1
	if selected < 0: selected = len(courses)-1
	update_course_showing()

func _on_tawa_pressed() -> void:
	selected += 1
	if selected >= len(courses): selected = 0
	update_course_showing()

extends Node2D

enum FlashcardType { LATIN, SITELEN, BOTH }

@onready var card = $CanvasLayer/Card
@export var words = ["wile", "pona", "jaki", "akesi", "mi", "sina"]

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func next():
	# there is a rand_weighted() function
	var new_word = words.pick_random()
	var type = [FlashcardType.LATIN, FlashcardType.SITELEN, FlashcardType.BOTH].pick_random()
	card.set_flashcard_type(type); card.set_word(new_word)
	card.refresh_display()

func _on_ike_pressed() -> void:
	next()

func _on_pona_pressed() -> void:
	next()

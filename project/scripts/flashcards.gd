extends Node2D

enum FlashcardType { LATIN, SITELEN, BOTH }

@onready var card = $CanvasLayer/Card
@export var words = ["wile", "pona", "jaki", "akesi", "mi", "sina"]
var weights = PackedFloat32Array([])
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	prepare_for_new_words()

func _process(delta: float) -> void:
	pass

func prepare_for_new_words():
	generate_weights()

func generate_weights():
	weights = PackedFloat32Array([])
	for word in words: 
		weights.append(1.0)

func next():
	# there is a rand_weighted() function
	var new_word = words[rng.rand_weighted(weights)]
	var type = [FlashcardType.LATIN, FlashcardType.SITELEN, FlashcardType.BOTH].pick_random()
	card.set_flashcard_type(type); card.set_word(new_word)
	card.refresh_display()

func tweak_weights(pona: bool):
	# larger weight = more likely
	var word_idx = words.find(card.word)
	if pona:
		if weights[word_idx] > 1.0: weights[word_idx] -= 0.1
		if weights[word_idx] < 1.0: weights[word_idx] = 1.0
	else: #ike
		weights[word_idx] += 0.5
		if weights[word_idx] > 3.0: weights[word_idx] = 3.0
	print(weights)

func hide_flashcards(): $CanvasLayer.hide(); $CanvasLayer/Card.hide()
func show_flashcards(): $CanvasLayer.show(); $CanvasLayer/Card.show()


func _on_ike_pressed() -> void:
	tweak_weights(false)
	next()

func _on_pona_pressed() -> void:
	tweak_weights(true)
	next()

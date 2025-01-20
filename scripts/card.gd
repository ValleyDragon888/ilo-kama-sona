extends CanvasLayer

enum FlashcardType { LATIN, SITELEN, BOTH }
@onready var latincard = $VBoxContainer/LatinCard
@onready var sitelenponacard = $VBoxContainer/SitelenPonaCard
@onready var sitelenlatincard = $VBoxContainer/SitelenLatinCard

@export var word = "toki"
@export var type: FlashcardType = FlashcardType.BOTH

func _ready() -> void:
	refresh_display()
	
func _process(delta: float) -> void:
	pass

func refresh_display():
	set_flashcard_type(type)
	match type:
		FlashcardType.LATIN:
			$VBoxContainer/LatinCard/Text.text = word
		FlashcardType.SITELEN:
			$VBoxContainer/SitelenPonaCard/SitelenPona.text = word
		FlashcardType.BOTH:
			$VBoxContainer/SitelenLatinCard/Text.text = word
			$VBoxContainer/SitelenLatinCard/SitelenPona.text = word

func set_flashcard_type(t: FlashcardType):
	type = t
	latincard.hide(); sitelenponacard.hide(); sitelenlatincard.hide()
	match t:
		FlashcardType.LATIN: latincard.show()
		FlashcardType.SITELEN: sitelenponacard.show()
		FlashcardType.BOTH: sitelenlatincard.show()

func set_word(w: String): word = w

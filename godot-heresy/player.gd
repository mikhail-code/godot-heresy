# Player.gd
class_name Player
@export var player_name : String
@export var player_hero : Hero
@export var player_deck : Array
# Player's deck

func _init(name_param : String, hero_param : Hero, deck_param : Array):
	player_name = name_param
	player_hero = hero_param
	player_deck = deck_param

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

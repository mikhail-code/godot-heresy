extends Node

class_name Hero
var _class : String
var hero_power : String

func _init(class_param : String, power_param : String):
	_class = class_param
	hero_power = power_param

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

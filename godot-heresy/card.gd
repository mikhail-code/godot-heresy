# Card.gd

extends Node

class_name Card

# Card's name
@export var card_name : String

# Card's power
@export var card_power : int

# Card's faith requirement
@export var card_faith_requirement : int

# Card's text
@export var card_text : String

# Card's keywords
@export var card_keywords : Array

# Card's art file directory
@export var card_art_file_directory : String

# Card's back
@export var card_back_file_directory : String

# Called when the node enters the scene tree for the first time.
func _ready():
	# Assuming the StaticBody3D is a direct child of the Card node.
	_set_default_materials_to_card()
	#we need to create multiple planes
	pass # Replace with function body.

func _set_default_materials_to_card():
	var static_body_front = get_node("StaticBody3DFront")
	var static_body_back = get_node("StaticBody3DBack")
	var mesh_instance_front
	var mesh_instance_back
	
	if static_body_front:
		# Assuming MeshInstance3D is a child of the StaticBody3D node.
		mesh_instance_front = static_body_front.get_node("MeshInstance3D")
		if not mesh_instance_front:
			print("MeshInstance3D not found.")
	else:
		print("StaticBody3D not found.")
	if static_body_back:
		# Assuming MeshInstance3D is a child of the StaticBody3D node.
		mesh_instance_back = static_body_back.get_node("MeshInstance3D")
		if not mesh_instance_back:
			print("MeshInstance3D not found.")
	else:
		print("StaticBody3D not found.")
	
	var game_data = preload("../game_data.gd")
	var material_front = mesh_instance_front.get_active_material(0)
	var material_back = mesh_instance_back.get_active_material(0)
		
	card_art_file_directory = game_data.default_card_art
	card_back_file_directory = game_data.default_player_cardback
	set_texture_for_card(mesh_instance_front, card_art_file_directory)
	set_texture_for_card(mesh_instance_back, card_back_file_directory)
	
func set_texture_for_card(mesh_instance, texture_directory):
	#this worked, but it only works on preload
	#var tex = ImageTexture.new()
	#tex = preload("res://Assets/Images/transparent-thanksgiving-thanksgiving-food-scene-with-vibrant-colors-and-sy6547a4e1b6b1c3.6532434716991940817483.png")

	#now what about this? this waits until resources are loaded
	var tex = ImageTexture.new()
	var resource_loader = await ResourceLoader.load(texture_directory)

	tex = resource_loader
	# Now you can assign this texture to a material
	var material = StandardMaterial3D.new()
	material.albedo_texture = tex

	# And assign the material to a MeshInstance3D
	mesh_instance.set_surface_override_material(0, material)
	
	# another way to  assign the material to a MeshInstance3D
	#var existing_material = mesh_instance.get_active_material(0)
	#existing_material.albedo_texture = tex
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

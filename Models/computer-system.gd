extends Node3D

@export var interaction_node: InteractionScript;

# Called when the node enters the scene tree for the first time.
func _ready():
	$"computer-system/computer_system_collision".interaction_node = interaction_node;


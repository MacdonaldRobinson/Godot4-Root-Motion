extends Node3D
class_name Character

@onready var animation_tree:AnimationTree = $AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_motion(blend_position:Vector2):
	var current_blend_position:Vector2 = animation_tree["parameters/motion_direction/blend_position"];
	var new_blend_position: Vector2 = lerp(current_blend_position, blend_position, 0.1);
	
	animation_tree["parameters/motion_direction/blend_position"] = new_blend_position
	pass

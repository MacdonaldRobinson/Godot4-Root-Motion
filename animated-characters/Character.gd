extends Node3D
class_name Character

@onready var animation_tree:AnimationTree = $AnimationTree

enum MotionState{
	standing,
	crouching
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_motion(motion_state: MotionState, blend_position:Vector2):
	var str_motion_state:String = MotionState.find_key(motion_state)
		
	var current_motion_direction:Vector2 = animation_tree["parameters/"+str_motion_state+"_motion_direction/blend_position"];
	var new_motion_direction: Vector2 = lerp(current_motion_direction, blend_position, 0.1);
	var current_motion_state:MotionState = MotionState.get(animation_tree["parameters/motion_state/current_state"]);
	
	animation_tree["parameters/motion_state/transition_request"] = str_motion_state
	
	if motion_state == MotionState.standing:
		animation_tree["parameters/standing_motion_direction/blend_position"] = new_motion_direction
	elif motion_state == MotionState.crouching:
		animation_tree["parameters/crouching_motion_direction/blend_position"] = new_motion_direction		
	pass
	
func jump():
	var current_motion_direction:Vector2 = animation_tree["parameters/standing_motion_direction/blend_position"];
	print("Ran jump", current_motion_direction)
		
	animation_tree["parameters/standing_jump/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	animation_tree["parameters/standing_jump_direction/blend_position"] = current_motion_direction
	
	pass

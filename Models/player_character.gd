extends CharacterBody3D


@export var SPEED = 4.0
@export var JUMP_VELOCITY = 4.5
@export var gui_node: Node;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var interacting = false

func _input(event):
	if not interacting and event.is_action_pressed("action"):
		for area in $interaction_area.get_overlapping_areas():
			if area is DialogInteractor:
				if area.interaction_node != null:
					await get_tree().process_frame
					
					interacting = true
					await area.interaction_node._start_interaction(gui_node)
					interacting = false

func _physics_process(delta):
	if interacting:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_pressed("left"):
		$player_sprite.flip_h = true
	elif Input.is_action_pressed("right"):
		$player_sprite.flip_h = false

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if velocity.length() > 0:
		$character_animation.current_animation = "walk"
	else:
		$character_animation.current_animation = "idle"

	move_and_slide()

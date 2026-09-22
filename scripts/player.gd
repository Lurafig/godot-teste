extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var sprite: AnimatedSprite2D = $Sprite

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#test
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction;
	
	if velocity.x == 0:
		sprite.animation = "idle"
	else:
		sprite.animation = "run"
		
	if Input.is_action_pressed("ui_right"):
		direction = 1
		velocity.x = direction * SPEED
		sprite.flip_h = velocity.x < 0
	elif Input.is_action_pressed("ui_left"):
		direction = -1
		velocity.x = direction * SPEED
		sprite.flip_h = velocity.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 950
var dsaut = 0

func _physics_process(delta):
	# Add the gravity.
	if $magicien_anim.is_playing() == false:
		$magicien_anim.play("idle")
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		dsaut = 0
	# Handle Jump.
	if Input.is_action_just_pressed("sauter") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("sauter") and not is_on_floor() and dsaut == 0:
		velocity.y = JUMP_VELOCITY
		dsaut = 1
	if Input.is_action_pressed("droite"):
		velocity.x = SPEED
		$magicien_anim.play("cour")
		$magicien_anim.flip_h = false
		
	
	if Input.is_action_pressed("gauche"):
		velocity.x = -1*SPEED
		$magicien_anim.play("cour")
		$magicien_anim.flip_h = true
		
	if Input.is_action_just_released("droite") or Input.is_action_just_released("gauche"):
		velocity.x = 0
		$magicien_anim.play("idle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()

extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var alive = true
var rng = RandomNumberGenerator.new()
var aleatoire
var timer = 0
var wait_time = 2
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func move_left():
	velocity.x = -SPEED
	$champignon_anim.play("courir")
	$champignon_anim.flip_h = true

func move_right():
	velocity.x = SPEED
	$champignon_anim.play("courir")
	$champignon_anim.flip_h = false

func attaque():
	velocity.x = 0
	$champignon_anim.play("attaque")
	await $champignon_anim.animation_finished
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if $champignon_anim.is_playing() == false:
		$champignon_anim.play("idle")
	timer = timer + delta

	print(aleatoire)
	if timer > wait_time:
		timer = 0
		
		aleatoire = rng.randf_range(1, 3)
		
		if aleatoire < 2:
			move_left()
		else:
			move_right()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	move_and_slide()


func _on_champi_atk_area_body_entered(body):
	if body.is_in_group("joueur"):
		if body.global_position.x < global_position.x:
			$champignon_anim.flip_h
		attaque()

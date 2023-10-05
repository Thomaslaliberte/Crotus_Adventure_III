extends CharacterBody2D


var run_speed = 200.0
var jump_speed= -400.0


var gravity = 950

func get_input():
	velocity.x = 0
	var down = Input.is_action_pressed("ui_down")
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')
	var atk = Input.is_action_just_pressed("attaque")
	
	if right:
		if down:
			velocity.x += run_speed/2
		else:
			velocity.x += run_speed

	if left:
		if down:
			velocity.x -= run_speed/2
		else:
			velocity.x -= run_speed
	
	if is_on_floor() and jump:
		velocity.y = jump_speed	
	
		
func crotus_anim():
	
	var down = Input.is_action_pressed("ui_down")
	var down_deb = Input.is_action_just_pressed("ui_down")
	if velocity.x > 0 and is_on_floor():
		$crotus_anim.flip_h = false		
		if down:
			$crotus_anim.play("crotus_crouch_walk")
		else:
			$crotus_anim.play("crotus_course")
		
	if velocity.x == 0 and is_on_floor():
		if down:
			$crotus_anim.play("crotus_crouch_debut")
			$crotus_anim.play("crotus_crouch")
		else:
			$crotus_anim.play("crotus_rien")
		
	if velocity.x < 0 and is_on_floor():
		$crotus_anim.flip_h = true	
		if down:
			$crotus_anim.play("crotus_crouch_walk")
		else:
			$crotus_anim.play("crotus_course")
		
	if velocity.y < 0:
		
		if velocity.x > 0:
			$crotus_anim.flip_h = false	
			
		if velocity.x <0:
			
			$crotus_anim.flip_h = true
			
		$crotus_anim.play("crotus_saut_debut")
		$crotus_anim.play("crotus_en_air")

		
	if velocity.y > 0 and is_on_floor() == false:
		
		if velocity.x > 0:
			$crotus_anim.flip_h = false	
			
		if velocity.x <0:
			$crotus_anim.flip_h = true
		$crotus_anim.play("crotus_saut_fin")
		
		

func _physics_process(delta):

	velocity.y += gravity * delta
	get_input()
	crotus_anim()
	move_and_slide()

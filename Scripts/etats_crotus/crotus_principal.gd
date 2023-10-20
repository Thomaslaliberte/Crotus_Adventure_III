extends CharacterBody2D


#les vecteurs
var run_speed = 200.0
var jump_speed= -400.0
var gravite = 950

#les états
var lever = true

#les capacités
var glissade = false
var saut_x2 = 1

func _physics_process(_delta):
	
	if is_on_floor():
		if saut_x2 == 2:
			saut_x2 = 1
			
	move_and_slide()

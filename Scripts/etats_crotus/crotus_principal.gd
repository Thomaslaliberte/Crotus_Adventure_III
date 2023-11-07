extends CharacterBody2D



#les vecteurs
var run_speed = 200.0
var jump_speed= -400.0
var gravite = 950
var vie = 5
var vielle_vie = vie
signal vie_change(vie)
#les états
var lever = true

#les capacités
var glissade = false
var saut_x2 = 1

func _physics_process(_delta):
	
	if is_on_floor():
		if saut_x2 == 2:
			saut_x2 = 1
	
	if vielle_vie != vie:
		vielle_vie = vie
		vie_change.emit(vie)
	move_and_slide()



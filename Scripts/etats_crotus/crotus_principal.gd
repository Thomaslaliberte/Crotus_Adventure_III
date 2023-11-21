extends CharacterBody2D

signal degat_crotus
signal changer_vie
signal mort
#les vecteurs
var run_speed = 200.0
var jump_speed= -400.0
var gravite = 950
var vie = 5
var vielle_vie = vie
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
	move_and_slide()
	
	

func _perdre_vie():
	vie = vie -1
	changer_vie.emit(vie)
	

func _on_detection_attaque_area_entered(area):
	print(area)
	if area.is_in_group("attaque_ennemie"):
		_perdre_vie()
		if vie <= 0:
			mort.emit()
		else:
			degat_crotus.emit(area)

func _on_main_glissade_crotus():
	glissade = true


func _on_main_empecher_lever():
	lever = false



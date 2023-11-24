extends CharacterBody2D

signal degat_crotus
signal changer_vie
signal mort
signal faire_rien
#les vecteurs
var run_speed = 200.0
var jump_speed= -400.0
var gravite = 950
var vie = 5
var vielle_vie = vie
#les états
var lever = true
var son_mort_jouer = false
var son_mort = preload("res://Assets/sons/die_knight.wav")
#les capacités
var glissade = false
var saut_x2 = 0
	
	
	
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
	if area.is_in_group("attaque_ennemie"):
		_perdre_vie()
		if vie <= 0:
			mort.emit()
		else:
			degat_crotus.emit(area)
	if area.is_in_group("feu"):
		for n in 5:
			await get_tree().create_timer(1).timeout
			if vie < 5:
				vie += 1
				changer_vie.emit(vie)


func _on_main_glissade_crotus():
	glissade = true


func _on_main_empecher_lever():
	lever = false




func _on_main_signaler_saut():
	saut_x2 = 1


func _on_main_restart_crotus():
	faire_rien.emit()
	changer_vie.emit(vie)



func _on_mort_son_mort():
	if !$sons_crotus.is_playing() and son_mort_jouer == false:
		son_mort_jouer = true
		$sons_crotus.stream = son_mort
		$sons_crotus.play()

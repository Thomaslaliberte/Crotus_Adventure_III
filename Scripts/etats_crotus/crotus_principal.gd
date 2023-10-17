extends CharacterBody2D



var run_speed = 200.0
var jump_speed= -400.0
var glissade = false

var gravite = 950

func _physics_process(_delta):
	move_and_slide()

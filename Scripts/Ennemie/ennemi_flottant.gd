extends CharacterBody2D


var run_speed = 30.0
var jump_speed = -40
var timer = Timer.new()
var gravite = 950
var cible
var vie = 2

func _ready():
	timer.set_wait_time(3)
	self.add_child(timer)
	timer.one_shot = true
	timer.start()
	
		
func _physics_process(_delta):
	
	move_and_slide()


		

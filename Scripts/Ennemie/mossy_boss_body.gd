extends CharacterBody2D
signal victoire
var run_speed = 100
var jump_speed = -1200
var timer = Timer.new()
var gravite = 950
var vie = 20

var cible
var marker

func _ready():
	timer.set_wait_time(3)
	self.add_child(timer)
	timer.one_shot = true
	timer.start()
	
	marker = $dague_marker
	
		
func _physics_process(_delta):
	move_and_slide()
	



func _on_mort_terminer():
	victoire.emit()

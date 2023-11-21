extends Node

@onready var coeur1 = get_child(0)
@onready var coeur2 = get_child(1)
@onready var coeur3 = get_child(2)
@onready var coeur4 = get_child(3)
@onready var coeur5 = get_child(4)


# Called when the node enters the scene tree for the first time.
func _ready():
	
	coeur1.set_visible(true) 
	coeur2.set_visible(true) 
	coeur3.set_visible(true) 
	coeur4.set_visible(true) 
	coeur5.set_visible(true) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_crotus_body_changer_vie(vie):
	var temp = 0
	while temp < vie:
		get_child(temp).set_visible(true) 
		temp += 1
	while temp < 5:
		get_child(temp).set_visible(false) 
		temp +=1 # Replace with function body.	

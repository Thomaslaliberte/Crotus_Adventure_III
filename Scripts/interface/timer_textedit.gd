extends TextEdit


var temps = 0;
func _ready():
	pass 



func _process(delta):
	temps += get_child(0).wait_time


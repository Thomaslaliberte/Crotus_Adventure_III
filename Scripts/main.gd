extends Node

var 
# Called when the node enters the scene tree for the first time.
func _ready():
	var niv_ressource = load("res://Scenes/niveaux/foret_niv_1.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	if get_child(0).get_node('Sortie_foret'):
		get_child(0).get_node('Sortie_foret').sortie.connect(_on_sortie_mousse_sortie)
	if get_child(0).get_node('crotus_body'):
		get_child(0). get_node('crotus_body').get_node('machine_etat').get_node('mort').fin.connect(_fin)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sortie_mousse_sortie():
	var niv_actuel = get_child(0)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	var niv_ressource = load("res://Scenes/niveaux/mossy_niv_1.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)

func _fin():
	print('fin')

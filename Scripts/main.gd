extends Node

signal glissade_crotus
signal empecher_lever
signal cacher_bouteille
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var niv_ressource = load("res://Scenes/niveaux/foret_niv_1.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	if get_child(1).get_node('sortie_foret'):
		get_child(1).get_node('sortie_foret').sortie_foret.connect(_on_sortie_foret_sortie)
		
	
		
	if get_node('crotus_body'):
		get_node('crotus_body').get_node('machine_etat').get_node('mort').fin.connect(_fin)
	if get_child(1).get_node("bottle_area_2d"):
		get_child(1).get_node("bottle_area_2d").glissade.connect(_glissade_crotus)
	if get_child(1):
		get_child(1).envoyer_lever.connect(_empecher_lever_crotus)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sortie_foret_sortie():
	var niv_actuel = get_child(1)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	var niv_ressource = load("res://Scenes/niveaux/mossy_niv_1.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	get_child(0).position.x = 47
	get_child(0).position.y = 125
	if get_child(1).get_node('sortie_mousse'):
		get_child(1).get_node('sortie_mousse').sortie_mousse.connect(_on_sortie_mousse_sortie)

func _on_sortie_mousse_sortie():
	var niv_actuel = get_child(1)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	var niv_ressource = load("res://Scenes/niveaux/foret_niv_1.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	get_child(0).position.x = 3209
	get_child(0).position.y = 423
	if get_child(1).get_node('sortie_foret'):
		get_child(1).get_node('sortie_foret').sortie_foret.connect(_on_sortie_foret_sortie)
	cacher_bouteille.emit()
	
func _fin():
	print('fin')

func _glissade_crotus():
	glissade_crotus.emit()
	
func _empecher_lever_crotus():
	empecher_lever.emit()

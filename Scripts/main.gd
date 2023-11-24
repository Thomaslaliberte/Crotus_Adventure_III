extends Node

signal glissade_crotus
signal empecher_lever
var saut = false
signal signaler_saut
signal restart_crotus
# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_child(0).position.x = 70
	get_child(0).position.y = 532
	get_child(0).saut_x2 = 0
	get_child(0).vie = 5
	get_child(0).glissade = false
	activer_niv_1()
# Called every frame. 'delta' is the elapsed time since the previous frame.

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
	
	if get_child(1).get_node('sortie_mousse_passage1'):
		get_child(1).get_node('sortie_mousse_passage1').sortie_mousse_passage1.connect(_on_sortie_mousse_passage1_sortie)
	
	if get_child(1).get_node('sortie_mousse_passage2'):
		get_child(1).get_node('sortie_mousse_passage2').sortie_mousse_passage2.connect(_on_sortie_mousse_passage2_sortie)

		
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
	get_child(1).cacher_bouteille = true
	
	if get_child(1):
		get_child(1).envoyer_lever.connect(_empecher_lever_crotus)
	

func _on_sortie_mousse_passage1_sortie():
	var niv_actuel = get_child(1)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	var niv_ressource = load("res://Scenes/niveaux/mossy_niv_2.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	get_child(0).position.x = 63
	get_child(0).position.y = 76
	
	if get_child(1).get_node('sortie_foret'):
		get_child(1).get_node('sortie_foret').sortie_foret.connect(_on_sortie_foret_sortie)
	
	if get_child(1).get_node('sortie_passage_mousse_1'):
		get_child(1).get_node('sortie_passage_mousse_1').sortie_passage_mousse_1.connect(_on_sortie_passage_mousse_1_sortie)
	
	if saut:
		saut = true
		get_child(1).cacher_saut = true
	
	if get_child(1).get_node("rune_saut_area_2d"):
		get_child(1).get_node("rune_saut_area_2d").double_saut.connect(_saut_crotus)
	
func _on_sortie_mousse_passage2_sortie():
	var niv_actuel = get_child(1)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	var niv_ressource = load("res://Scenes/niveaux/mossy_niv_2.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	get_child(0).position.x = 1415
	get_child(0).position.y = -100
	
	if get_child(1).get_node('sortie_foret'):
		get_child(1).get_node('sortie_foret').sortie_foret.connect(_on_sortie_foret_sortie)
	
	if get_child(1).get_node('sortie_passage_mousse_1'):
		get_child(1).get_node('sortie_passage_mousse_1').sortie_passage_mousse_1.connect(_on_sortie_passage_mousse_1_sortie)		
	
	get_child(1).cacher_saut = true
	
func _on_sortie_passage_mousse_1_sortie():
	var niv_actuel = get_child(1)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	var niv_ressource = load("res://Scenes/niveaux/mossy_niv_1.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	
	get_child(0).position.x = 1610
	get_child(0).position.y = 1329
	
	if get_child(1).get_node('sortie_mousse'):
		get_child(1).get_node('sortie_mousse').sortie_mousse.connect(_on_sortie_mousse_sortie)
	
	if get_child(1).get_node('sortie_mousse_passage1'):
		get_child(1).get_node('sortie_mousse_passage1').sortie_mousse_passage1.connect(_on_sortie_mousse_passage1_sortie)
	
	if get_child(1).get_node('sortie_mousse_passage2'):
		get_child(1).get_node('sortie_mousse_passage2').sortie_mousse_passage2.connect(_on_sortie_mousse_passage2_sortie)

func _fin():
	get_child(0).position.x = 100000
	get_child(0).position.y = 100000
	get_child(0).get_node("Camera2D").enabled = false
	var niv_actuel = get_child(1)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	var niv_ressource = load("res://Scenes/ecrans/ecran_mort.tscn")
	var niv = niv_ressource.instantiate()
	add_child(niv)
	if get_child(1).get_node('boutton_restart'):
		get_child(1).get_node('boutton_restart').pressed.connect(_restart)

func _restart():
	await get_tree().create_timer(1).timeout
	var niv_actuel = get_child(1)
	remove_child(niv_actuel)
	niv_actuel.call_deferred("free")
	
	activer_niv_1()
	
	get_child(0).saut_x2 = 0
	get_child(0).vie = 5
	get_child(0).glissade = false
	get_child(0).get_node("Camera2D").enabled = true
	
	restart_crotus.emit()
	
	get_child(0).position.x =70
	get_child(0).position.y = 530
	get_child(0).get_node("crotus_anim").play("crotus_rien")
	
	saut = false

func activer_niv_1():
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
	

func _glissade_crotus():
	glissade_crotus.emit()
	
func _empecher_lever_crotus():
	empecher_lever.emit()
	
func _saut_crotus():
	saut = true
	signaler_saut.emit()

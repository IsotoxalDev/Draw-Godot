extends Node

const pixlb = preload("res://Scenes/pixlb.tscn")
var p
var mousepos = 0
var play = 0

func _ready():
	get_node("clear").hide()
	set_process_input(true)
	set_physics_process(true)
	pass 


func _input(event):
	if event.is_action_pressed("Draw"):
		p = 1
	if event.is_action_released("Draw"):
		p = 0
	

func draw(pos):
	if play == 1:
		var pixl = pixlb.instance()
		pixl.set_position(pos)
		get_node("paint").add_child(pixl)
		pass

func _physics_process(delta):
	print(p)
	mousepos = get_viewport().get_mouse_position()
	if p == 1:
		draw(mousepos)
	if play == 1:
		get_node("clear").show()
	#while p != 0:
	#mousepos = get_viewport().get_mouse_position()
		#draw(mousepos)
	pass


func _on_clear_pressed():
	for i in get_node("paint").get_child_count():
		get_node("paint").get_child(i).queue_free()
	pass 


func _on_TextureButton_pressed():
	play = 1
	get_node("TextureButton").hide()
	pass 

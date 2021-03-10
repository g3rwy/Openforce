extends Control

var star = preload("res://Assets/Star.tscn")
onready var stars_root = $Background/Stars

func _ready():
	#yield(get_tree().create_timer(4), 'timeout')
	randomize()
	for i in range(200):
		stars_root.call_deferred("add_child", star.instance())

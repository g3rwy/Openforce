extends Node

var star = preload("res://Assets/Star.tscn")
onready var root = get_tree().get_root()

func _ready():
	$"Camera2D/Background Color".rect_global_position = Vector2(-OS.window_size.x / 2,-OS.window_size.y / 2)
	$"Camera2D/Background Color".rect_size = OS.window_size
	#yield(get_tree().create_timer(4), 'timeout')
	randomize()
	for i in range(200):
		root.call_deferred("add_child", star.instance())

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Globals.star_speed = 20
		print(Globals.star_speed)

extends Node

func _process(delta):
	pass

func _ready():
	$Rough_Fix.offset = OS.window_size / 2


func _on_quit():
	get_tree().quit()


func _on_play():
	pass

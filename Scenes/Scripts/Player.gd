extends KinematicBody2D

export var walking_speed := 200
export var jump_speed := 300
export var gravity := 30

var velocity = Vector2()

func _ready():
	pass


func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = walking_speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -walking_speed

	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump_speed
	else:
		velocity.y += gravity
	velocity = move_and_slide(velocity)

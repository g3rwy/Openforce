extends Line2D

var z = 600 # imaginary z space
var w = 0.01 #width of Line2D

var pz = z # Previous location of our star
onready var cords = RandomNumberGenerator.new()

func _ready():
	width = w
	cords.randomize()
	global_position = Vector2(cords.randi_range(-200,200),cords.randi_range(-200,200))
	add_point(global_position,0)
	add_point(global_position,1)

func _physics_process(delta):
	width += w
	z = z - Globals.star_speed * delta # moving towards
	move()
	draw_lines()

func move():
	var sx = range_lerp(global_position.x / z,0,1,0,600)
	var sy = range_lerp(global_position.y / z,0,1,0,600)
	global_position = Vector2(sx,sy)
	pz = z


# When star gets out of the screen, we simply put it back again at the start with default z
func _on_screen_exited():
	global_position = Vector2(cords.randi_range(-200,200),cords.randi_range(-200,200))
	z = 600
	set_point_position(0,global_position)
	set_point_position(1,global_position)
	width = w

func draw_lines():
	var px = range_lerp(global_position.x / pz,0,1,0,600)
	var py = range_lerp(global_position.y / pz,0,1,0,600)
	set_point_position(1,global_position)


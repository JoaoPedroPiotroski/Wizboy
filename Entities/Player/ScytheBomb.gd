extends Entity

var direction : Vector2
var velocity : Vector2
var gravity : int = 300

func start(in_layer, in_direction, force, pos):
	global_position = pos
	layer = in_layer
	direction = in_direction
	velocity = direction * force
	
func _physics_process(delta):
	rotation_degrees += 360 * delta
	var col = move_and_collide(velocity * delta)
	if col:
		var scy = load("res://Entities/Player/ScytheBombExplosion.tscn")
		var obj = scy.instance()
		obj.start(layer, global_position)
		get_parent().get_parent().add_child(obj)
		_die()

func _on_Lifetime_timeout():
	var scy = load("res://Entities/Player/ScytheBombExplosion.tscn")
	var obj = scy.instance()
	obj.start(layer, global_position)
	get_parent().add_child(obj)
	_die()

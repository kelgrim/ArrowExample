extends KinematicBody2D


export var speed = 100

var last_direction = Vector2.ZERO
var packed_arrow = preload("res://projectile/Arrow.tscn")

func _process(delta):
	var move_x = Input.get_action_strength("right") - Input.get_action_strength("left")
	var move_y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	var direction = Vector2(move_x, move_y).normalized()
	
	if (direction != Vector2.ZERO):
		last_direction = direction
	
	if (Input.is_action_just_pressed("shoot")):
		var arrow = packed_arrow.instance()
		arrow.global_position = global_position
		arrow.rotation = last_direction.angle()
		get_parent().add_child(arrow)
	
	
	move_and_slide(direction * speed)

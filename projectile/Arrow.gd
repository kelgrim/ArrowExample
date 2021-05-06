extends Area2D

var speed = 200

func _process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta

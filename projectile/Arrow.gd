extends Area2D
var pushback_strength = 50
var speed = 200

func _process(delta):
	position += Vector2.RIGHT.rotated(rotation) * speed * delta


func _on_Arrow_area_entered(area):
	if area.has_method("on_pushback"):
		area.on_pushback(Vector2.RIGHT.rotated(rotation), pushback_strength)
		queue_free()

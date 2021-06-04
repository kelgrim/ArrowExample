extends Area2D

func on_pushback(direction: Vector2, pushback_strength: int):
	get_parent().do_pushback(direction, pushback_strength)	

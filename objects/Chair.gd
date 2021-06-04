extends StaticBody2D

# We'll use either a constant speed or one that is quick at the start and slows down quickly
export var use_constant_speed: bool = false
export var lerp_weight: float = 5
export var pushback_speed: float = 150

export var pushback_complete_distance: float = 0.5

var target_position: Vector2 = Vector2.ZERO
var is_being_pushed = false

func _process(delta):
	if is_being_pushed:
		if use_constant_speed:
			position += position.direction_to(target_position) * pushback_speed  * delta
		else:
			position = lerp(position, target_position, lerp_weight * delta)
			
		if (position.distance_to(target_position) < pushback_complete_distance):
			position = target_position
			is_being_pushed = false


func do_pushback(direction: Vector2, pushback_strength: int):
	target_position = position + direction * pushback_strength
	is_being_pushed = true
		

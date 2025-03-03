extends CharacterBody2D

var speed: float = 500
var direction: Vector2 = Vector2.RIGHT

func _process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
	
	if position.x > 1000:
		direction = Vector2.LEFT
	elif position.x < 0:
		direction = Vector2.RIGHT

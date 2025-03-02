extends Node2D

var speed: float = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * speed * delta
	
	if Input.is_action_just_pressed("primary action"):
		print("shoot laser")
		
	if Input.is_action_just_pressed("secondary action"):
		print("shoot grenade")

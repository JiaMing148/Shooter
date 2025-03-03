extends CharacterBody2D

var speed: float = 20000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("primary action"):
		print("shoot laser")
		
	if Input.is_action_just_pressed("secondary action"):
		print("shoot grenade")

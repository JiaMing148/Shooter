extends CharacterBody2D

signal player_shoot_laser(pos: Vector2, dir: Vector2)
signal player_shooot_grenade(pos: Vector2, dir: Vector2)

var speed: float = 800
var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	var mouse_position = get_global_mouse_position();
	look_at(mouse_position)
	
	if can_laser and Input.is_action_pressed("primary action"):
		can_laser = false
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers.pick_random()
		var look_direction = (mouse_position - position).normalized()
		player_shoot_laser.emit(selected_laser.global_position, look_direction)
		$LaserTimer.start()
		$ShootParticle2D.restart()
		
	if can_grenade and Input.is_action_just_pressed("secondary action"):
		can_grenade = false
		var look_direction = (mouse_position - position).normalized()
		player_shooot_grenade.emit($GrenadeStartPositions.global_position, look_direction)
		$GrenadeTimer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true

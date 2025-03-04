extends CharacterBody2D

signal player_shoot_laser
signal player_shooot_grenade

var speed: float = 800
var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if can_laser and Input.is_action_pressed("primary action"):
		player_shoot_laser.emit()
		can_laser = false
		$LaserTimer.start()
		
	if can_grenade and Input.is_action_just_pressed("secondary action"):
		player_shooot_grenade.emit()
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true

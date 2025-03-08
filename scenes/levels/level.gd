extends Node2D

var laser_scene = preload("res://scenes/projectiles/laser.tscn")
var grenade = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate() -> void:
	print("on player entered gate")


func _on_gate_player_exited_gate() -> void:
	print("on player exited gate")


func _on_player_player_shoot_laser(pos, dir) -> void:
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = dir
	laser.rotation_degrees = rad_to_deg(dir.angle())
	$Projectiles.add_child(laser)

func _on_player_player_shooot_grenade(pos, dir) -> void:
	var grenade = grenade.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)
	

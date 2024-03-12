extends StaticBody2D

signal attack_input_pressed(bullet_path: Resource, spawn_position: Vector2, damage: int, fire_power: int)

@export var fire_power: int = 550
@export var damage: int = 25

var bullet_path := preload("res://scenes/bullet/bullet.tscn")

func _process(delta: float) -> void:
	# Handles shooting input
	if Input.is_action_just_pressed("attack"):
		attack_input_pressed.emit(bullet_path, $Marker2D.global_position, damage, fire_power)
	
	# Aim at mouse position
	look_at(get_global_mouse_position())

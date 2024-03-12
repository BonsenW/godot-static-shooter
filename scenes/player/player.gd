extends StaticBody2D

## Emitted when the attack input is pressed
signal attack_input_pressed(bullet_path: Resource, spawn_position: Vector2, damage: int, fire_power: int)

## Emitted when the players health is changed
signal health_change(current_health: int)

## Determines bullet velocity
@export var fire_power: int = 550

## Determines bullet damage
@export var damage: int = 25

## Players health
var health: int = 100 :
	set = _set_health

## The path for instantiating
var bullet_path := preload("res://scenes/bullet/bullet.tscn")


func _process(delta: float) -> void:
	# Handles shooting
	if Input.is_action_just_pressed("attack"):
		attack_input_pressed.emit(bullet_path, $Marker2D.global_position, damage, fire_power)
	
	# Aims at mouse position
	look_at(get_global_mouse_position())


# Sets health
func _set_health(h: int):
	health = h
	
	# Death check
	if health <= 0:
		queue_free()
		
	health_change.emit(health)

extends Node2D

@onready var game_gui: GameGUI = $GameGUI
@onready var player = $Player

func _ready():
	game_gui.health_bar.init_health(player.health)


## Instantiates bullet on player attack input pressed
func _on_player_attack_input_pressed(bullet_path: Resource, spawn_position: Vector2, damage: int, fire_power: int) -> void:
	# Instantiate the bullet
	var bullet := bullet_path.instantiate() as Area2D
	# Set properties of bullet
	bullet.position = spawn_position
	bullet.damage = damage
	bullet.direction = spawn_position.normalized()
	bullet.speed = fire_power
	# Add the bullet instance as a child of the current scene
	add_child(bullet)


func _on_player_health_change(current_health):
	game_gui.health_bar.health = current_health

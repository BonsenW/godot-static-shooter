extends Node2D

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

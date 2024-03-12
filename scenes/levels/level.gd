extends Node2D

func _on_player_attack_input_pressed(bullet_path: Resource, spawn_position: Vector2, damage: int, fire_power: int) -> void:
	# Instantiate the bullet
	var bullet := bullet_path.instantiate() as RigidBody2D
	# Set properties of bullet
	bullet.position = spawn_position
	bullet.damage = damage
	# Shoot bullet
	print(fire_power)
	bullet.apply_impulse(spawn_position.normalized() * fire_power)
	# Add the bullet instance as a child of the current scene
	add_child(bullet)

extends Node2D

func _on_player_attack_input_pressed(bullet_path: Resource, spawn_position: Vector2) -> void:
	# Instantiate the bullet
	var bullet: RigidBody2D = bullet_path.instantiate() as RigidBody2D
	
	# Set properties of bullet
	bullet.position = spawn_position
	
	#bullet.apply_impulse(spawn_position*)
	
	# Add the bullet instance as a child of the current scene
	add_child(bullet)

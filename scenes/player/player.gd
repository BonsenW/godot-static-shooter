extends StaticBody2D

@export var bullet: PackedScene
@export var fire_power: int = 22

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("attack"):
		shoot()
		
	look_at(get_global_mouse_position())


func shoot() -> void:
	# Instantiate the bullet
	var bullet_instance: RigidBody2D = bullet.instantiate() as RigidBody2D
	
	# Add the bullet instance as a child of the current scene
	add_child(bullet_instance)
	
	# Set the properties of the bullet
	bullet_instance.position = $Marker2D.position

	bullet_instance.linear_velocity = get_global_mouse_position() - bullet_instance.position

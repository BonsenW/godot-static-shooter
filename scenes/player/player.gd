extends CharacterBody2D

@export var bullet: PackedScene
@export var speed: int = 3000
@export var fire_power: int = 5000

func _physics_process(delta: float) -> void:
	# Gets the direction of movement as a vector
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down");

	# Changes velocity of player
	velocity = speed * direction * delta
	
	if Input.is_action_just_pressed("attack"):
		var bullet_instance: RigidBody2D = bullet.instantiate() as RigidBody2D
		bullet_instance.apply_impulse(Vector2.UP*fire_power);
		add_child(bullet.instantiate())

	# Applies movement calculations
	move_and_slide()

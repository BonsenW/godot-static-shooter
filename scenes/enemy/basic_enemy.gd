class_name BasicEnemy

extends CharacterBody2D

@export var health: int = 100
@export var speed: int = 150

@onready var health_bar = $HealthBar

func _ready() -> void:
	health_bar.init_health(health)

func _physics_process(delta: float) -> void:
	# Look at player
	look_at(Player.position)
	# Move towards the players direction
	var direction := (Player.position - position).normalized()
	velocity = speed * direction
	# Apply movement calculations
	move_and_slide()

func hit(damage: int) -> void:
	health -= damage
	
	health_bar.health = health
	
	if health <= 0:
		queue_free()

class_name HealthBar

extends ProgressBar

## Reference to damage delay timer
@onready var damage_delay_timer: Timer = $DamageDelayTimer

## Reference to damage bar
@onready var damage_bar: ProgressBar = $DamageBar

## The health value
var health = 0 : 
	set = _set_health


## Required for initialisation of this node
func init_health(h: int) -> void:
	# Sets health
	health = h
	# Sets max and current value of healthbar
	max_value = health
	value = health
	# Sets max and current value of damage bar
	damage_bar.max_value = health
	damage_bar.value = health


## Sets the health value
func _set_health(new_health):
	# Updates health and health bar value
	var prev_health = health
	health = min(max_value, new_health)
	value = health
	
	# Delets health bar if its 0
	if health <= 0:
		queue_free()
		
	# If damage taken, start damage delay timer 
	if health < prev_health:
		damage_delay_timer.start()
	else:
		# else update damage bar value
		damage_bar.value = health


## Damage delay signal
func _on_damage_delay_timer_timeout() -> void:
	damage_bar.value = health

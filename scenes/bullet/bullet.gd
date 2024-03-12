extends Area2D

var speed: int
var damage: int
var direction: Vector2

func _process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hit"):
		body.hit(damage)
		queue_free()

func _on_life_time_timer_timeout() -> void:
	queue_free()

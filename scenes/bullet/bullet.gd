extends RigidBody2D

var damage: int = 0

func _on_body_entered(body: Node) -> void:
	if body.has_method("hit"):
		body.hit(damage)
		queue_free()

func _on_life_time_timer_timeout() -> void:
	queue_free()

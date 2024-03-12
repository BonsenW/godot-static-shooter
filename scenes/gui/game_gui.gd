class_name GameGUI

extends Control

@onready var health_bar: HealthBar = $HealthBar


func init_health(h: int):
	health_bar.init_health(h)

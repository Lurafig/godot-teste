extends Area2D

@onready var timer: Timer = $Timer
@onready var menu_de_morte: CanvasLayer = $"../Player/Camera2D/Menu de Morte"



func _on_body_entered(body: Node2D) -> void:
	menu_de_morte.visible = true
	Globals.reset_globals()
	get_tree().paused = true
## func _on_timer_timeout() -> void:
##	get_tree().reload_current_scene()

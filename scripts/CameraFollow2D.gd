extends Camera2D

onready var player = $"../Player"

func _physics_process(delta):
	position += (player.get_position()-position)*0.2
	rotation = player.rotation

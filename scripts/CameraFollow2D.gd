extends Camera2D

export(NodePath) var player_path: NodePath
onready var player = get_node(player_path)

func _physics_process(delta):
	position += (player.get_position()-position)*0.2
	rotation = player.rotation

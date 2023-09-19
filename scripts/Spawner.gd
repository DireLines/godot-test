extends Node2D

export var platform_scene: PackedScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1000):
		var platform = platform_scene.instance()
		platform.position = Vector2(rand_range(-4000,4000),rand_range(-4000,4000))
		add_child(platform)

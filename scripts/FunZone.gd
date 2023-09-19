extends Area2D

func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _on_body_entered(body):
	print(body.name, " is now having fun :D")

func _on_body_exited(body):
	print(body.name, " is no longer having fun :(")

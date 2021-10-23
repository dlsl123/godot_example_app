extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_quit():
	get_tree().quit()


func _on_login():
	find_node("AnimationPlayer").play("Login");

func _on_logout():
	find_node("AnimationPlayer").play_backwards("Login");

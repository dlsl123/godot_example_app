extends CenterContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var anim = find_node("SpinnerAnimation");

func start():
	self.visible = true;
	anim.play("Spin");

func stop():
	self.visible = false;
	anim.stop();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
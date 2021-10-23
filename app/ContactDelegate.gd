extends PanelContainer

export var contact_name = "n/a";
export var contact_surname = "n/a";

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	find_node("NameValue").text = contact_name;
	find_node("SurnameValue").text = contact_surname;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

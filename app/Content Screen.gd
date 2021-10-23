extends PanelContainer

signal quit();
signal logout();

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var contacts = [
	{"name": "Tyrell", "surname": "Wright"},
	{"name": "Rachael", "surname": "Freeman"},
	{"name": "Whitney", "surname": "Roche"},
	{"name": "Tatiana", "surname": "Gentry"},
	{"name": "Alena", "surname": "Lake"},
	{"name": "Carmen", "surname": "Barron"},
	{"name": "Magnus", "surname": "Kaye"},
	{"name": "Emma", "surname": "Casey"},
	{"name": "Iestyn", "surname": "Garrison"},
	{"name": "Bertram", "surname": "Colon"},
	{"name": "Keanan", "surname": "Kelly"},
	{"name": "Mariella", "surname": "Doe"},
	{"name": "Mariella", "surname": "Mueller"},
	{"name": "Woody", "surname": "Henderson"},
	{"name": "Dua", "surname": "Woodcock"},
	{"name": "Lylah", "surname": "Bonner"},
];


# Called when the node enters the scene tree for the first time.
func _ready():
	var delegate_scene = preload("res://ContactDelegate.tscn");
	var container = find_node("ContactContainer");
	for contact in contacts:
		var delegate = delegate_scene.instance();
		delegate.contact_name = contact["name"];
		delegate.contact_surname = contact["surname"];
		container.add_child(delegate);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_QuitButton_pressed():
	emit_signal("quit");


func _on_LogoutButton_pressed():
	emit_signal("logout");

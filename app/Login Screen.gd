extends PanelContainer

signal quit();
signal login();

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ws_url = "ws://127.0.0.1:8765";
onready var ws_client = find_node("WebsocketClient");

onready var username_entry = find_node("UsernameEntry");
onready var password_entry = find_node("PasswordEntry");
onready var error_label = find_node("ErrorLabel");
onready var spinner = find_node("Spinner")

# Called when the node enters the scene tree for the first time.
func _ready():
	ws_client.connect_to_ws(ws_url);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func clear_input_fields():
	username_entry.clear();
	password_entry.clear();
	error_label.visible=false;

func _on_QuitButton_pressed():
	emit_signal("quit");


func _on_LoginButton_pressed():
	error_label.visible=false;
	spinner.start();
	ws_client.send(JSON.print({"user": username_entry.text, "password": password_entry.text}));


func _on_WebsocketClient_data_received(message):
	spinner.stop();
	var parsed_message = JSON.parse(message).result;
	if parsed_message.get('accepted'):
		emit_signal("login");
	else:
		error_label.text = parsed_message.get("error");
		error_label.visible = true;

extends Node

signal data_received(message)

var _client = WebSocketClient.new()
var _client_connected = false


func is_ws_connected():
	return _client_connected


func connect_to_ws(url: String):
	print("Try to connect")
	_client.connect("connection_closed", self, "_on_ws_closed")
	_client.connect("connection_error", self, "_on_ws_closed")
	_client.connect("connection_established", self, "_on_ws_connected")
	_client.connect("data_received", self, "_on_ws_data_received")
	
	var err = _client.connect_to_url(url)
	if err != OK:
		print("Could not connect to Websocket: ", err)
		_client_connected = false
		set_process(false)
	else:
		set_process(true)


func send(message: String):
	if _client_connected:
		_client.get_peer(1).put_packet(message.to_utf8())
	else:
		print("Unable to send message, no WS connection")


func _on_ws_closed(was_clean = false):
	_client_connected = false
	set_process(false)
	print("Websocket closed. Clean: ", was_clean)


func _on_ws_connected(proto = ""):
	_client_connected = true
	print("Websocket connected with protocol: ", proto)


func _on_ws_data_received():
	var response = _client.get_peer(1).get_packet().get_string_from_utf8()
	emit_signal("data_received", response)


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_client.poll()


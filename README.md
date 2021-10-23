# Example app using Godot as UI framework

This example contains
 - a very simple UI application consisting of a login screen and a content screen
 - a python3 websocket server as backend

## Setup

- download the Godot editor [here](https://godotengine.org/download/linux)
- go to the ws_server folder and install the websockets python package, e.g. via `pip3 install -r requirements.txt`

## Running the app

- start the backend service via `python3 ws_server/ws_server.py`
- start the Godot editor and open `project.godot` in the `app` folder as project
- click the play button in the editor
- to log in, use the login `admin` with the password `admin`

## LoginScreen
Contains:
- websocket client
- rotating spinner while waiting for a response from the ws_server
- text input fields

## ContentScreen
Contains:
- scrollable list
- model/view pattern for the list entries

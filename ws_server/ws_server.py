import websockets
import asyncio
import json


passwords = {
    "admin": "admin"
}

delay_in_s = 1.5


async def check_password(websocket, _):
    async for raw_msg in websocket:
        try:
            await asyncio.sleep(delay_in_s)
            print(f"checking password for {raw_msg}")

            response = {
                "accepted": False
            }

            msg = json.loads(raw_msg)

            user = msg.get("user")
            password = msg.get("password")

            if user is None:
                response['error'] = "Missing entry: 'user'"
            elif password is None:
                response['error'] = "Missing entry: 'password'"
            elif user not in passwords:
                response['error'] = "Invalid user"
            elif passwords[user] != password:
                response['error'] = "Invalid password"
            else:
                response['accepted'] = True
        except Exception as e:
            response['error'] = f"{type(e).__name__}: {str(e)}"

        await websocket.send(json.dumps(response))

print("Starting websocket server")
asyncio.get_event_loop().run_until_complete(
    websockets.serve(check_password, "127.0.0.1", 8765)
)
print("Websocket server started")
asyncio.get_event_loop().run_forever()

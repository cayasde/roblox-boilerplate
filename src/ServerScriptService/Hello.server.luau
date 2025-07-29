local Players = game:GetService("Players")

local Hello = require("@Shared/Hello")
local Net = require("@Net/Server")

_G.__DEV__ = true

if _G.__DEV__ then print("In dev mode.") end

print(Hello:format("Server"))

Players.PlayerAdded:Connect(function(player: Player)
	Net.hello.Server.Fire(player, "Hello from server!")
end)

Net.hello.Client.On(function(player: Player, message: Net.hello_message)
	print(`[Client → Server] {player.Name}: "{message}"`)
end)

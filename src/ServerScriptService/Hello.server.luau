local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Net = require(ReplicatedStorage.Net.Server)
local Hello = require(ReplicatedStorage.Hello)

_G.__DEV__ = true

if _G.__DEV__ then
	print("In dev mode.")
end

print(Hello:format("Server"))

Players.PlayerAdded:Connect(function(player: Player)
	Net.hello.Server.Fire(player, "Hello from server!")
end)

Net.hello.Client.On(function(player: Player, message: Net.hello_message)
	print(`[Client → Server] {player.Name}: "{message}"`)
end)

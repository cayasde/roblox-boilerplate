local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Net = require(ReplicatedStorage.Net.Server)
local hello = require(ReplicatedStorage.hello)

print(hello:format("Server"))

Players.PlayerAdded:Connect(function(player: Player)
	Net.hello.Server.Fire(player, "Hello from server!")
end)

Net.hello.Client.On(function(player: Player, message: Net.hello_message)
	print(`[Client → Server] {player.Name}: "{message}"`)
end)

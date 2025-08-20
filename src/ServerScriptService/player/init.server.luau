local Players = game:GetService("Players")
local start_playtime = require("@server/player/playtime")
local start_profile = require("@server/player/profile")

start_profile()

Players.PlayerAdded:Connect(function(player: Player)
	start_playtime(player)
end)

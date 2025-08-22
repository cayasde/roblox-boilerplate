local conch = require("@pkg/conch")
local handle_players = require("@utils/handle_players")

return function()
	conch.initiate_default_lifecycle()

	local commands = script:FindFirstChild("commands")
	local roles = {
		dev = require("@server/player/console/roles/dev"),
	}

	for _, command: Instance in commands:GetChildren() do
		if not command:IsA("ModuleScript") then return end
		local _required = require(command) :: any
	end

	handle_players(function(player: Player)
		roles.dev(player)
	end)
end

local conch = require("@pkg/conch")
local handle_players = require("@utils/handle_players")

return function()
	conch.initiate_default_lifecycle()

	local roles: { [string]: (Player) -> () } = {}
	local commands_path = script:FindFirstChild("commands")
	local roles_path = script:FindFirstChild("roles")

	-- setup roles
	for _, role: Instance in roles_path:GetChildren() do
		if not role:IsA("ModuleScript") then return end
		roles[role.Name] = require(role) :: any
	end

	-- setup commands
	for _, command: Instance in commands_path:GetChildren() do
		if not command:IsA("ModuleScript") then return end
		local _required = require(command) :: any
	end

	-- setup players
	handle_players(function(player: Player)
		for _, role in roles do
			role(player)
		end
	end)
end

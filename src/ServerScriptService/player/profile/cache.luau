local types = require("@server/player/profile/types")

type Profile = types.Profile

local M = {}
M._profiles = {} :: { [Player]: Profile }

function M.get(player: Player): Profile
	repeat
		task.wait()
	until M._profiles[player]

	return M._profiles[player]
end

function M.add(player: Player, profile: Profile)
	M._profiles[player] = profile
end

function M.delete(player: Player)
	M._profiles[player] = nil
end

return M

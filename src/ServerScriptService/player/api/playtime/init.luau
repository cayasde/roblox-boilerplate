local profile = require("@server/player/api/profile")

local M = {}

function M.get_playtime(player: Player)
	return profile.get(player):andThen(function(data)
		return data.playtime:get()
	end)
end

function M.on_changed(player: Player, callback: (number) -> ())
	profile.get(player):andThen(function(data)
		local playtime = data.playtime
		playtime:on_changed(callback)
	end)
end

return M

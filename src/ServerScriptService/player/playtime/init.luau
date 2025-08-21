local profile = require("@server/player/api/profile")

return function(player: Player)
	profile.get(player):andThen(function(data)
		local playtime = data.playtime

		while task.wait(1) do
			if not profile.is_active(player) then break end
			playtime:set(playtime:get() + 1)
		end
	end)
end

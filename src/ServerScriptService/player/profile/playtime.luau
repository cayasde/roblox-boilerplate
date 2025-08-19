local types = require("@server/player/profile/types")

return function(profile: types.Profile)
	task.spawn(function()
		while task.wait(1) do
			profile.Data.playtime += 1
		end
	end)
end

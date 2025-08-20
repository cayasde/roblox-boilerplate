local profile_types = require("@server/player/profile/types")
local types = require("@server/player/profile/reactive/types")

type Interface = types.Interface
type Profile = profile_types.Profile

return function(self: Interface, profile: Profile)
	self.playtime:on_changed(function(new_value: number)
		profile.Data.playtime = new_value
	end)
end

local profile_types = require("@server/player/profile/types")
local reconcile = require("@server/player/profile/reactive/reconcile")
local types = require("@server/player/profile/reactive/types")
local value = require("@utils/value")

type Profile = profile_types.Profile
type Value<T> = value.Interface<T>
type Interface = types.Interface

return function(profile: Profile): Interface
	local data = profile.Data
	local self = {}

	self.playtime = value(data.playtime)
	reconcile(self, profile)

	return self
end

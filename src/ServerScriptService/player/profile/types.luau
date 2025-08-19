local _template = require("@server/player/profile/template")
local profile_store = require("@serverpkg/profile_store")

export type Template = typeof(_template)
export type Profile = profile_store.Profile<Template>
export type Store = profile_store.ProfileStore<Template>

return nil

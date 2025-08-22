local Players = game:GetService("Players")

local DEVELOPERS_ID = require("@shared/constants/developers")
local conch = require("@pkg/conch")
local conch_ui = require("@pkg/conch-ui")

local localplayer = Players.LocalPlayer

conch.initiate_default_lifecycle()
if not DEVELOPERS_ID[localplayer.UserId] then return end

conch_ui.bind_to(Enum.KeyCode.F4)

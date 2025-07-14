local ReplicatedStorage = game:GetService("ReplicatedStorage")
local hello = require(ReplicatedStorage.hello)

print(hello:format("Server"))

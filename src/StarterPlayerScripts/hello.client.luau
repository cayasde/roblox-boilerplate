local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Net = require(ReplicatedStorage.Net.Client)
local Hello = require(ReplicatedStorage.Hello)

print(Hello:format("Client"))

Net.hello.Server.On(function(message: Net.hello_message)
	print(`[Server → Client] Received: "{message}"`)
end)

Net.hello.Client.Fire("Hello from client!")

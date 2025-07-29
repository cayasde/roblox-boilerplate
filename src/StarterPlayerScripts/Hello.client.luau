local Hello = require("@Shared/Hello")
local Net = require("@Net/Client")

print(Hello:format("Client"))

Net.hello.Server.On(function(message: Net.hello_message)
	print(`[Server → Client] Received: "{message}"`)
end)

Net.hello.Client.Fire("Hello from client!")

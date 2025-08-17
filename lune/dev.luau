local fs = require("@lune/fs")
local process = require("@lune/process")
local task = require("@lune/task")

if fs.isDir("out/") then fs.removeDir("out/") end
if fs.isFile("sourcemap.json") then fs.removeFile("sourcemap.json") end

task.spawn(function()
	process.spawn(
		"rojo",
		{ "sourcemap", "dev.project.json", "--watch", "-o", "sourcemap.json" },
		{ stdio = "forward" }
	)
end)

repeat
	task.wait()
until fs.isFile("sourcemap.json")

task.spawn(function()
	process.spawn(
		"darklua",
		{ "process", "-w", "src/", "out/" },
		{ stdio = "forward" }
	)
end)

task.spawn(function()
	process.spawn(
		"darklua",
		{ "process", "-w", "stories/", "out/ReplicatedStorage/Stories" },
		{ stdio = "forward" }
	)
end)

task.spawn(function()
	process.spawn(
		"rojo",
		{ "serve", "dev.darklua.project.json" },
		{ stdio = "forward" }
	)
end)

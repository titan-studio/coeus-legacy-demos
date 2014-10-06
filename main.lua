--[[
Demo Launcher
Launches demos

Check demos/messy.lua for a (messy) sample app. It relies on the assets folder listed in the GitHub releases for this repository.
]]

local ffi = require("ffi")
local lfs = require("lfs")
local config = require("config-debug")
local Coeus = require("Coeus")
Coeus:Initialize(config)

print("Demos detected:")

local idemo_list = {}
for file in lfs.dir("demos") do
	if (file ~= "." and file ~= "..") then
		local name = file:match("^(.+)%.?.*$")
		idemo_list[name] = lfs.attributes("demos/" .. file, "mode")
		print(name)
	end
end

while (true) do
	io.write("\nInput a demo name: ")
	local input = io.read()

	if (idemo_list[input] == "file") then
		local file = loadfile("demos/" .. input .. ".lua")
		file(Coeus)
		break
	elseif (idemo_list[input] == "directory") then
		local file, err = loadfile("demos/" .. input .. "/main.lua")
		package.path = "demos/" .. input .. "/?.lua;" .. package.path
		file(Coeus)
		break
	elseif (input == "quit") then
		os.exit()
	end
end
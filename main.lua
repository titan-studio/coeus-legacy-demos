--[[
Demo Launcher
This will launch demos in the future.

For now, check messy.lua for a (messy) sample app. It relies on the assets folder listed in the GitHub releases for this repository.
]]

local ffi = require("ffi")
local config = require("config-debug")
local Coeus = require("Coeus")
Coeus:Initialize(config)

--todo: demo launcher
local Coeus = (...)

local Random = Coeus.Math.Random

local rand = Random:New()
local nums = {}
local total = 0
local n = 10000000
local timer = Coeus.Utility.Timer:New()
local start = timer:GetTime()
for i = 1, n do
	nums[i] = rand:Get()
	total = total + nums[i]
	--print("Random number " .. i .. ": " .. nums[i])
end
print("Average: " .. (total / n))
local stop = timer:GetTime()

print("Time taken to generate " .. n .. " random numbers: " .. (stop - start) .. "s")

local Coeus = (...)

local Actor = Coeus.Actor.Actor

local test = Actor:New()
test.Name = "A test actor"
test.ChildAdded:Listen(function(child)
	print("Child added: " .. child.Name)
end)

local test2 = Actor:New()
test2.Name = "Another test actor"
test2:SetParent(test)

Coeus:FlushLogBuffer()
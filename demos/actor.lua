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


print(test2.Parent.Name)
Coeus:Log(Coeus.LogLevel.Error, "Test error message!", "actor.lua")
Coeus:Log(Coeus.LogLevel.Info, "Test info message anywhere")
Coeus:Error("We need to test that log file flushing!")
Coeus:Error("Let's make a really big buffer.")
Coeus:Warning("It needs to be at least 512 characters to flush!")
Coeus:Warning("Yep... we're getting there...")
Coeus:Info("Verbose info! Verbose info everywhere!")
Coeus:Info("Hey maybe the asset loaders should post verbose info.")
Coeus:Info("Does this append? It should append...")

Coeus:FlushLogBuffer()
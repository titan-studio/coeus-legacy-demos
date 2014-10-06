local Coeus = (...)

--First step is to create a window to run the Coeus application in.
local window = Coeus.Graphics.Window:New("Coeus Test", 1280, 720, {
	fullscreen 	= false, 
	resizable 	= true,
	vsync		= true
})

--Now we'll make an Application
local TestApp = Coeus.Application:New(window)

--Application comes with some functions we need to replace
function TestApp:Initialize()
	--This is where you'll set everything up.

	--For example, this is probably where you would initialize your basic scene
	local scene = Coeus.Graphics.Scene:New(window.Graphics)
	window.Graphics.ActiveScene = scene

	--And then make your camera, objects, etc.
end

function TestApp:Update(dt)
	--This is called every frame and should be used to process physics, input, etc.
end

function TestApp:Render()
	--This is called every time the screen is updated (ideally 60 times per second!)
	
end

--And this call will set it all off.
TestApp:Main()
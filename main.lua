-- You've gotta copy this script entirely.

if game:GetService('RunService'):IsClient() then
if workspace:FindFirstChild("AnnouncerEndpoint") then
local EndpointTarget = workspace:FindFirstChild("AnnouncerEndpoint")

local ClrA = Color3.new(1,0,0)
local ClrB = Color3.new(0.5,0,0)
local ClrC = Color3.new(0,0,0)

local ScrnGui = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
local MnPrt = Instance.new("Frame",ScrnGui)
local InPrt = Instance.new("Frame",MnPrt)
local InputBox = Instance.new("TextBox",InPrt)
local SendBtn = Instance.new("TextButton",InPrt)
local Labely = Instance.new("TextLabel",MnPrt)
local DurInput = Instance.new("TextBox",InPrt)

ScrnGui.Name = "AnnouncerGUI"
ScrnGui.ResetOnSpawn = false

MnPrt.Name = "Main"
MnPrt.Active = true
MnPrt.Draggable = true
MnPrt.Size = UDim2.new(0,350,0,85)
MnPrt.Position = UDim2.new(.5,-125,.5,-42.5)
MnPrt.BackgroundColor3 = ClrC
MnPrt.BorderColor3 = ClrA

InPrt.Name = "Inside"
InPrt.Size = UDim2.new(0,350,0,60)
InPrt.Position = UDim2.new(0,0,0,25)
InPrt.BackgroundColor3 = ClrC
InPrt.BorderColor3 = ClrA

InputBox.Name = "InputBox"
InputBox.ClearTextOnFocus = false
InputBox.MultiLine = true
InputBox.TextScaled = true
InputBox.TextXAlignment = Enum.TextXAlignment.Left
InputBox.PlaceholderText = "Message..."
InputBox.Text = "Hello World!"
InputBox.BackgroundColor3 = ClrC
InputBox.BorderColor3 = ClrA
InputBox.TextColor3 = ClrA
InputBox.PlaceholderColor3 = ClrB
InputBox.Size = UDim2.new(0,155,0,20)
InputBox.Position = UDim2.new(0,10,0,5)

SendBtn.Name = "SendButton"
SendBtn.Size = UDim2.new(0,155,0,50)
SendBtn.Position = UDim2.new(0,175,0,5)
SendBtn.Text = "Send!"
SendBtn.TextScaled = true
SendBtn.TextColor3 = ClrA
SendBtn.BorderColor3 = ClrA
SendBtn.BackgroundColor3 = ClrC

Labely.Name = "Title"
Labely.BorderSizePixel = 0
Labely.Position = UDim2.new(0,175,0,12.5)
Labely.Text = "Announcer GUI"
Labely.TextColor3 = ClrA

DurInput.Name = "InputBox"
DurInput.ClearTextOnFocus = false
DurInput.MultiLine = true
DurInput.TextScaled = true
DurInput.TextXAlignment = Enum.TextXAlignment.Left
DurInput.PlaceholderText = "Duration.."
DurInput.Text = "5"
DurInput.BackgroundColor3 = ClrC
DurInput.BorderColor3 = ClrA
DurInput.TextColor3 = ClrA
DurInput.PlaceholderColor3 = ClrB
DurInput.Size = UDim2.new(0,155,0,20)
DurInput.Position = UDim2.new(0,10,0,30)

SendBtn.MouseButton1Click:Connect(function()
EndpointTarget:FireServer(InputBox.Text, tonumber(DurInput.Text))
end)
else
local msg = Instance.new("Message",workspace)
msg.Text = "[AnnouncerGUI]\nEndpoint not found! Please execute this script on serverside then execute it on clientside!\n(https://github.com/IvanTheProtogen/AnnouncerGUI/main/main.lua)"
wait(5)
msg:Destroy()
end
else
if workspace:FindFirstChild("AnnouncerEndpoint") then
local msg = Instance.new("Message",workspace)
msg.Text = "[AnnouncerGUI]\nEndpoint already exists! Execute the script on clientside now!\n(https://github.com/IvanTheProtogen/AnnouncerGUI/main/main.lua)"
wait(5)
msg:Destroy()
else
local Endpointy = Instance.new("RemoteEvent",workspace)
Endpointy.Name = "AnnouncerEndpoint"
Endpointy.OnServerEvent:Connect(function(senderplr,msgtxt,durnum)
local msg = Instance.new("Message",workspace)
msg.Text = "["..senderplr.Name.."]\n"..msgtxt.."\n(https://github.com/IvanTheProtogen/AnnouncerGUI/main/main.lua)"
wait(durnum)
msg:Destroy()
end)
local msg = Instance.new("Message",workspace)
msg.Text = "[AnnouncerGUI]\nAnnouncerGUI Endpoint has been made! Execute the script on clientside!\n(https://github.com/IvanTheProtogen/AnnouncerGUI/main/main.lua)"
wait(5)
msg:Destroy()
end
end
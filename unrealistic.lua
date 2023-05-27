if not game:IsLoaded() then game.Loaded:Wait() end


local Players = game:GetService("Players")
local virtualUser = game:GetService("VirtualUser")
local networkClient = game:GetService("NetworkClient")

real = 2

LocalPlayer = Players.LocalPlayer
Character = LocalPlayer.Character

-- Functions
local function newCharacter(Character)
    local rootPart = Character:WaitForChild("HumanoidRootPart")
    
    -- Clear PlayerGuis
    for i, object in pairs(LocalPlayer.PlayerGui:GetChildren()) do
        object:Destroy()
    end
end
 
-- Use less of internet resources
--networkClient:SetOutgoingKBPSLimit(1)
 
repeat wait() until LocalPlayer.Character ~= nil and game:IsLoaded()
wait(5) -- Waiting 5 more seconds because some anti-exploit scripts love to check everything about the client when it joins
 
-- Clear workspace
for i, object in pairs(workspace:GetChildren()) do
    if object.Name ~= "Terrain" then
        if not object:IsA("Camera") and not Players:GetPlayerFromCharacter(object) and object.Name ~= "Terrain" then
            object:Destroy()
        end
    end
end
workspace.Terrain:Clear()

-- Clear Lighting
for i, object in pairs(game.Lighting:GetChildren()) do
    object:Destroy()
end

newCharacter(LocalPlayer.Character)
LocalPlayer.CharacterAdded:Connect(newCharacter)



getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)

local botchats = {
  "join /krone | boost 4 whitelists lol we back",
  "/krone for life realism hahaaa",
  "hiii join /krone"
}
wait(1) if not game:IsLoaded() then game.Loaded:Wait() end

local rservice = game:GetService("RunService")

function Message(MTitle,MText,Time)
game:GetService("StarterGui"):SetCore("SendNotification",{Title = MTitle,Text = MText,Icon = "rbxassetid://2541869220",Duration = Time})
end

coroutine.resume(coroutine.create(function() while wait(1) do pcall(function() for _,z in next, Players:GetPlayers() do if z ~= LocalPlayer then for _,v in next, z.Backpack:GetDescendants() do if v:IsA'Sound' then v.TimePosition = nil end end end end end) end end)) 
coroutine.resume(coroutine.create(function() while wait(1) do pcall(function() for _,z in next, Players:GetPlayers() do if z ~= LocalPlayer then if z.Character and z.Character:FindFirstChildOfClass("Tool") then for _,v in next, z.Character:GetDescendants() do if v:IsA'Sound' then v.TimePosition = nil end end end end end end) end end))

if real == 2 then
Resize = function()
LocalPlayer.Character.LeftUpperLeg.LeftKneeRigAttachment.OriginaLocalPlayerosition:Destroy()
LocalPlayer.Character.LeftLowerLeg.LeftKneeRigAttachment.OriginaLocalPlayerosition:Destroy()
LocalPlayer.Character.LeftUpperLeg.LeftKneeRigAttachment:Destroy()
LocalPlayer.Character.LeftLowerLeg.LeftKneeRigAttachment:Destroy()
for _, z in pairs(LocalPlayer.Character.Humanoid:GetDescendants()) do
if z:IsA "NumberValue" then
LocalPlayer.Character.LeftFoot.OriginalSize:Destroy()
LocalPlayer.Character.LeftLowerLeg.OriginalSize:Destroy()
LocalPlayer.Character.LeftUpperLeg.OriginalSize:Destroy()
z:Destroy()
Instance.new("Vector3Value", LocalPlayer.Character.LeftFoot)
Instance.new('Vector3Value', LocalPlayer.Character.LeftLowerLeg)
Instance.new("Vector3Value", LocalPlayer.Character.LeftUpperLeg)
task.wait(.25)
if _ == 3 then
break
end
end
end
end

LocalPlayer.CharacterAdded:Connect(
function()
LocalPlayer.Character:WaitForChild("Humanoid")
task.wait(.25)
pcall(Resize)
end
)
pcall(Resize)
end

coroutine.wrap(function()
while wait() do
pcall(function()
if LocalPlayer.Character then
spawn(function()
pcall(function()
LocalPlayer.Character:FindFirstChild("RightHand"):Destroy()
end)
pcall(function()
LocalPlayer.Character:FindFirstChild("RightArm"):Destroy()
end)
end)
if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
spawn(function()
LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)
spawn(function()
LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
end)
end
end
end)
end
end)()

local numb = 0


local function ServerHop()

local AvailableServers = HTTPService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"))

while wait() do
local RandomServer = AvailableServers.data[math.random(#AvailableServers.data)]
if RandomServer.playing < RandomServer.maxPlayers - 1 and RandomServer.playing > 10 and RandomServer.id ~= game.JobId then
TPService:TeleportToPlaceInstance(game.PlaceId, RandomServer.id)
end
end
end

local function hop()
ServerHop()
while task.wait(.1) do
pcall(ServerHop)
end
end


local function SkidFling(TargetPlayer)
    local Character = LocalPlayer.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid.RootPart
    
    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
    
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
    
    if Character and Humanoid and RootPart then
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        local function FPos(BasePart,Pos,Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            RootPart.Velocity = Vector3.new(9e9,9e9,9e9)
            RootPart.RotVelocity = Vector3.new(9e9,9e9,9e9)
        end
        local function SFBasePart(BasePart)
            local TimeToWait = 0.5
            local Time = tick()
            local Angle = 0
            
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 30 then
                        Angle = Angle + 10
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 5,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                    else
                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-30),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 1000 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e9,9e9,9e9)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
        end
        BV:Destroy()
        for _,x in next, Character:GetDescendants() do
            if x:IsA("BasePart") then
                x.Velocity,x.RotVelocity = Vector3.new(),Vector3.new()
            end
        end
        Humanoid:ChangeState("GettingUp")
        workspace.CurrentCamera.CameraSubject = Humanoid
    end
end

rservice.Stepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        if LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
        for _,z in next, LocalPlayer.Character:GetChildren() do if z:IsA'BasePart' then z.CanCollide = false end end
    end
end)
coroutine.resume(coroutine.create(function()
    while wait() do
        pcall(function()
            for _,z in pairs(Players:GetPlayers()) do
                if z ~= LocalPlayer then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and z and z.Character and z.Character:FindFirstChildOfClass("Humanoid").Sit == false and #game.Players:GetPlayers() < 10 then
                        SkidFling(z)
                        numb = numb + 1
                        wait(1)
                    end
                end
            end
        end)
    end
end))
coroutine.resume(coroutine.create(function()
    while wait() do
        for _,z in next, Players:GetPlayers() do
            if z~=LocalPlayer then
                for i=1,30 do
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(botchats[math.random(1, #botchats)], "All")
                wait(1.265)
            end
        end
        end
end
end))

--[ Player Checking ]--



if numb == 700 then hop() end

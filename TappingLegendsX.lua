 local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({
        Name = " Super Hub | Tapping Legends X",
        HidePremium = false,
        IntroEnabled = true,
        IntroText = " Super Hub - Tapping Legends X",
        SaveConfig = true,
        ConfigFolder = "SuperHubConfig",
    })
    
    -- Values
    _G.autoTap = true
    _G.autoRebirth = true
    _G.selectRebirth = 1
    _G.autoHatch = true
    _G.selectEgg = "Basic Egg"
    _G.autoEquip = true
    _G.autoUpgrade = true
    _G.selectUpgrade = "Tap Multiplier"
    -- Functions
    
    function autoTap()
        while _G.autoTap == true do
            game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
            wait(.0001)
         end
        end
    
    function autoRebirth()
        while _G.autoRebirth == true do
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(_G.selectRebirth)
            wait(.0001)
        end
       end
    
    function autoHatch()
        while _G.autoHatch == true do
            game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(_G.selectEgg,1)
            wait(.0001)
        end
       end
    
    function equipBest()
        game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
        game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
    end
    
    function autoEquipBest()
        while _G.autoEquipBest == true do
        game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
        game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
        wait(30)
    end
    end

    function autoUpgrade()
        while _G.autoUpgrade == true do
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer()
        wait(.001)
     end
    end


    -- Tabs
    
    local FarmTab = Window:MakeTab({
        Name = "Autofarm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local EggsTab = Window:MakeTab({
        Name = "Eggs",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local MiscTab = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Toggles
    FarmTab:AddToggle({
        Name = "Auto Tap",
        Default = false,
        Callback = function(Value)
            _G.autoTap = Value
            autoTap()
        end
    })
    
    FarmTab:AddToggle({
        Name = "Auto Rebirth",
        Default = false,
        Callback = function(Value)
            _G.autoRebirth = Value
            autoRebirth()
        end
    })

    FarmTab:AddToggle({
        Name = "AutoUpgrade",
        Default = false,
        Callback = function(Value)
            _G.autoUpgrade = Value
            autoUpgrade()
        end    
    })

    MiscTab:AddButton({
        Name = "Inf Yeild",
        Callback = function()
                  print("Nice Hacks")
                  loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
          end    
    })

    MiscTab:AddButton({
        Name = "Fates Admin",
        Callback = function()
                  print("Nice Hacks")
                  loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
          end    
    })
    
    EggsTab:AddLabel("You need to be near the egg in order for AutoHatch to work.")
    
    EggsTab:AddToggle({
        Name = "Auto Hatch",
        Default = false,
        Callback = function(Value)
            _G.autoHatch = Value
            autoHatch()
        end
    })
    
    MiscTab:AddToggle({
        Name = "Auto Equip Best Pets",
        Default = false,
        Callback = function(Value)
            _G.autoEquipBest = Value
            autoEquipBest()
        end
    })
    
    MiscTab:AddButton({
        Name = "Equip Best Pets",
        Callback = function()
              equipBest()
          end    
    })
    
    --Dropdown
    EggsTab:AddDropdown({
        Name = "Select Egg",
        Default = "Basic Egg",
        Options = {"Basic Egg", "Rare Egg", "Forest Egg", "Desert Egg", "Winter Egg", "Lava Egg", "Aqua Egg", "Sakura Egg", "Mine Egg"},
        Callback = function(Value)
            _G.selectEgg = Value
            print(_G.selectEgg)
        end    
    })

    FarmTab:AddDropdown({
        Name = "Select Rebirth",
        Default = 1,
        Options = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28},
        Callback = function(Value)
            _G.selectRebirth = Value
            print(_G.selectRebirth)
        end    
    })

    FarmTab:AddDropdown({
        Name = "AutoUpgrade",
        Default = "Tap Multiplier",
        Options = {"Tap Multiplier", "More Rebirths", "Pet Storage", "Faster Walk", "Critical Chances", "Auto Clicker Multiplier", "Max Tap Combo"},
        Callback = function(Value)
            _G.selectUpgrade = Value
            print(_G.selectUpgrade)
        end    
    })

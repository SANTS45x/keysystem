local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/Simple-KeySystem-Roblox/refs/heads/main/Library.lua"))()

local KeyWindow = Library:CreateWindow("Key System", UDim2.fromOffset(300, 180))

local KeyBox = KeyWindow:AddTextBox("Enter Key...", UDim2.new(0.1, 0, 0.15, 0))

local KeyPath = "DisabledHubConfigs/Key"
local FileName = "SavedKey.lua"

local SavedKey = Library:LoadKey(KeyPath, FileName)
if SavedKey then
    KeyBox.Text = SavedKey
end

local SubmitButton = KeyWindow:AddButton("Submit", UDim2.new(0.1, 0, 0.65, 0), function()
    if KeyBox.Text == "FISCH-H0ZGKKA-EODPWY-X734HI" then
        KeyWindow:Close()

        -- Executar script após validação da key
        getgenv().PingSpoofer = {
            SpoofPing = true,
            StartOfPingSpoofer = 31,
            EndOfPingSpoofer = 69
        }
        
        local Memory
        
        for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
            if v.Name == 'PS_Button' and v.StatsMiniTextPanelClass.TitleLabel.Text == 'Ping' then 
                Memory = v.StatsMiniTextPanelClass.ValueLabel
                break
            end
        end
        
        if Memory then
            Memory:GetPropertyChangedSignal('Text'):Connect(function()
                if getgenv().PingSpoofer.SpoofPing then
                    local Random = math.random(getgenv().PingSpoofer.StartOfPingSpoofer, getgenv().PingSpoofer.EndOfPingSpoofer)
                    Random = Random * 1.23
                    Memory.Text = Random .. ' ms'
                end
            end)
        else
            warn("Ping display not found! Make sure Performance Stats are enabled.")
        end
    else
        local player = cloneref(game:GetService("Players")).LocalPlayer
        player:Kick("Invalid Key")
        if player then
            player:Destroy()
        end
    end
end)

local GetKeyButton = KeyWindow:AddButton("DISCORD", UDim2.new(0.55, 0, 0.65, 0), function()
    if setclipboard then
        setclipboard("https://discord.gg/zmcVC3EENd")
    else
        warn("setclipboard is not available.")
    end
end)

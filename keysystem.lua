local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/Simple-KeySystem-Roblox/refs/heads/main/Library.lua"))()

local KeyWindow = Library:CreateWindow("Key System", UDim2.fromOffset(300, 180))
local KeyBox = KeyWindow:AddTextBox("Enter Key...", UDim2.new(0.1, 0, 0.15, 0))

local ValidKeys = {
    "FISCH-H0ZGKKA-EODPWY-X734HI",
    "FISCH-A1B2C3D4-E5F6G7-H8I9J0",
    "FISCH-QWERTY-UIOPAS-DFGHJK",
    "FISCH-ZXCVBN-MQWERT-YUIOPLK",
    "FISCH-123456-789ABC-DEF012",
    "FISCH-AAA111-BBB222-CCC333",
    "FISCH-XYZ987-UVW654-RST321",
    "FISCH-MNBVCX-LKJHGF-POIUYT",
    "FISCH-555AAA-666BBB-777CCC",
    "FISCH-ABCD12-EFGH34-IJKL56"
}

local SubmitButton = KeyWindow:AddButton("Submit", UDim2.new(0.1, 0, 0.65, 0), function()
    for _, key in pairs(ValidKeys) do
        if KeyBox.Text == key then
            KeyWindow:Close()

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
            return
        end
    end
    
    local player = cloneref(game:GetService("Players")).LocalPlayer
    player:Kick("Invalid Key")
    if player then
        player:Destroy()
    end
end)

local GetKeyButton = KeyWindow:AddButton("DISCORD", UDim2.new(0.55, 0, 0.65, 0), function()
    if setclipboard then
        setclipboard("https://discord.gg/zmcVC3EENd")
    else
        warn("setclipboard is not available.")
    end
end)

local CloseButton = KeyWindow:AddButton("X", UDim2.new(0.9, -20, 0, 5), function()
    KeyWindow:Close()
end)

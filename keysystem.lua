local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/Simple-KeySystem-Roblox/refs/heads/main/Library.lua"))()

local KeyWindow = Library:CreateWindow("Key System", UDim2.fromOffset(300, 180))

local KeyBox = KeyWindow:AddTextBox("Enter Key...", UDim2.new(0.1, 0, 0.15, 0))

local SubmitButton = KeyWindow:AddButton("Submit", UDim2.new(0.1, 0, 0.65, 0), function()
    if KeyBox.Text == "sdasdasdad" then
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

local GetKeyButton = KeyWindow:AddButton("Get Key", UDim2.new(0.55, 0, 0.65, 0), function()
    if setclipboard then
        setclipboard("https://discord.gg/zmcVC3EENd")
    else
        warn("setclipboard is not available.")
    end
end)

local GifLabel = Library:Create('ImageLabel', {
    Position = UDim2.new(0.7, 0, 0.1, 0),
    Size = UDim2.new(0.25, 0, 0.75, 0),
    Image = "https://cdn.discordapp.com/attachments/1320134845262856303/1331617744210235403/a_0dc428ee4c06be47df17f81dd1f54596.gif?ex=67b291ea&is=67b1406a&hm=2240eab3fc0a2a074f25b29eb4d9c40b39ba5c64a9833483e713be8c5b9e0c21&",
    BackgroundTransparency = 1,
    Parent = KeyWindow.Outer.Frame.Frame
})

--[[ 
    Shakshoka Hub for Grow A Garden 🌱
    Built using Rayfield UI Library
    Version: Auto Buy Candy Blossom + Non-Saving Key System
]]--

-- تحميل مكتبة Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- نسخ رابط المفتاح إلى الحافظة
setclipboard("https://direct-link.net/1352313/shkey1") -- يمكنك تغيير الرابط حسب موقع مفتاحك

-- إشعار نسخ الرابط
Rayfield:Notify({
    Title = "Shakshoka Hub",
    Content = "Copied key link to clipboard!",
    Duration = 6,
    Actions = {
        Ignore = {
            Name = "OK",
            Callback = function() end
        }
    }
})

-- إشعار حقوق
Rayfield:Notify({
    Title = "Shakshoka Hub",
    Content = "Made by ecstacyV2",
    Duration = 5
})

-- إنشاء نافذة السكربت
local Window = Rayfield:CreateWindow({
    Name = "Shakshoka Hub | Grow A Garden",
    LoadingTitle = "Shakshoka Hub",
    LoadingSubtitle = "by ecstacyV2",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "ShakshokaHubCFG"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = false
    },
    KeySystem = true,
    KeySettings = {
        Title = "Shakshoka Hub | Key System",
        Subtitle = "Get your key from our link",
        Note = "Copied key link to clipboard",
        FileName = "ShakshokaKey",
        SaveKey = false, -- <== المفتاح لا يُحفظ
        GrabKeyFromSite = false,
        Key = {"shakshokasotuff"} -- <== المفتاح هنا
    }
})

-- تبويب الأوامر الرئيسية
local MainTab = Window:CreateTab("Main", 4483362458) -- أيقونة تبويب (ID من Roblox)
MainTab:CreateSection("Candy Blossom Automation")

-- زر التبديل لتفعيل الشراء التلقائي
MainTab:CreateToggle({
    Name = "Auto Buy Candy Blossom",
    CurrentValue = false,
    Callback = function(state)
        getgenv().AutoBuyCandy = state
        task.spawn(function()
            while getgenv().AutoBuyCandy do
                pcall(function()
                    task.wait(2)
                    for _, item in pairs(workspace:FindFirstChild("GearShop"):GetChildren()) do
                        if item.Name == "Candy Blossom" then
                            fireclickdetector(item:FindFirstChildOfClass("ClickDetector"))
                        end
                    end
                end)
            end
        end)
    end
})

-- ملاحظة
MainTab:CreateParagraph({
    Title = "Note:",
    Content = "Requires Bloodmoon and Candy Blossom to be in stock\nRequires server version V1226 or below\n(YOU CAN GO AFK AND KEEP IT ON)"
})

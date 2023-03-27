local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local loadedkey = loadstring(game:HttpGet("https://raw.githubusercontent.com/NtdHuB/script/main/key"))()

print(loadkey)

getgenv().inputkey = ""


local function LoadMain()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LioK251/RbScripts/main/fruit_suckers.lua"))()
end

function readkey()
    if readfile("/ntdzhubkey/key.txt") == loadedkey then
        Rayfield:Notify({
            Title = "Thông Báo",
            Content = "Đã Tìm Thấy Key Trong Lưu Trữ",
            Duration = 3.5,
            Image = 4483362458,
        })
            LoadMain()
        else
            Rayfield:Notify({
                Title = "Thông Báo",
                Content = "Không thể tìm thấy key trong lưu trữ & chờ update...",
                Duration = 3.5,
                Image = 4483362458,
                })

            local keyWindow = Rayfield:CreateWindow({
                Name = "NtdZ Hub",
                LoadingTitle = "Key System",
                LoadingSubtitle = "by Ng Thanh Dat",
                ConfigurationSaving = {
                Enabled = true,
                FolderName = nil, 
                FileName = "NTDZHUB"
                },
                Discord = {
                Enabled = false,
                Invite = "ABCD", 
                RememberJoins = true 
                },
                KeySystem = false, 
                KeySettings = {
                Title = "Sirius Hub",
                Subtitle = "Key System",
                Note = "Join the discord (discord.gg/sirius)",
                FileName = "SiriusKey",
                SaveKey = true,
                GrabKeyFromSite = false, 
                Key = "Hello"
                }
            })
        local Tab = keyWindow:CreateTab("Key", 4483362458)
        local Input = Tab:CreateInput({
            Name = "Key:",
            PlaceholderText = "Enter Key",
            RemoveTextAfterForcusLost = false,
            Callback = function (Text)
                getgenv().inputkey = Text
            end,
        })

        local Button = Tab:CreateButton({
            Name = "Submit Key",
            Callback = function()
                if getgenv().inputkey == loadedkey then
                    writefile("/ntdzhubkey/key.txt", loadedkey)
                    Rayfield:Notify({
                        Title = "Thông Báo",
                        Content = "Key Đúng Vui Lòng Chờ Script Load....",
                        Duration = 3.5,
                        Image = 4483362458,
                    })
                    task.wait(3)
                    Rayfield:Destroy()
                    LoadMain()
                else
                    Rayfield:Notify({
                    Title = "Thông Báo",
                    Content = "Vui lòng kiểm tra lại Key!",
                    Duration = 3.5,
                    Image = 4483362458,
                    })
            end
            end,
        })
    end
end

if isfolder("/ntdzhubkey") then
    if isfile("/ntdzhubkey/key.txt", "") then
        readkey()
    else
        writefile("/ntdzhubkey/key.txt", "")
        readkey()
    end
else
    makefolder("ntdzhubkey")
    writefile("/ntdzhubkey/key.txt", "")
    readkey()
end       

warn("NIKITOS // Привет!") -- Выводит приветственное сообщение в консоль
gamename = "Grace - В игре"

-- Загружаем необходимые библиотеки
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))() -- Библиотека Fluent для создания интерфейса
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Main/Modules/SaveManager_RU.lua"))() -- Модуль для сохранений
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Main/Modules/InterfaceManager_RU.lua"))() -- Модуль для управления интерфейсом

-- Информация о текущем игроке
local Player = game.Players.LocalPlayer -- Игрок
local PlayerName = Player.Name -- Имя игрока
local PlayerChar = Player.Character -- Персонаж игрока
local PlayerHuma = PlayerChar.Humanoid -- Humanoid (человекоподобная часть персонажа)

-- Создание окна интерфейса с использованием Fluent
local Window = Library:CreateWindow{ 
    Title = "NIKITOS // " .. gamename, -- Заголовок окна
    SubTitle = "Придумай сам что тут написано...", -- Подзаголовок окна
    TabWidth = 160, -- Ширина вкладки
    Size = UDim2.fromOffset(830, 525), -- Размер окна
    Resize = true, -- Возможность изменения размера окна
    MinSize = Vector2.new(470, 380), -- Минимальный размер окна
    Acrylic = true, -- Включение эффекта блюра
    Theme = "Dark", -- Тема интерфейса
    MinimizeKey = Enum.KeyCode.RightControl -- Клавиша для минимизации
}

-- Определяем табы для интерфейса
local Tabs = { 
    Main = Window:CreateTab{ 
        Title = "Общее", -- Заголовок вкладки
        Icon = "phosphor-users-bold" -- Иконка вкладки
    },
    Settings = Window:CreateTab{
        Title = "Настройки",
        Icon = "settings"
    },
    Loader = Window:CreateTab{
        Title = "Загрузчики",
        Icon = "github"
    },
}

-- Настройка уведомлений
Library:Notify{ 
    Title = "Notification", -- Заголовок уведомления
    Content = "This is a notification", -- Контент уведомления
    SubContent = "SubContent", -- Дополнительный контент уведомления
    Duration = 5 -- Время отображения уведомления
}

-- Создание параграфов с информацией в вкладке Main
local MainParagraph = Tabs.Main:CreateParagraph("MainParagraph", {
    Title = "Здраствуй, " .. PlayerName, -- Заголовок параграфа
    Content = "Игра: " .. "dfsyqeweasdhuzshfyu" .. "\nИнфa:\nXП - " .. PlayerHuma.Health .. "/" .. PlayerHuma.MaxHealth .. " Скорость - " .. PlayerHuma.WalkSpeed .. " Сила прыжка - " .. PlayerHuma.JumpPower, -- Контент параграфа
})

-- Кнопка для загрузки Plutonium Hub с подтверждением
Tabs.Loader:CreateButton{ 
    Title = "Загрузить Plutonium Hub", 
    Description = "(Это не мое, так что баги - не моя вина)", 
    Callback = function() 
        Window:Dialog{ 
            Title = "Точно?", 
            Content = "Уверен?", 
            Buttons = { 
                { 
                    Title = "Confirm", 
                    Callback = function() 
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))() 
                        print("NIKITOSIK | Принятие загрузки Plutonium Hub") 
                    end
                },
                {
                    Title = "Cancel", 
                    Callback = function() 
                        print("NIKITOSIK | Отказ от загрузки Plutonium Hub") 
                    end
                }
            }
        }
    end
}

-- Аналогичная кнопка для загрузки BlackKing Hub
Tabs.Loader:CreateButton{ 
    Title = "Загрузить BlackKing Hub", 
    Description = "(Это не мое, так что баги - не моя вина)", 
    Callback = function() 
        Window:Dialog{ 
            Title = "Точно?", 
            Content = " ", 
            Buttons = { 
                { 
                    Title = "Confirm", 
                    Callback = function() 
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/KINGHUB01/BlackKing/main/BlackKing'))() 
                        print("NIKITOSIK | Принятие загрузки BlackKing Hub") 
                    end
                },
                {
                    Title = "Cancel", 
                    Callback = function() 
                        print("NIKITOSIK | Отказ от загрузки BlackKing Hub") 
                    end
                }
            }
        }
    end
}

-- Кнопка для выдачи предмета
Tabs.Main:Button({ 
    Title = "Выдать предмет на дрочку", 
    Description = "💕", 
    Callback = function() 
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))() -- Загрузка скрипта
    end
})



local FBToggle_T = Tabs.Main:CreateToggle("FBToggle_T", {Title = "Светлота", Default = false })

-- Старые значения для освещения
local OldBrightness = game.Lighting.Brightness
local OldClocktime = game.Lighting.ClockTime
local OldFogEnd = game.Lighting.FogEnd
local OldGlobalShadows = game.Lighting.GlobalShadows
local OldOutdoorAmbient = game.Lighting.OutdoorAmbient

-- Функция для изменения светлоты
local function FBToggle_F()
    if FBToggle_T.Value then
        -- на да
		local OldBrightness = game.Lighting.Brightness
		local OldClocktime = game.Lighting.ClockTime
		local OldFogEnd = game.Lighting.FogEnd
		local OldGlobalShadows = game.Lighting.GlobalShadows
		local OldOutdoorAmbient = game.Lighting.OutdoorAmbient

        game.Lighting.Brightness = 5
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 100000
        game.Lighting.GlobalShadows = false
        game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        -- на нет
        game.Lighting.Brightness = OldBrightness
        game.Lighting.ClockTime = OldClocktime
        game.Lighting.FogEnd = OldFogEnd
        game.Lighting.GlobalShadows = OldGlobalShadows
        game.Lighting.OutdoorAmbient = OldOutdoorAmbient
    end
end


FBToggle_T:OnChanged(function() --Активация при переключении
    FBToggle_F() --Функция которая включает/выключает светлоту
end)

-- Параграф с информацией о игре
local ParagraphGameF = Tabs.Main:CreateParagraph("ParagraphGameF", { 
    Title = "Для игры", 
    Content = "Это все только для этой игры", 
    TitleAlignment = "Middle", 
    ContentAlignment = Enum.TextXAlignment.Center 
})

plrgui = game.Players.LocalPlayer.PlayerGui

godbuttondid = false

function god()
	godbuttondid = true
end

Tabs.Main:Button({ 
    Title = "Убрать всех сущностей", 
    Description = "У других они будут", 
    Callback = function()
		RS = game.ReplicatedStorage
		RS.SendGoatman:Destroy()
		RS.SendRush:Destroy()
		RS.SendSorrow:Destroy()
		RS.SendWorm:Destroy()
		RS.OpenedFakeDoor:Destroy()
		RS.ParasiteEffect:Destroy()
		RS.Worm:Destroy()
		RS.elkman:Destroy()
        	for _, v in pairs(Game.Workspace.Rooms:GetChildren()) do
            	if v:FindFirstChildWhichIsA("Door") then
                v:FindFirstChildWhichIsA("Door"):Destroy()
				end
				if v:FindFirstChildWhichIsA("eye") then
                v:FindFirstChildWhichIsA("eye"):Destroy()
				end
            	if v:FindFirstChildWhichIsA("elkman") then
                v:FindFirstChildWhichIsA("elkman"):Destroy()
            	end
    		end
		--RS.:Destroy()
    end
})

Tabs.Main:Button({ 
    Title = "Бессмертие", 
    Description = "Я не подпишу договор о своей смерти.", 
    Callback = function()
		if godbuttondid == false then
			god()
			game.ReplicatedStorage.KillClient:Destroy()
			--while wait(0.1) do
				--plrgui:WaitForChild("GOATPORT")
			--end
		end
    end
})

Tabs.Main:Button({ 
    Title = "Убрать ненужный интерфейс", 
    Description = "Классно", 
    Callback = function() 
		plrgui.eyegui:Destroy()
    end
})

Tabs.Main:Button({ 
    Title = "Восстановить камеру", 
    Description = "Если забаголось", 
    Callback = function()
		if game.Workspace.Camera then 
			Cam = game.Workspace.Camera
			Cam:Destroy()
		end
		Cam = game.Workspace.Camera
		Cam.CameraSubject = plrgui.Parent.Character.Humanoid
    end
})

-- Другой параграф с информацией по типу тг и так далее.
local ParagraphDrygoe = Tabs.Main:CreateParagraph("ParagraphDrygoe", { 
    Title = "Другое", 
    Content = nil, 
    TitleAlignment = "Middle", 
    ContentAlignment = Enum.TextXAlignment.Center 
})

-- Кнопка для копирования Telegram
Tabs.Main:Button({ 
    Title = "Есть что сказать?", 
    Description = "Скопировать Telegram", 
    Callback = function() 
        if setclipboard then
            setclipboard("@Chelik_Chepubelik") --Тг
            NotifyCopy(true)
        else
            NotifyCopy(false)
        end 
    end
})

Tabs.Main:Button({ 
    Title = "Тг канал", 
    Description = "Скопировать Telegram ссылку", 
    Callback = function() 
        if setclipboard then
            setclipboard("https:\\t.me\NIKITOS_HUB") --Тг канал
            NotifyCopy(true)
        else
            NotifyCopy(false)
        end 
    end
})

-- Сохранение и настройка менеджеров интерфейса и сохранений
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes{}

-- Построение секций для настроек и конфигураций
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- Выбор первой вкладки
Window:SelectTab(1)

-- Уведомление о загрузке скрипта
Library:Notify{
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
}

-- Загрузка автозагружаемой конфигурации
SaveManager:LoadAutoloadConfig()

-- Бесконечный цикл обновления информации о общей информации
while wait(0.1) do
    PlayerChar = Player.Character
    PlayerHuma = PlayerChar.Humanoid

    MainParagraph:SetValue("Игра: " .. gamename .. "\nИнфa:\nXП - " .. PlayerHuma.Health .. "/" .. PlayerHuma.MaxHealth .. " Скорость - " .. PlayerHuma.WalkSpeed .. " Сила прыжка - " .. PlayerHuma.JumpPower) 
	        	for _, v in pairs(Game.Workspace.Rooms:GetChildren()) do
            	if v:IsA("Model") and v:FindFirstChildWhichIsA("Door") then
                v:FindFirstChildWhichIsA("Door"):Destroy()
				end
				end
end

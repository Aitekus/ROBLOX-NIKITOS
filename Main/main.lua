warn("NIKITOS // Привет!")
--Loadstring-и
local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))() --Библиотека Fluent
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Aitekus/main/refs/heads/main/ROBLOX-NIKITOS/SaveManager_RU.lua"))() --Модуль сохранений
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Aitekus/main/refs/heads/main/ROBLOX-NIKITOS/InterfaceManager_RU.lua"))() --Модуль интерфейса

--Игрок
local Player = game.Players.LocalPlayer --Игрок в game.Players
local PlayerName = Player.Name --Nickname игрока
local PlayerChar = Player.Character --Персонаж игрока
local PlayerHuma = PlayerChar.Humanoid --Humanoid игрока

--Игра + Айдишники
local PlaceId = game.PlaceId --PlaceId игры
local Games = { --Список игр и их ID (Скоро будет добавленно больше игр!)
    [16732694052] = "Fisch",
    [537413528] = "BABFT",
    [10449761463] = "TSB",
    [13772394625] = "Blade Ball",
    [6516141723] = "Doors - В лобби",
    [6839171747] = "Doors - В игре",
    [138837502355157] = "Grace - В лобби",
    [110333320616502] = "Grace - В игре"
	[116495829188952] = "Dead rails - В лобби"
	[] = "Dead rails - В игре"
	[] = ""
	[] = ""
	[] = ""
	[] = ""
	[] = ""
	[] = ""
	[] = ""
	[] = ""
	[] = ""
	[] = ""
}
local function NotFoundGame() --Функция которая выдает ID игры если она не поддержана
    CurGame = "Не поддержана"
    print(game.PlaceId)
end
local CurGame = Games[game.PlaceId] or NotFoundGame --Установка переменной на название игры // Запуск функции см. строку 26

--Fluent

local Window = Library:CreateWindow{ --Создание окна
    Title = "NIKITOS", --Заговолок окна
    SubTitle = "Придумай сам что тут написано...", --Подзаговолок окна
    TabWidth = 160, --Работает - не трогай
    Size = UDim2.fromOffset(830, 525), --Работает - не трогай
    Resize = true, -- Resize this ^ Size according to a 1920x1080 screen, good for mobile users but may look weird on some devices
    MinSize = Vector2.new(470, 380), --Минимальный размер
    Acrylic = true, --Блюр может быть замечен, поставив на false вы отключите блюр полностью
    Theme = "Dark", --Тема
    MinimizeKey = Enum.KeyCode.RightControl --Использована если нету Minimize bind (Кнопка для сворачивания)
}

--Fluent Renewed представляет возможным использовать ВСЕ 1544 Lucide 0.469.0 https://lucide.dev/icons/ иконки и ВСЕ 9072 Phosphor 2.1.0 https://phosphoricons.com/ иконки для табов. Иконки на выбор :D
local Tabs = { --Все табы
    Main = Window:CreateTab{ --Создание таба
        Title = "Общее", --Название таба
        Icon = "phosphor-users-bold" --Иконка таба
    },
    Settings = Window:CreateTab{ --Создание таба
        Title = "Настройки", --Название таба
        Icon = "settings" --Иконка таба
    }
}

local Options = Library.Options

Library:Notify{ --Оповестить
    Title = "Notification", --Название оповещения
    Content = "This is a notification", --Контент оповещения
    SubContent = "SubContent", --ПодКонтент оповещения
    Duration = 5 --Сколько секунд пробудет // Поставьте на nil чтоб не исчезало
}

local MainParagraph = Tabs.Main:CreateParagraph("MainParagraph", { --Параграф 1 // Общая инфа
    Title = "Здраствуй, " .. PlayerName, --Название параграфа
    Content = "Игра: " .. CurGame .. "\nИнфa:\nXП - " .. PlayerHuma.Health .. "/" .. PlayerHuma.MaxHealth .. " Скорость - " .. PlayerHuma.WalkSpeed .. " Сила прыжка - " .. PlayerHuma.JumpPower, --Контент параграфа
})



local Paragraph = Tabs.Main:CreateParagraph("Paragraph", { --Параграф 2 // "Общие функции"
    Title = "Общие функции", --Название параграфа
    Content = nil, --Контент параграфа
    TitleAlignment = "Middle", --Где будет название параграфа // Слева/Посередине/Справа
    ContentAlignment = Enum.TextXAlignment.Center --Где будет контент параграфа // Слева/Посередине/Справа
})

local FBToggle_T = Tabs.Main:CreateToggle("FBToggle_T", {Title = "Светлота", Default = false }) --Переключатель на светлоту

--Установка старых значений
local OldBrightness = game.Lighting.Brightness
local OldClocktime = game.Lighting.ClockTime
local OldFogEnd = game.Lighting.FogEnd
local OldGlobalShadows = game.Lighting.GlobalShadows
local OldOutdoorAmbient = game.Lighting.OutdoorAmbient

local function FBToggle_F() --Функция которая включает/выключает светлоту
    if Options.FBToggle_T.Value == true then --Если переключатель включен то...
        --Сохранение старых значений
        local OldBrightness = game.Lighting.Brightness
        local OldClocktime = game.Lighting.ClockTime
        local OldFogEnd = game.Lighting.FogEnd
        local OldGlobalShadows = game.Lighting.GlobalShadows
        local OldOutdoorAmbient = game.Lighting.OutdoorAmbient

        --Осветление
        game.Lighting.Brightness = 5
		game.Lighting.ClockTime = 14
		game.Lighting.FogEnd = 100000
		game.Lighting.GlobalShadows = false
		game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else --Если переключатель выключен то... // Сразу выполнается т.к. переключатель установлен на false 
        game.Lighting.Brightness = OldBrightness 
        game.Lighting.ClockTime = OldClocktime
        game.Lighting.FogEnd = OldFogEnd
        game.Lighting.GlobalShadows = OldGlobalShadows
        game.Lighting.OutdoorAmbient = OldOutdoorAmbient
    end
end

FBToggle_T:OnChanged(function() --Активация при переключении
    FBToggle_F() --Функция которая включает/выключает светлоту // см. строка 110
end)

local Slider = Tabs.Main:AddSlider("Slider", { --Создание слайдера
	Title = "Скорость", --Название слайдера
	Description = "He испоьзуйте в Doors и в других играх где может быть Анти-Чит", --Описание слайдера
	default = 16, --Начальное значение
	Min = 16, --Минимальное значение
	Max = 100, --Максимальное значение
	Rounding = 2, --Изменение значения
	Callback = function(Value) --Функция при изменении значения
		PlayerHuma.WalkSpeed = Value --Установка скорости Humanoid-у
	end
})
Tabs.Main:CreateButton{ --Создание кнопки с подтверждением // Кнопка на загрузку Plutonium Hub
    Title = "Загрузить Plutonium Hub", --Название кнопки
    Description = "(Это не мое, так что баги - не моя вина)", --Описание кнопки
    Callback = function() --Актвиация при нажатии
        Window:Dialog{ --Призыв окна диалога
            Title = "Точно?", --Заголовок окна диалога
            Content = "Уверен?", --Контент окна диалога
            Buttons = { --Кнопки окна диалога
                {
                    Title = "Confirm", --Название кнопки окна диалога
                    Callback = function() --Активация при нажатии
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))() --Загрузить Plutonium Hub
                        print("NIKITOSIK | Принятие загрузки Plutonium Hub") --Написать в консоль
                    end
                },
                {
                    Title = "Cancel", --Название кнопки окна диалога
                    Callback = function() --Активация при нажатии
                        print("NIKITOSIK | Отказ от загрузки Plutonium Hub") --Написать в консоль
                    end
                }
            }
        }
    end
}

Tabs.Main:CreateButton{ --Создание кнопки с подтверждением // Кнопка на загрузку BlackKing Hub
    Title = "Загрузить BlackKing Hub", --Название кнопки
    Description = "(Это не мое, так что баги - не моя вина)", --Описание кнопки
    Callback = function() --Актвиация при нажатии
        Window:Dialog{ --Призыв окна диалога
            Title = "Точно?", --Заголовок окна диалога
            Content = " ", --Контент окна диалога
            Buttons = { --Кнопки окна диалога
                {
                    Title = "Confirm", --Название кнопки окна диалога
                    Callback = function() --Активация при нажатии
                        loadstring(game:HttpGet('https://raw.githubusercontent.com/KINGHUB01/BlackKing/main/BlackKing'))() --Загрузить BlackKing Hub
                        print("NIKITOSIK | Принятие загрузки BlackKing Hub")
                    end
                },
                {
                    Title = "Cancel", --Название кнопки окна диалога
                    Callback = function() --Активация при нажатии
                        print("NIKITOSIK | Отказ от загрузки BlackKing Hub") --Написать в консоль
                    end
                }
            }
        }
    end
}

if CurGame == "Grace" then --Подтверждение того, что текущая игра Grace
Tabs.Main:CreateButton{ --Создание кнопки с подтверждением // Кнопка на бессмертие // Grace
    Title = "Бессмертие", --Название кнопки
    Description = "Только для Grace", --Описание кнопки
    Callback = function() --Актвиация при нажатии
        Window:Dialog{ --Призыв окна диалога
            Title = "Точно?", --Название кнопки
            Content = "Не попадайся на Slight, Heed и на другие сущности которые могут двигать камеру. Они сломают камеру и игра станет неиграбельной", --Контент окна диалога
            Buttons = { --Кнопки окна диалога
                {
                    Title = "Confirm", --Название кнопки окна диалога
                    Callback = function() --Активация при нажатии
                        local RS = game.ReplicatedStorage --Создание переменной для game.ReplicatedStorage
                        PLayerChar.die:Destroy() --Удаления скрипта на вызов RemoteFuntion для смерти
                        RS.KillClient:Destroy() --Удаление RemoteFuntion для смерти
                        RS.eyegui:Destroy()
                        RS.smilegui:Destroy()
                        RS.SendGoatman:Destroy() --Удаление Goatman
                    end
                },
                {
                    Title = "Cancel", --Название кнопки окна диалога
                    Callback = function() --Активация при нажатии
                        Print("NIKITOSIK | Отказ от Godmode | Grace") --Написать в консоль
                    end
                }
            }
        }
    end
}
end
--Осторожно! // Бескоментарная зона!
local Toggle = Tabs.Main:CreateToggle("MyToggle", {Title = "Toggle", Default = false })

Toggle:OnChanged(function()
    print("Toggle changed:", Options.MyToggle.Value)
end)

local Paragraph = Tabs.Main:CreateParagraph("Paragraph", {
    Title = "Paragraph",
    Content = "This is a paragraph.\nSecond line!"
})

print(Paragraph.Value)

Paragraph:SetValue("This paragraph text is changed!")

print(Paragraph.Value)

Tabs.Main:CreateParagraph("Aligned Paragraph", {
    Title = "Paragraph",
    Content = "This is a paragraph with a center alignment!",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Main:CreateButton{
    Title = "Button",
    Description = "Very important button",
    Callback = function()
        Window:Dialog{
            Title = "Title",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        print("Confirmed the dialog.")
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

local Toggle = Tabs.Main:CreateToggle("MyToggle", {Title = "Toggle", Default = false })

Toggle:OnChanged(function()
    print("Toggle changed:", Options.MyToggle.Value)
end)

Options.MyToggle:SetValue(false)

local Slider = Tabs.Main:CreateSlider("Slider", {
    Title = "Slider",
    Description = "This is a slider",
    Default = 2,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        print("Slider was changed:", Value)
    end
})

Slider:OnChanged(function(Value)
    print("Slider changed:", Value)
end)

Slider:SetValue(3)

local Dropdown = Tabs.Main:CreateDropdown("Dropdown", {
    Title = "Dropdown",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = false,
    Default = 1,
})

Dropdown:SetValue("four")

Dropdown:OnChanged(function(Value)
    print("Dropdown changed:", Value)
end)

local MultiDropdown = Tabs.Main:CreateDropdown("MultiDropdown", {
    Title = "Dropdown",
    Description = "You can select multiple values.",
    Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
    Multi = true,
    Default = {"seven", "twelve"},
})

MultiDropdown:SetValue{
    three = true,
    five = true,
    seven = false
}

MultiDropdown:SetValues{"fifteen", "sixteen", "seventeen"}

MultiDropdown:OnChanged(function(Value)
    local Values = {}
    for Value, State in next, Value do
        Values[#Values + 1] = Value
    end
    print("Mutlidropdown changed:", table.concat(Values, ", "))
end)

local MultiInstanceDropdown = Tabs.Main:CreateDropdown("MultiInstanceDropdown", {
    Title = "Instance Dropdown",
    Description = "You can select multiple values and any instance or any other value!",
    Values = {workspace, 5, Enum.JoinSource, Enum.MarketplaceBulkPurchasePromptStatus.Error},
    Multi = true,
    Default = {workspace},
})

MultiInstanceDropdown:OnChanged(function(Value)
    local Values = {}
    for Value, State in next, Value do
        Values[#Values + 1] = typeof(Value)
    end
    print("Mutlidropdown with instance selection changed:", table.concat(Values, ", "))
end)

local Colorpicker = Tabs.Main:CreateColorpicker("Colorpicker", {
    Title = "Colorpicker",
    Default = Color3.fromRGB(96, 205, 255)
})

Colorpicker:OnChanged(function()
    print("Colorpicker changed:", Colorpicker.Value)
end)

Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

local TColorpicker = Tabs.Main:CreateColorpicker("TransparencyColorpicker", {
    Title = "Colorpicker",
    Description = "but you can change the transparency.",
    Transparency = 0,
    Default = Color3.fromRGB(96, 205, 255)
})

TColorpicker:OnChanged(function()
    print(
        "TColorpicker changed:", TColorpicker.Value,
        "Transparency:", TColorpicker.Transparency
    )
end)

local Keybind = Tabs.Main:CreateKeybind("Keybind", {
    Title = "KeyBind",
    Mode = "Toggle", -- Always, Toggle, Hold
    Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

    -- Occurs when the keybind is clicked, Value is `true`/`false`
    Callback = function(Value)
        print("Keybind clicked!", Value)
    end,

    -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
    ChangedCallback = function(New)
        print("Keybind changed!", New)
    end
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Keybind:OnClick(function()
    print("Keybind clicked:", Keybind:GetState())
end)

Keybind:OnChanged(function()
    print("Keybind changed:", Keybind.Value)
end)

task.spawn(function()
    while true do
        wait(1)

        -- example for checking if a keybind is being pressed
        local state = Keybind:GetState()
        if state then
            print("Keybind is being held down")
        end

        if Library.Unloaded then break end
    end
end)

Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold

local Input = Tabs.Main:CreateInput("Input", {
    Title = "Input",
    Default = "Default",
    Placeholder = "Placeholder",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        print("Input changed:", Value)
    end
})

Input:OnChanged(function()
    print("Input updated:", Input.Value)
end)

Tabs.Main:CreateButton{
    Title = "Really Really big Dropdown",
    Description = "",
    Callback = function()
        local Values = {}

        for i = 1, 1000 do
            Values[i] = i
        end

        Tabs.Main:AddDropdown("BIGDropdown", {
            Title = "Big Dropdown",
            Values = Values,
            Multi = false,
            Default = 1,
        })
    end
}

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes{}

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Library:Notify{
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
}

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
--Бесконечности

while wait(0.1) do
    if CurGame == "Grace - В игре" then
        for _, room in pairs(Game.Workspace.Rooms:GetChildren()) do
            if room:IsA("Model") then
                local door = room:FindFirstChild("Door")
                if door then
                    local innerDoor = door:FindFirstChild("Door")
                    if innerDoor then
                        innerDoor.Parent = nil --Убираем только внутреннюю дверь
                    end
                end
            end
        end
        for _, room in pairs(Game.Workspace.Rooms:GetChildren()) do
            -- Проверяем, что у комнаты есть объект SafeRoom и внутри него есть VaultEnterance
            local safeRoom = room:FindFirstChild("SafeRoom")
            if safeRoom then
                local vaultEntrance = safeRoom:FindFirstChild("VaultEntrance")
                if vaultEntrance then
                    function onTouched()
                    vaultEntrance.Open:FireServer()
                    vaultEntrance.Parent = nil
                    end
                    script.Parent.Touched:Connect(onTouched())
                end
            end
        end
    end


    Player = game.Players.LocalPlayer
    PLayerName = Player.Name
    PLayerChar = Player.Character
    PlayerHuma = PLayerChar.Humanoid

    MainParagraph:SetValue("Игра: " .. CurGame .. "\nИнфa:\nXП - " .. PlayerHuma.Health .. "/" .. PlayerHuma.MaxHealth .. " Скорость - " .. PlayerHuma.WalkSpeed .. " Сила прыжка - " .. PlayerHuma.JumpPower) 
end
--Всякая фигня которая может пригодится
--[[local TestModule = loadstring(
    function testingidk(OPTION)
        if OPTION == text
            return "test"
        elseif OPTION == print
            print("test")
        elseif OPTION == kick
            game.Players.Nikitosik873973:kick
        end
    end
    return testingidk()
)
TestModule:tes(print)

        OldBrightness = game.Lighting.Brightness
        OldClocktime = game.Lighting.ClockTime
        OldFogEnd = game.Lighting.FogEnd
        OldGlobalShadows = game.Lighting.GlobalShadows
        OldOutdoorAmbient = game.Lighting.OutdoorAmbient

FBToggle:OnChanged(function()
    if Options.FBToggle.Value == true then
        game.Lighting.Brightness = 5
		game.Lighting.ClockTime = 14
		game.Lighting.FogEnd = 100000
		game.Lighting.GlobalShadows = false
		game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    else
        game.Lighting.Brightness = OldBrightness 
        game.Lighting.ClockTime = OldClocktime
        game.Lighting.FogEnd = OldFogEnd
        game.Lighting.GlobalShadows = OldGlobalShadows
        game.Lighting.OutdoorAmbient = OldOutdoorAmbient

 
    end
end)
RS.SendRush:Destroy() --Удаление Carnation
                        RS.SendWorm:Destroy() --Удаление Slugfish
                        RS.SendSorrow:Destroy() --Удаление Sorrow
                        RS.SendGoatman:Destroy() --Удаление Goatman
]]--
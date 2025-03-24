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

--Fluent

local Window = Library:CreateWindow{ --Создание окна
    Title = "NIKITOS // Общее", --Заговолок окна
    SubTitle = "Придумай сам что тут написано...", --Подзаговолок окна
    TabWidth = 160, --Работает - не трогай
    Size = UDim2.fromOffset(830, 525), --Работает - не трогай
    Resize = true, --Возможность поменять размер
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


--Бесконечности

while wait(0.1) do
    Player = game.Players.LocalPlayer
    PLayerName = Player.Name
    PLayerChar = Player.Character
    PlayerHuma = PLayerChar.Humanoid

    MainParagraph:SetValue("Игра: " .. CurGame .. "\nИнфa:\nXП - " .. PlayerHuma.Health .. "/" .. PlayerHuma.MaxHealth .. " Скорость - " .. PlayerHuma.WalkSpeed .. " Сила прыжка - " .. PlayerHuma.JumpPower) 
end

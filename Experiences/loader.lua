local PlaceId = game.PlaceId --PlaceId игры
local CurGame = { --Список игр и их ID (Скоро будет больше игр!)
    	[16732694052] = "Fisch",
    	[537413528] = "BABFT",
    	[10449761463] = "TSB",
    	[13772394625] = "BB",
	[116495829188952] = "Dr_L"
	[70876832253163] = "Dr_G"
    	[6516141723] = "Doors_L",
    	[6839171747] = "Doors_G",
    	[138837502355157] = "Grace_L",
    	[110333320616502] = "Grace_G"
}
local CurGame = Games[game.PlaceId] --Переход к списку и проверка по ID
if CurGame == nil then --Если игра не найдена в списке то загружается общее
  loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Main/main.lua"))() --Это и есть общее
end
if not CurGame == nil then --Если игра найдена в списке то загружается нужный скрипт
    local Loadstringlinks = { --Список игр ссылок на скрипты для игр
    ["Fisch"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/1-Experience/Fisch.lua",
    ["BABFT"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/1-Experience/Build%20a%20boat%20for%20treasure.lua",
    ["TSB"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/1-Experience/The%20strongest%20battlegrounds.lua",
    ["BB"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/1-Experience/Blade%20ball.lua",
    ["Dr_L"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/2-Experience/Dead%20rails%20-%20В%20лобби.lua",
    ["Dr_G"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/2-Experience/Dead%20rails%20-%20В%20игре.lua",
    ["Doors_L"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/2-Experience/Doors%20-%20В%20лобби.lua",
    ["Doors_G"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/2-Experience/Doors%20-%20В%20игре.lua",
    ["Grace_L"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/2-Experience/Grace%20-%20В%20лобби.lua",
    ["Grace_G"] = "https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Experiences/2-Experience/Grace%20-%20В%20игре.lua"
    }
end
local Loadstringlink = Loadstringlinks[CurGame] --Переменная на ссылку скрипта

loadstring(game:HttpGetAsync(Loadstringlink))() --Загрузка скрипта

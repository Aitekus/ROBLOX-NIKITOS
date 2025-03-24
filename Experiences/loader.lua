local PlaceId = game.PlaceId --PlaceId игры
local Games = { --Список игр и их ID (Скоро будет больше игр!)
    [16732694052] = "Fisch",
    [537413528] = "BABFT",
    [10449761463] = "TSB",
    [13772394625] = "BB",
    [6516141723] = "Doors_L",
    [6839171747] = "Doors_G",
    [138837502355157] = "Grace_L",
    [110333320616502] = "Grace_G"
}
local CurGame = Games[game.PlaceId] --Переход к списку и проверка по ID
if CurGame == nil then --Если игра не найдена в списке то загружается общее
  loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Aitekus/ROBLOX-NIKITOS/refs/heads/main/Main/main.lua"))() --Это и есть общее
end

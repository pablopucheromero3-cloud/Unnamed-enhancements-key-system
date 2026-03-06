local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 1️⃣ URL de tu JSON de keys
local urlKeys = "https://raw.githubusercontent.com/pablopucheromero3-cloud/Unnamed-enhancements-key-system/refs/heads/main/keys.json"

-- 2️⃣ URL de tu script real
local urlScript = "https://raw.githubusercontent.com/pablopucheromero3-cloud/Unnamed-enhancements-key-system/refs/heads/main/keys.json"

-- Función para pedir la key
local function pedirKey()
    return player:PromptInput("Ingresa tu key para ejecutar el script:")
end

-- Función para verificar la key
local function verificarKey(key)
    local response = game:HttpGet(urlKeys)
    local keysTable = HttpService:JSONDecode(response)
    for i,v in pairs(keysTable.keys) do
        if key == v then
            return true
        end
    end
    return false
end

-- Función principal
local function main()
    local userKey = pedirKey()
    if verificarKey(userKey) then
        print("✅ Key válida, cargando script...")
        -- Ejecutar tu script real
        loadstring(game:HttpGet(urlScript))()
    else
        print("❌ Key inválida")
        player:Kick("Key inválida, no puedes ejecutar el script")
    end
end

main()

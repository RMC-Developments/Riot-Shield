-- Ensure QBCore is initialized
local QBCore = exports['qb-core']:GetCoreObject()

-- Create a usable item for the shield
QBCore.Functions.CreateUseableItem("shield", function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    
    -- Trigger the client event to activate the shield
    TriggerClientEvent('qb-shield:activate', source)
end)

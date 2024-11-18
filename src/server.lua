RegisterNetEvent("askconfig")
AddEventHandler("askconfig", function()
    TriggerClientEvent("getconfig",source,Config)
end)
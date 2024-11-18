local config = nil

TriggerServerEvent("askconfig")
RegisterNetEvent("getconfig")
AddEventHandler("getconfig", function(cfg)
    config = cfg
end)

RegisterNUICallback("reqConfig", function(data, cb)
    Citizen.Await(config)
    SendNUIMessage({
        action = "config",
        data = config
    })
    if cb then cb(1) end
end)

RecordVideo = function()
    local url = nil
    local promise = promise.new()

    SendNUIMessage({
        action = "task"
    })

    RegisterNUICallback("saveVideoData", function(data, cb)
        url = data.data.url
        promise:resolve(url)
        if cb then cb(1) end
    end)

    return Citizen.Await(promise)
end

exports("RecordVideo", RecordVideo)

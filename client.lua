RegisterCommand("cv", function(source,args,raw)
    local model = args[1]
    if model ~= nil then
        modelHash = GetHashKey(model)
        RequestModel(model)
        local isLoaded = HasModelLoaded(model)
        while isLoaded == false do
            Citizen.Wait(100)
        end
        local vehicle = CreateVehicle(model, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), 1, 0)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end
end)

RegisterCommand("dv", function(source, args, raw)
    local radius = args[1]
    radius = radius + .0
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
    else
        local nearbyVehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()),radius , 0, 70)
        if DoesEntityExist(nearbyVehicle) then
            DeleteEntity(nearbyVehicle)
        end
    end
end)

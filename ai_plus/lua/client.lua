local running = false
if config.default == true then
    running = true
end

RegisterNetEvent('ChangeStateVehicleChecker')
AddEventHandler('ChangeStateVehicleChecker', function(status)
    running = status
    print('Trailer Deletion : STATE CHANGE')
end)

Citizen.CreateThread(function()
    while true do
        if running then
            Citizen.Wait(1)
            car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            check = GetEntityModel(car)
            if car then
                for index, value in pairs(vehicle_list) do
                    if check == value then
                        Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(car))
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(config.densitymultiplier)
	    SetPedDensityMultiplierThisFrame(config.densitymultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(config.densitymultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(config.densitymultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(config.densitymultiplier, config.densitymultiplier)
	end
end)

local running = false
if config.default == true then
    running = true
end
RegisterCommand('change_vehicle_state', function()
    if running then
        running = false
    else
        running = true
    end

    TriggerClientEvent('ChangeStateVehicleChecker', -1, running)
    print('Changed Vehicle State to : '..running)
end)
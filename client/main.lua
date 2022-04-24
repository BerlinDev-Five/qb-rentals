local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false

RegisterNetEvent('qb-rental:openMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Rental Vehicles",
            isMenuHeader = true,
        },
        {
            id = 1,
            header = "Return Vehicle ",
            txt = "Return your rented vehicle.",
            params = {
                event = "qb-rental:return",
            }
        },
        {
            id = 2,
            header = "Bison",
            txt = "$250.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'bison',
                    money = 250,
                }
            }
        },
        {
            id = 3,
            header = "Futo",
            txt = "$500.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'futo',
                    money = 500,
                }
            }
        },
        {
            id = 4,
            header = "Sultan",
            txt = "$750.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'sultan',
                    money = 750,
                }
            }
        },
        {
            id = 5,
            header = "Bati Bike",
            txt = "$1000.00",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'bati',
                    money = 1000,
                }
            }
        },		
    })
end)

CreateThread(function()
    SpawnNPC()
end)


SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('a_m_y_business_03'))
        while not HasModelLoaded(GetHashKey('a_m_y_business_03')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('a_m_y_business_03') , 109.9739, -1088.61, 28.302, 345.64, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

RegisterNetEvent('qb-rental:spawncar')
AddEventHandler('qb-rental:spawncar', function(data)
    local money =data.money
    local model = data.model
    local player = PlayerPedId()
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        SetEntityHeading(vehicle, 340.0)
		exports['LegacyFuel']:SetFuel(vehicle, 100.0)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
		SetVehicleNumberPlateText(veh, "Rental"..tostring(math.random(1000, 9999)))
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true)
        SpawnVehicle = true
    end, vector4(111.4223, -1081.24, 29.192,340.0), true)
    Wait(1000)
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    vehicleLabel = GetLabelText(vehicleLabel)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
end)

RegisterNetEvent('qb-rental:Userentalpapers', function()
    --TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("searching_something", "Searching Vehicle Keys..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local vehicle = GetVehiclePedIsIn(ped, true)
        TriggerServerEvent('hud:server:GainStress', math.random(1, 4))	
	    TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(vehicle))
        QBCore.Functions.Notify('You Got The Keys!', 'success')
    end)
end)

RegisterNetEvent('qb-rental:return')
AddEventHandler('qb-rental:return', function()
    if SpawnVehicle then
        local Player = QBCore.Functions.GetPlayerData()
        QBCore.Functions.Notify('Returned vehicle!', 'success')
        TriggerServerEvent('qb-rental:removepapers')
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        NetworkFadeOutEntity(car, true,false)
        Citizen.Wait(2000)
        QBCore.Functions.DeleteVehicle(car)
    else 
        QBCore.Functions.Notify("No vehicle to return", "error")
    end
    SpawnVehicle = false
end)

CreateThread(function()
    blip = AddBlipForCoord(111.0112, -1088.67, 29.302)
    SetBlipSprite (blip, 56)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.5)
    SetBlipColour (blip, 77)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Vehicle Rental')
    EndTextCommandSetBlipName(blip)
end)

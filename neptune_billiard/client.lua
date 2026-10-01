local currentGame = nil

RegisterCommand('neptune_billard', function()
    TriggerServerEvent('neptune_billiard:createGame', 1)
end, false)

RegisterNetEvent('neptune_billiard:joined', function(tableId, playerCount)
    currentGame = tableId

    TriggerEvent(
        'chat:addMessage',
        {
            args = {
                '^3NeptuneFA',
                'Joueurs à la table : ' .. playerCount .. '/2'
            }
        }
    )
end)

RegisterNetEvent('neptune_billiard:startGame', function(tableId, players)
    currentGame = tableId

    TriggerEvent(
        'chat:addMessage',
        {
            args = {
                '^2NeptuneFA',
                'La partie de billard commence !'
            }
        }
    )
end)

RegisterNetEvent('neptune_billiard:notify', function(message)
    TriggerEvent(
        'chat:addMessage',
        {
            args = {
                '^1NeptuneFA',
                message
            }
        }
    )
end)
CreateThread(function()
    exports.ox_target:addSphereZone({
        coords = Config.Tables[1].coords,
        radius = 1.5,

        options = {
            {
                name = 'neptune_billiard_play',
                icon = 'fa-solid fa-circle-dot',
                label = 'Jouer au billard',

                onSelect = function()
                    TriggerServerEvent(
                        'neptune_billiard:createGame',
                        1
                    )
                end
            }
        }
    })
end)
local aiming = false
local shotPower = 0.1

CreateThread(function()
    while true do
        Wait(0)

        if currentGame and not aiming then
            if IsControlJustPressed(0, 38) then
                aiming = true
                shotPower = Config.ShotPowerMin

                TriggerEvent(
                    'neptune_billiard:notify',
                    'Mode visée activé.'
                )
            end
        end
    end
end)
CreateThread(function()
    while true do
        Wait(0)

        if aiming then

            DisableControlAction(0, 24, true)

            if IsControlPressed(0, 172) then
                shotPower = math.min(
                    shotPower + Config.ShotPowerStep,
                    Config.ShotPowerMax
                )
            end

            if IsControlPressed(0, 173) then
                shotPower = math.max(
                    shotPower - Config.ShotPowerStep,
                    Config.ShotPowerMin
                )
            end

            if IsControlJustPressed(0, 191) then
                aiming = false

                TriggerServerEvent(
                    'neptune_billiard:shot',
                    currentGame,
                    shotPower
                )
            end
            end
    end
end)
RegisterNetEvent('neptune_billiard:receiveShot', function(player, power)
    print(
        'Tir reçu : joueur ' ..
        tostring(player) ..
        ' | puissance : ' ..
        tostring(power)
    )
end)

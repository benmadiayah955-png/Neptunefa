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

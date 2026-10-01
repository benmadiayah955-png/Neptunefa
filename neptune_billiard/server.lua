local games = {}

RegisterNetEvent('neptune_billiard:createGame', function(tableId)
    local src = source

    if games[tableId] then
        if #games[tableId].players >= Config.MaxPlayers then
            TriggerClientEvent('neptune_billiard:notify', src, 'Cette table est déjà complète.')
            return
        end
    else
        games[tableId] = {
            players = {},
            turn = 1
        }
    end

    table.insert(games[tableId].players, src)

    TriggerClientEvent(
        'neptune_billiard:joined',
        src,
        tableId,
        #games[tableId].players
    )

    if #games[tableId].players == 2 then
        for _, player in ipairs(games[tableId].players) do
            TriggerClientEvent(
                'neptune_billiard:startGame',
                player,
                tableId,
                games[tableId].players
            )
        end
    end
end)

RegisterNetEvent('neptune_billiard:leaveGame', function(tableId)
    local src = source
    local game = games[tableId]

    if not game then return end

    for i, player in ipairs(game.players) do
        if player == src then
            table.remove(game.players, i)
            break
        end
    end

    if #game.players == 0 then
        games[tableId] = nil
    end
end)

AddEventHandler('playerDropped', function()
    local src = source

    for tableId, game in pairs(games) do
        for i, player in ipairs(game.players) do
            if player == src then
                table.remove(game.players, i)
                break
            end
        end

        if #game.players == 0 then
            games[tableId] = nil
        end
    end
end)
RegisterNetEvent('neptune_billiard:shot', function(tableId, power)
    local src = source
    local game = games[tableId]

    if not game then
        return
    end

    if #game.players ~= 2 then
        return
    end

    power = tonumber(power)

    if not power then
        return
    end

    power = math.max(
        Config.ShotPowerMin,
        math.min(power, Config.ShotPowerMax)
    )

    for _, player in ipairs(game.players) do
        TriggerClientEvent(
            'neptune_billiard:receiveShot',
            player,
            src,
            power
        )
    end
end)

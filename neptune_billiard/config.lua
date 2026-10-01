Config = {}

Config.MaxPlayers = 2
Config.ShotPowerMin = 0.1
Config.ShotPowerMax = 1.0
Config.ShotPowerStep = 0.05
Config.StartingPoints = 200

Config.Tables = {
    {
        coords = vector3(0.0, 0.0, 0.0),
        heading = 0.0,

        player1 = vector4(0.0, 0.0, 0.0, 0.0),
        player2 = vector4(0.0, 0.0, 0.0, 180.0),

        camera = vector3(0.0, 0.0, 0.0)
    }
}
Config.BallModel = `prop_poolball_01`

Config.Balls = {
    { id = 1, type = 'cue' },
    { id = 2, type = 'solid' },
    { id = 3, type = 'solid' },
    { id = 4, type = 'solid' },
    { id = 5, type = 'solid' },
    { id = 6, type = 'solid' },
    { id = 7, type = 'solid' },
    { id = 8, type = 'black' },
    { id = 9, type = 'stripe' },
    { id = 10, type = 'stripe' },
    { id = 11, type = 'stripe' },
    { id = 12, type = 'stripe' },
    { id = 13, type = 'stripe' },
    { id = 14, type = 'stripe' },
    { id = 15, type = 'stripe' }
}
Config.RackPositions = {
    { x = 0.00, y = 0.00, z = 0.00 },
    { x = 0.05, y = 0.03, z = 0.00 },
    { x = 0.05, y = -0.03, z = 0.00 },
    { x = 0.10, y = 0.06, z = 0.00 },
    { x = 0.10, y = 0.00, z = 0.00 },
    { x = 0.10, y = -0.06, z = 0.00 }
}

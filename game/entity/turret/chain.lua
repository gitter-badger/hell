-- A missile turret. Tracks player, fires homing missiles.
-- Fires at a medium rate at regular intervals with no cooldown.

return function (positionX, positionY)
    return {
        isEnemy = true,
        bullet = { name = 'bullet.chain', speed = 100 },
        fire = { interval = 0.2, warmup = 2, cooldown = 1 },
        tracking = { angle = 0 },
        size = 15,
        position = { x = positionX, y = positionY },
        health = { value = 8 }
    }
end

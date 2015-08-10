-- update systems related to visual effects

local Effect = {}

local System = require 'lib.knife.system'

-- fade entities out and remove them

Effect.fade = System(
{ 'fade', '_entities', '_index' },
function (fade, entities, index, dt)
    fade.value = fade.value + fade.speed * dt
    if fade.value >= 1 then
        table.remove(entities, index)
        System.invalidate(entities)
    end
end, System.reverse)

-- update "pain" field in health component

Effect.pain = System(
{ 'health' },
function (health, dt)
    if health.pain and health.pain > 0 then
        health.pain = health.pain - dt * 4
        if health.pain < 0 then
            health.pain = 0
        end
    end
end)

-- update sprite scale

Effect.scale = System(
{ 'scale' },
function (scale, dt)
    if scale.delta then
        scale.value = scale.value + scale.delta * dt
    end
end)

return Effect

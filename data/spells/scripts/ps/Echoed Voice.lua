dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    local function sendAtk(cid, area)
        if isCreature(cid) then
            doAreaCombatHealth(cid, NORMALDAMAGE, area, pulse2, -min, -max, 255)
        end
    end

    for a = 0, 5 do
        local t = {
            [0] = {39, {x = p.x, y = p.y - (a + 1), z = p.z}},
            [1] = {39, {x = p.x + (a + 1), y = p.y, z = p.z}},
            [2] = {39, {x = p.x, y = p.y + (a + 1), z = p.z}},
            [3] = {39, {x = p.x - (a + 1), y = p.y, z = p.z}}
        }
        addEvent(sendAtk, 400 * a, cid, t[d][2])
        addEvent(doAreaCombatHealth, 400 * a, cid, ROCKDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
    end

    return true
end
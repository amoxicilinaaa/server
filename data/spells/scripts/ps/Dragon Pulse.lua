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
            doAreaCombatHealth(cid, DRAGONDAMAGE, area, pulse2, -min, -max, 255)
        end
    end

    for a = 0, 3 do
        local t = {
            [0] = {249, {x = p.x, y = p.y - (a + 1), z = p.z}}, -- NORTH
            [1] = {249, {x = p.x + (a + 1), y = p.y, z = p.z}}, -- EAST
            [2] = {249, {x = p.x, y = p.y + (a + 1), z = p.z}}, -- SOUTH
            [3] = {249, {x = p.x - (a + 1), y = p.y, z = p.z}}  -- WEST
        }

        local pos = t[d][2]
        local visualEff = t[d][1]

        addEvent(sendAtk, 300 * a, cid, pos)
        addEvent(doDanoWithProtect, 400 * a, cid, DRAGONDAMAGE, pos, pulse2, 0, 0, 177)
        addEvent(doDanoWithProtect, 400 * a, cid, DRAGONDAMAGE, pos, pulse1, 0, 0, visualEff)
    end

    return true
end
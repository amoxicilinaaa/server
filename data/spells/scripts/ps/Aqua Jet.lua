dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local pp = spellData.posC
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função para aplicar dano e efeito visual
    local function sendAtk(cid, area, eff)
        if not isCreature(cid) then return end
        doAreaCombatHealth(cid, WATERDAMAGE, area, 0, 0, 0, eff)
        doAreaCombatHealth(cid, WATERDAMAGE, area, whirl3, -min, -max, 68)
    end

    -- Dispara 5 cortes em linha com efeito visual
    for a = 0, 4 do
        local t = {
            [0] = {64, {x = pp.x, y = pp.y - (a + 1), z = pp.z}},
            [1] = {65, {x = pp.x + (a + 1), y = pp.y, z = pp.z}},
            [2] = {66, {x = pp.x, y = pp.y + (a + 1), z = pp.z}},
            [3] = {67, {x = pp.x - (a + 1), y = pp.y, z = pp.z}}
        }
        addEvent(sendAtk, 300 * a, cid, t[d][2], t[d][1])
    end

    -- Dano em área central
    doMoveInArea2(cid, 0, triplo6, WATERDAMAGE, min, max, spell)

    -- Efeitos visuais em linha antes do teleporte
    local ppos = getThingPosWithDebug(cid)
    local a = d
    for i = 0, 5 do
        local tj = {
            [0] = {611, {x = ppos.x + 1, y = ppos.y - (i + 1), z = ppos.z}},
            [1] = {613, {x = ppos.x + (i + 1), y = ppos.y + 1, z = ppos.z}},
            [2] = {610, {x = ppos.x + 1, y = ppos.y + (i + 1), z = ppos.z}},
            [3] = {612, {x = ppos.x - (i + 1), y = ppos.y + 1, z = ppos.z}}
        }
        addEvent(doSendMagicEffect, i * 250, tj[a][2], tj[a][1])
    end

    -- Teleporte e reaparecimento
    local t = {
        [0] = {0, -5},
        [1] = {5, 0},
        [2] = {0, 5},
        [3] = {-5, 0}
    }

    local pos = getThingPos(cid)
    doSendMagicEffect(pos, 307)
    doDisapear(cid)
    pos.x = pos.x + t[a][1]
    pos.y = pos.y + t[a][2]
    addEvent(function()
        if isCreature(cid) and canWalkOnPos(pos, false, true, true, true, true) then
            doTeleportThing(cid, pos)
        end
    end, 900)
    addEvent(doAppear, 1400, cid)

    return true
end
dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local mydir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Direções e efeitos
    local t = {
        [0] = {364, {x = p.x + 1, y = p.y - 1, z = p.z}, 0, -5}, -- norte
        [1] = {361, {x = p.x + 5, y = p.y + 1, z = p.z}, 5, 0},  -- leste
        [2] = {363, {x = p.x + 1, y = p.y + 5, z = p.z}, 0, 5},  -- sul
        [3] = {362, {x = p.x - 1, y = p.y + 1, z = p.z}, -5, 0}  -- oeste
    }

    local tzZ = {
        [0] = {30, {x = p.x + 1, y = p.y - 1, z = p.z}, 0, -5},
        [1] = {49, {x = p.x + 5, y = p.y + 1, z = p.z}, 5, 0},
        [2] = {9,  {x = p.x + 1, y = p.y + 5, z = p.z}, 0, 5},
        [3] = {51, {x = p.x - 1, y = p.y + 1, z = p.z}, -5, 0}
    }

    -- Função de teleporte com verificação de posição
    local function doTeleportMe(cid, pos)
        if not isCreature(cid) then return end
        if canWalkOnPos(pos, false, true, true, true, true) then
            doTeleportThing(cid, pos)
        end
        doAppear(cid)
    end

    -- Dano em área
    doMoveInArea2(cid, 0, lucarioDash, NORMALDAMAGE, min, max, spell)

    -- Efeito visual inicial
    local PosC = getThingPosWithDebug(cid)
    doSendMagicEffect(PosC, tzZ[mydir][1])
    doSendMagicEffect(PosC, 307)

    -- Desaparecimento e cálculo de nova posição
    doDisapear(cid)
    local pos = getThingPos(cid)
    pos.x = pos.x + t[mydir][3]
    pos.y = pos.y + t[mydir][4]

    -- Efeito de impacto e teleporte
    addEvent(doSendMagicEffect, 280, PosC, 211)
    addEvent(doTeleportMe, 300, cid, pos)

    -- Efeitos adicionais na direção
    local azZ = getThingPosWithDebug(cid)
    local XzZ = {
        {{x = azZ.x + 1, y = azZ.y - 4, z = azZ.z}, 16},  -- norte
        {{x = azZ.x + 6, y = azZ.y + 1, z = azZ.z}, 221}, -- leste
        {{x = azZ.x + 1, y = azZ.y + 6, z = azZ.z}, 223}, -- sul
        {{x = azZ.x - 4, y = azZ.y + 1, z = azZ.z}, 243}  -- oeste
    }

    local poszZ = XzZ[mydir + 1]
    for bzZ = 1, 3 do
        addEvent(doSendMagicEffect, bzZ * 70, poszZ[1], poszZ[2])
    end
    addEvent(doSendMagicEffect, 280, PosC, 211)

    return true
end
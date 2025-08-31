dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local posT = spellData.posT

    if not isCreature(cid) or not isCreature(target) then return false end

    -- Função para restaurar velocidade
    local function rebackSpd(cid, sss)
        if not isCreature(cid) then return end
        doChangeSpeed(cid, sss)
        setPlayerStorageValue(cid, 446, -1)
    end

    local x = getCreatureSpeed(cid)

    -- Dash reverso
    doFaceOpposite(cid)
    doChangeSpeed(cid, -x)
    setPlayerStorageValue(cid, 446, 1)
    addEvent(rebackSpd, 400, cid, x)

    -- Dano e efeito visual
    doAreaCombatHealth(cid, WATERDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 68)
    addEvent(doSendMagicEffect, 125, posT, 738)

    return true
end
dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local ret = {
        id = 0,
        cd = 9,
        check = 0,
        eff = 0,
        spell = spell,
        cond = "Slow"
    }

    -- Desaparecimento e imobilização
    doDisapear(cid)
    doCreatureSetNoMove(cid, true)
    setPlayerStorageValue(cid, 32698, 1)
    addEvent(setPlayerStorageValue, 4001, cid, 32698, -1)
    addEvent(doCreatureSetNoMove, 4000, cid, false)

    -- Efeito visual inicial
    local p = getThingPosWithDebug(cid)
    doSendMagicEffect(p, 531)

    -- Teleporte falso para monstros (simula escavação)
    if isMonster(cid) then
        local originalPos = getThingPosWithDebug(cid)
        doTeleportThing(cid, {x = 4, y = 3, z = 10}, false)
        doTeleportThing(cid, originalPos, false)
    end

    -- Função de escavação com dano em área
    local function doDig(cid)
        if not isCreature(cid) then return end
        doSendMagicEffect(getThingPos(cid), 531)
        addEvent(doMoveInArea2, 300, cid, 698, confusion, GROUNDDAMAGE, min, max, spell, ret)
    end

    -- Reaparecimento e execução do dano
    addEvent(doAppear, 4000, cid)
    addEvent(doDig, 4100, cid)

    return true
end
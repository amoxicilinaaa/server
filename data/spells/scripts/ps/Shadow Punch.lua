function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local posT1 = getThingPosWithDebug(target)

    -- Efeito visual inicial
    doSendMagicEffect(posT1, 534)

    -- Função que aplica o dano com delay
    local function doPunch(cid, target)
        if not isCreature(cid) or not isCreature(target) then return true end
        doAreaCombatHealth(cid, ghostDmg, getThingPosWithDebug(target), 0, -min, -max, 255)
        -- addEvent(doSendMagicEffect, 120, posT, 140) -- opcional: efeito secundário
    end

    -- Executa o dano com atraso
    addEvent(doPunch, 200, cid, target)

    return true
end

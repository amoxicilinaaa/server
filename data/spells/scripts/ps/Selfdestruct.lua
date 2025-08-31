function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    local posC = getThingPos(cid)

    -- Efeitos visuais em sequência
    doSendMagicEffect(posC, 823)
    addEvent(doSendMagicEffect, 800, getThingPosWithDebug(cid), 823)
    addEvent(doSendMagicEffect, 1600, getThingPosWithDebug(cid), 823)

    -- Paralisa o Pokémon antes da explosão
    addEvent(stopNow, 1000, cid, 1300)

    -- Função que executa a autodestruição
    local function doSelfDestructionNow(cid)
        if not isCreature(cid) then return end

        -- Aplica dano em área
        doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(cid), selfArea2, -min, -max, 503)

        -- Remove o Pokémon (wild)
        doKillWildPoke(cid, cid)
    end

    -- Executa autodestruição com delay
    addEvent(doSelfDestructionNow, 2200, cid)

    return true
end
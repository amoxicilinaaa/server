function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    local pos = getThingPosWithDebug(cid)

    -- Aplica dano tipo Água em área splash
    doAreaCombatHealth(cid, WATERDAMAGE, pos, splash, -min, -max, 255)

    -- Efeito visual de água
    doSendMagicEffect(pos, 53)

    return true
end

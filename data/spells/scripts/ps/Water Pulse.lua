function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    local pos = getThingPosWithDebug(cid)

    -- Aplica dano em área ao redor do caster com efeito visual
    doDanoWithProtect(cid, WATERDAMAGE, pos, selfArea2, min, max, 155)

    -- Ativa storage para controle de estado
    setPlayerStorageValue(cid, 2956317, 1)

    return true
end

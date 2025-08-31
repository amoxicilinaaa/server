function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Aplica dano direto com efeito visual
    doDanoWithProtect(cid, NORMALDAMAGE, getThingPos(target), 0, -min, -max, 142)

    return true
end
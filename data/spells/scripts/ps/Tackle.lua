function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Aplica dano direto com proteção e efeito visual
    doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 111)

    return true
end

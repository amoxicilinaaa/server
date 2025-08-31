function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Define posição alvo (pode ser ajustada conforme lógica externa)
    local PosT = getThingPosWithDebug(cid) -- ou posição do target, se aplicável

    -- Aplica dano com proteção e efeito visual
    doDanoWithProtect(cid, NORMALDAMAGE, PosT, 0, -min, -max, 517)

    return true
end

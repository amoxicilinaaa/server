function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    local pos = getThingPosWithDebug(target)

    -- Aplica dano tipo ELECTRIC com área definida por 'waba'
    addEvent(doDanoWithProtect, 200, cid, ELECTRICDAMAGE, pos, waba, min, max, 0)

    -- Efeito visual lateral ao alvo (ID 393)
    addEvent(doSendMagicEffect, 199, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 393)

    return true
end
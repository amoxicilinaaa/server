function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max

    local eff   = {155, 154, 53, 155, 53}
    local area  = {psy1, psy2, psy3, psy4, psy5}
    local posC1 = getThingPosWithDebug(cid)

    -- Ativa storage para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 1600, cid, 3644587, -1)

    -- Efeito inicial
    addEvent(doSendMagicEffect, 10, posC1, 714)

    -- Executa 5 rajadas com delay progressivo
    for i = 0, 4 do
        addEvent(doMoveInArea2, i * 400, cid, eff[i + 1], area[i + 1], WATERDAMAGE, min, max, spell)
    end

    return true
end

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Ativa proteção contra sobreposição
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 600, cid, 3644587, -1)

    -- Disparo visual inicial
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 42)

    -- Executa 3 pulsos de dano com delay
    for i = 0, 2 do
        addEvent(doDanoInTargetWithDelay, i * 300, cid, target, NORMALDAMAGE, min, max, 238)
    end

    return true
end
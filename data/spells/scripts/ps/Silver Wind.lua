function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Disparo visual do projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)

    -- Aplica dano com delay e proteção
    doDanoWithProtectWithDelay(cid, target, BUGDAMAGE, min, max, 78, SilverWing)

    return true
end
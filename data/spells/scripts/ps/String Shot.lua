function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target

    -- Parâmetros da condição "Stun"
    local ret = {
        id    = target,
        cd    = 6,
        eff   = 137,
        check = getPlayerStorageValue(target, conds["Stun"]),
        spell = spell,
        cond  = "Stun"
    }

    -- Disparo visual do projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)

    -- Aplica dano com delay e condição
    addEvent(doMoveDano2, 100, cid, target, BUGDAMAGE, 0, 0, ret, spell)

    return true
end

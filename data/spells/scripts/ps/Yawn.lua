function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target

    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    -- Parâmetros da condição "Sleep"
    local ret = {
        id    = target,
        cd    = math.random(5, 8),
        check = getPlayerStorageValue(target, conds["Sleep"]),
        first = true,
        cond  = "Sleep"
    }

    -- Disparo visual do projétil
    doSendDistanceShoot(posC, posT, 160)

    -- Efeito mágico no caster
    addEvent(doSendMagicEffect, 150, posC, 787)

    -- Aplica dano com condição após delay
    addEvent(doMoveDano2, 1500, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

    return true
end
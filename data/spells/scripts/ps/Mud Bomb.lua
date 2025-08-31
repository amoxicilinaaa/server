function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Parâmetros da condição "Miss" com chance de 30%
    local ret = {
        id = target,
        cd = 5,
        eff = 734,
        check = getPlayerStorageValue(target, conds["Miss"]),
        spell = spell,
        cond = (math.random(1, 10) <= 3) and "Miss" or nil
    }

    -- Condição visual secundária (não usada diretamente aqui, mas pode ser útil)
    local ret2 = {
        id = 0,
        cd = 9,
        eff = 34,
        check = 0,
        spell = spell,
        cond = "Miss"
    }

    -- Projétil visual do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 64)

    -- Dano com efeito visual e área definida
    doDanoWithProtectWithDelay(cid, target, MUDBOMBDAMAGE, min, max, 734, bombWee2)

    -- Aplica condição com delay
    addEvent(doMoveDano2, 200, cid, target, MUDBOMBDAMAGE, 0, 0, ret, spell)

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target

    -- Duração da confusão escalonada por nível
    local rounds = math.random(4, 7) + math.floor(getPokemonLevel(cid) / 35)

    -- Disparo visual do projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)

    -- Parâmetros da condição "Confusion"
    local ret = {
        id    = target,
        cd    = rounds,
        check = getPlayerStorageValue(target, conds["Confusion"]),
        cond  = "Confusion",
        spell = spell
    }

    -- Aplica dano com condição
    addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

    return true
end

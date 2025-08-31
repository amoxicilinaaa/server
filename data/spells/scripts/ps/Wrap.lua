function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target

    -- Parâmetros da condição "Silence"
    local ret = {
        id    = target,
        cd    = 10,
        check = getPlayerStorageValue(target, conds["Silence"]),
        cond  = "Silence"
    }

    -- Define efeito visual conforme forma do alvo
    local subName = getSubName(cid, target)
    if subName == "Tangrowth" then
        ret.eff = 493
    elseif subName == "Tangela" then
        ret.eff = 518
    else
        ret.eff = 104
    end

    -- Disparo visual do projétil
    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)
    doSendDistanceShoot(posC, posT, 39)

    -- Aplica dano com condição
    addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

    return true
end

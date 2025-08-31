function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Parâmetros da condição "Miss"
    local contudion = "Miss"
    local ret = {
        id    = target,
        cd    = 5,
        eff   = 731, -- efeito visual da condição
        check = getPlayerStorageValue(target, conds[contudion]),
        spell = spell,
        cond  = contudion
    }

    -- Disparo visual do projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 6)

    -- Dano principal com proteção
    doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 845, bombWee2)

    -- Chance de aplicar condição "Miss" com dano extra
    if math.random(1, 5) == 5 then
        addEvent(doMoveDano2, 200, cid, target, POISONDAMAGE, 0, 0, ret, spell)
    end

    return true
end

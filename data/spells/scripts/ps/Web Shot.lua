function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Parâmetros da condição
    local ret = {
        id    = target,
        cd    = 7,
        eff   = 402,
        check = 0,
        spell = spell
    }

    -- 1/3 de chance de aplicar Paralyze
    if math.random(1, 3) == 1 then
        ret.cond = "Paralyze"
    end

    -- Disparo visual do projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)

    -- Aplica dano com chance de condição
    addEvent(doMoveDano2, 100, cid, target, BUGDAMAGE, -min, -max, ret, spell)

    return true
end

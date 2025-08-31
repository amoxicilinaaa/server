function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Projétil visual do caster até o alvo (ID 16)
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 16)

    -- Parâmetros da condição "Stun"
    local ret = {
        id = target,
        cd = 9,
        check = getPlayerStorageValue(target, conds["Stun"]),
        eff = 147,
        spell = spell,
        cond = "Stun"
    }

    -- Aplica dano tipo NORMAL com efeito visual e condição "Stun"
    addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

    return true
end
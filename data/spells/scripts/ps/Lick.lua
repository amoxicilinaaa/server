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

    -- Parâmetros da condição "Stun"
    local ret = {
        id = target,
        cd = 9,
        check = getPlayerStorageValue(target, conds["Stun"]),
        eff = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Efeito visual de impacto (ID 145)
    doSendMagicEffect(getThingPosWithDebug(target), 145)

    -- Aplica dano tipo NORMAL com condição "Stun"
    addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)

    return true
end
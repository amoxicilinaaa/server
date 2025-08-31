function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Verifica se o alvo está dormindo
    if not isSleeping(target) then
        -- Feedback visual e texto animado de falha
        local posT = getThingPosWithDebug(target)
        doSendMagicEffect(posT, 3)
        doSendAnimatedText(posT, "FAIL", 155)
        return true
    end

    -- Aplica dano tipo GHOST com efeito visual 138
    doDanoWithProtectWithDelay(cid, target, ghostDmg, -min, -max, 138)

    return true
end
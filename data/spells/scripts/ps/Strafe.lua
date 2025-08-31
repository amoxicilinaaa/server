function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC  = getThingPosWithDebug(cid)

    -- Configuração do buff
    local ret = {
        id    = cid,
        cd    = 15,
        eff   = (spell == "Speed Boost") and 782 or 14,
        check = 0,
        buff  = spell,
        first = true
    }

    -- Aplica o buff
    doCondition2(ret)

    if spell == "Speed Boost" then
        -- Efeito visual especial
        doSendMagicEffect(posC, 29)

        -- Manipulação de velocidade temporária
        doChangeSpeed(cid, getCreatureSpeed(cid)) -- pode ser ajustado para +400 se quiser
        addEvent(doRegainSpeed, 6450, cid)
    end

    return true
end

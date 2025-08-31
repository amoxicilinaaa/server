function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Verifica criaturas na área 1x1 ao redor
    local uidList = checkAreaUid(getThingPos(cid), check, 1, 1)

    for _, pid in pairs(uidList) do
        if isCreature(cid) and isCreature(pid) and pid ~= cid then
            -- Cancela se for player com summon ativo
            if isPlayer(pid) and #getCreatureSummons(pid) >= 1 then
                return false
            end

            local lifeBefore = getCreatureHealth(pid)

            -- Aplica dano tipo Grass
            doAreaCombatHealth(cid, GRASSDAMAGE, getThingPos(pid), 0, -min, -max, 14)

            local lifeAfter = getCreatureHealth(pid)
            local damageDone = lifeBefore - lifeAfter

            -- Efeito visual no caster
            doSendMagicEffect(getThingPos(cid), 14)

            -- Cura proporcional ao dano causado
            if damageDone >= 1 then
                doCreatureAddHealth(cid, damageDone)
                doSendAnimatedText(getThingPos(cid), "+" .. damageDone, 32)
            end
        end
    end

    return true
end

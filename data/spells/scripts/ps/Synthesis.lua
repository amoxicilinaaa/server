function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Define intervalo de cura com base na vida máxima
    local min = (getCreatureMaxHealth(cid) * 45) / 100
    local max = (getCreatureMaxHealth(cid) * 60) / 100

    -- Função que aplica cura e exibe texto animado
    local function doHealArea(cid, min, max)
        if not isCreature(cid) then return true end

        local amount = math.random(min, max)
        local current = getCreatureHealth(cid)
        local maxHp = getCreatureMaxHealth(cid)

        if current < maxHp then
            if (current + amount) > maxHp then
                amount = maxHp - current
            end
            doCreatureAddHealth(cid, amount)
            doSendAnimatedText(getThingPosWithDebug(cid), "+" .. amount, 65)
        end
    end

    -- Efeito visual de cura
    doSendMagicEffect(getThingPosWithDebug(cid), 103)

    -- Executa cura
    doHealArea(cid, min, max)

    return true
end

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Define intervalo de cura proporcional ao HP máximo
    local min = math.floor(getCreatureMaxHealth(cid) * 0.45)
    local max = math.floor(getCreatureMaxHealth(cid) * 0.60)

    -- Função auxiliar para aplicar cura
    local function doHealArea(cid, min, max)
        if not isCreature(cid) then return end

        local current = getCreatureHealth(cid)
        local maxhp = getCreatureMaxHealth(cid)
        local amount = math.random(min, max)

        -- Ajusta para não ultrapassar o HP máximo
        if current + amount > maxhp then
            amount = maxhp - current
        end

        if current < maxhp then
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
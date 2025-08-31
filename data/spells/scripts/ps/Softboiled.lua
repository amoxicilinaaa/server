function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    local posC  = getThingPosWithDebug(cid)
    local posC1 = {x = posC.x + 1, y = posC.y, z = posC.z}

    -- Cálculo da cura proporcional
    local min = math.floor(getCreatureMaxHealth(cid) * 0.65)
    local max = math.floor(getCreatureMaxHealth(cid) * 0.85)

    -- Função que aplica a cura
    local function doHealArea(cid, min, max)
        if not isCreature(cid) then return end

        local amount = math.random(min, max)
        local current = getCreatureHealth(cid)
        local maxHp = getCreatureMaxHealth(cid)

        if current + amount > maxHp then
            amount = maxHp - current
        end

        if current < maxHp then
            if spell == "Recover" then
                local amountRecover = math.floor(amount / 3)

                -- Tick 1
                doCreatureAddHealth(cid, amountRecover)
                doSendAnimatedText(posC, "+" .. amountRecover, 65)

                -- Tick 2
                addEvent(doCreatureAddHealth, 1000, cid, amountRecover)
                addEvent(doSendAnimatedText, 1000, posC, "+" .. amountRecover, 65)
                addEvent(doSendMagicEffect, 1000, posC1, 132)

                -- Tick 3
                addEvent(doCreatureAddHealth, 2100, cid, amountRecover)
                addEvent(doSendAnimatedText, 2100, posC, "+" .. amountRecover, 65)
                addEvent(doSendMagicEffect, 2100, posC1, 132)
            else
                doCreatureAddHealth(cid, amount)
                doSendAnimatedText(posC, "+" .. amount, 65)
            end
        end
    end

    -- Efeito visual inicial
    if spell == "Restore" then
        doSendMagicEffect(posC1, 621)
    else
        doSendMagicEffect(posC, 132)
    end

    -- Executa cura
    doHealArea(cid, min, max)

    return true
end

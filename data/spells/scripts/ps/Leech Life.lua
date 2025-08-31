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

    -- Captura vida atual do alvo antes do dano
    local life = getCreatureHealth(target)

    -- Aplica dano tipo BUG com efeito visual 14
    addEvent(doDanoWithProtect, 70, cid, BUGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 14)

    -- Efeitos visuais no alvo e no caster
    addEvent(doSendMagicEffect, 70, getThingPosWithDebug(target), 7)   -- impacto no alvo
    addEvent(doSendMagicEffect, 80, getThingPosWithDebug(cid), 637)   -- aura no caster

    -- Calcula vida drenada após o dano
    local function applyDrain()
        if not isCreature(cid) or not isCreature(target) then return end
        local newlife = life - getCreatureHealth(target)
        if newlife >= 1 then
            doCreatureAddHealth(cid, newlife)
            doSendAnimatedText(getThingPosWithDebug(cid), "+" .. newlife, 32)
        end
    end

    -- Aplica cura proporcional com delay
    addEvent(applyDrain, 79)

    return true
end
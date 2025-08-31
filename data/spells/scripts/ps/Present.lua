function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Função auxiliar para cura com efeito visual e texto
    local function sendHeal(cid)
        if isCreature(cid) and isCreature(target) then
            doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), crusher, min, max, 5)
            doSendAnimatedText(getThingPosWithDebug(target), "HEALTH!", 65)
        end
    end

    -- Projétil visual do caster até o alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 31)

    -- 90% de chance de causar dano, 10% de chance de curar
    if math.random(1, 100) >= 10 then
        doDanoWithProtectWithDelay(cid, target, NORMALDAMAGE, min, max, 5, crusher)
    else
        addEvent(sendHeal, 100, cid)
    end

    return true
end
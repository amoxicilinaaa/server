function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local master  = getCreatureMaster(cid)

    -- Verifica se há múltiplos summons e se o alvo é válido
    if #getCreatureSummons(master) < 2 or not isCreature(target) then return true end

    local summons = getCreatureSummons(master)
    local posis   = {}
    local eff     = 42 -- padrão

    -- Define efeito visual conforme forma do alvo
    local subName = getSubName(cid, target)
    if subName == "Scyther" then
        eff = 163
    elseif subName == "Shiny Scyther" then
        eff = 164
    end

    -- Executa ataque coordenado
    if isCreature(cid) then
        -- Dano principal com valor fixo
        addEvent(doDanoInTarget, 500, cid, target, BUGDAMAGE, -5000, -5000, 0)

        for i = 1, #summons do
            posis[i] = getThingPosWithDebug(summons[i])

            -- Desaparecimento temporário e paralisação
            doDisapear(summons[i])
            stopNow(summons[i], 670)

            -- Efeitos visuais e disparos cruzados
            addEvent(doSendMagicEffect, 300, posis[i], 211)
            addEvent(doSendDistanceShoot, 350, posis[i], getThingPosWithDebug(target), eff)
            addEvent(doSendDistanceShoot, 450, getThingPosWithDebug(target), posis[i], eff)
            addEvent(doSendDistanceShoot, 600, posis[i], getThingPosWithDebug(target), eff)
            addEvent(doSendDistanceShoot, 650, getThingPosWithDebug(target), posis[i], eff)

            -- Reaparecimento sincronizado
            addEvent(doAppear, 670, summons[i])
        end
    end

    return true
end

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

    local pos = getThingPosWithDebug(target)

    -- Define efeito visual condicional para Rapidash com storage ativo
    local eff
    if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then
        eff = 721
    else
        eff = 389
    end

    -- Aplica dano tipo FIRE com delay
    addEvent(doDanoInTargetWithDelay, 50, cid, target, FIREDAMAGE, min, max)

    -- Efeito visual próximo ao alvo
    addEvent(doSendMagicEffect, 20, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, eff)

    return true
end
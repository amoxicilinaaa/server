function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Áreas circulares de impacto
    local areas1 = {Wheel1, Wheel2, Wheel3, Wheel4, Wheel5, Wheel6, Wheel7, Wheel8, Wheel1}

    -- Função que aplica dano em área com verificação de status
    local function hurricane(cid, areaDmg)
        if not isCreature(cid) then return true end
        if isSleeping(cid) and getPlayerStorageValue2(cid, 3644587) >= 1 then return false end
        if isWithFear(cid) and getPlayerStorageValue2(cid, 3644587) >= 1 then return true end

        doMoveInArea2(cid, 78, areaDmg, FLYINGDAMAGE, min, max, spell)
    end

    -- Executa múltiplas ondas com delay crescente
    for i = 0, 8 do
        addEvent(hurricane, i * 350, cid, areas1[i + 1])
    end

    return true
end

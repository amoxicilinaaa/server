function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Parâmetros da condição "Paralyze"
    local ret = {
        id    = 0,
        cd    = 2,
        eff   = 207,
        check = 0,
        spell = spell,
        cond  = "Paralyze"
    }

    -- Função que aplica dano e condição em área
    local function smoke(cid)
        if not isCreature(cid) then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        -- Efeito visual elétrico
        doMoveInArea2(cid, 433, electricTerrain3, ELECTRICDAMAGE, 0, 0)

        -- Aplicação da condição "Paralyze"
        doMoveInArea2(cid, 0, confusion, ELECTRICDAMAGE, 0, 0, spell, ret)
    end

    -- Ativa storage temporário para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 1000, cid, 3644587, -1)

    -- Executa múltiplos pulsos com delay
    for i = 0, 8 do
        addEvent(smoke, i * 650, cid)
    end

    return true
end
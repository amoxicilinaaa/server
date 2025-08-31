function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    -- Parâmetros da condição "Miss"
    local ret = {
        id    = 0,
        cd    = 9,
        eff   = 501,
        check = 0,
        spell = spell,
        cond  = "Miss"
    }

    -- Função que aplica dano e condição em área
    local function smoke(cid)
        if not isCreature(cid) then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        doMoveInArea2(cid, 501, confusion, NORMALDAMAGE, 0, 0, spell, ret)
    end

    -- Ativa storage temporário para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 1000, cid, 3644587, -1)

    -- Executa múltiplas ondas de névoa com delay
    for i = 0, 3 do
        addEvent(smoke, i * 500, cid)
    end

    return true
end
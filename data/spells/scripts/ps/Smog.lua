function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    local eff = 731 -- efeito visual principal

    -- Ativa storage temporário para controle de estado
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)

    -- Função que aplica dano e condições em área
    local function doQuake(cid)
        if not isCreature(cid) then return false end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        -- Condição "Slow"
        local ret = {
            id    = 0,
            cd    = 9,
            eff   = eff,
            check = 0,
            first = true,
            cond  = "Slow",
            spell = spell
        }

        -- Condição "Poison"
        local ret2 = {
            id    = 0,
            cd    = 9,
            eff   = 0,
            check = 0,
            first = true,
            cond  = "Poison",
            spell = spell
        }

        -- Aplica dano com condição "Slow"
        doMoveInArea2(cid, eff, selfArea1, POISONDAMAGE, min, max, spell, ret)

        -- Aplica condição "Poison" sem dano adicional
        doMoveInArea2(cid, 0, selfArea1, POISONDAMAGE, 0, 0, spell, ret2)
    end

    -- Sequência de tremores com delay
    local times = {0, 700, 1400, 2100, 2800, 3500, 4200, 4900}
    for i = 1, #times do
        addEvent(doQuake, times[i], cid)
    end

    return true
end

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max
    local eff   = 622

    -- Intervalos de execução dos pulsos
    local times = {0, 700, 1400, 2100, 2800, 3500, 4200}

    -- Função que aplica dano em duas áreas com condição "Slow"
    local function doQuake(cid)
        if not isCreature(cid) then return true end

        local ret = {
            id    = 0,
            cd    = 9,
            eff   = 34,
            check = 0,
            first = true,
            cond  = "Slow",
            spell = spell
        }

        doMoveInArea2(cid, eff, swampMist, POISONDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, 400, cid, eff, swampMist2, POISONDAMAGE, min, max, spell, ret)
    end

    -- Ativa proteção temporária contra sobreposição
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)

    -- Executa os pulsos em sequência
    for i = 1, #times do
        addEvent(doQuake, times[i], cid)
    end

    return true
end

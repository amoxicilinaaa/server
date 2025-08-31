function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    -- Parâmetros da condição "Miss"
    local ret = {
        id    = 0,
        cd    = 9,
        eff   = 731,
        check = 0,
        spell = spell,
        cond  = "Miss"
    }

    -- Efeitos ascendentes antes da queda
    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, 6)
    end

    -- Função que executa a queda de veneno
    local function doFall(cid)
        if not isCreature(cid) then return end
        for rocks = 1, 42 do
            local effect = (spell == "Venoshock") and 994 or 845
            addEvent(fall, rocks * 35, cid, master, POISONDAMAGE, 6, effect)
        end
    end

    -- Executa queda e dano em área com delay
    addEvent(doFall, 450, cid)
    addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, POISONDAMAGE, min, max, spell, ret)

    return true
end

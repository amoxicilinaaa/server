function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local master = getCreatureMaster(cid) or 0

    local ret = {
        id = 0,
        cd = 9,
        eff = 0,
        check = 0,
        spell = spell,
        cond = nil
    }

    local dano = NORMALDAMAGE -- fallback
    local eff = 0

    if spell == "Ground Elevation" then
        dano = GROUNDDAMAGE
        eff = 494

        -- Execução dos ataques em sequência
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret)
        addEvent(doMoveInArea2, 1600, cid, 0, BigArea2, dano, min, max, spell, ret)

        -- Alternativa: usar área menor se quiser variar
        -- addEvent(doMoveInArea2, 500, cid, 0, BigArea1, dano, min, max, spell, ret)
    else
        -- Execução padrão para outras spells
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret)
    end

    return true
end

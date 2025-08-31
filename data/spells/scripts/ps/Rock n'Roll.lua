function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    local pos = getThingPosWithDebug(cid)

    -- Áreas sequenciais em espiral
    local areas = {rock1, rock2, rock3, rock4, rock5, rock4, rock3, rock2, rock1}

    -- Parâmetros da condição "Miss"
    local ret = {
        id = 0,
        cd = 9,
        eff = 1,
        check = 0,
        spell = spell,
        cond = "Miss"
    }

    -- Executa dano e efeito visual em sequência
    for i = 0, 8 do
        local delay = i * 400
        addEvent(doMoveInArea2, delay, cid, 1, areas[i + 1], NORMALDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, delay + 10, cid, 1, areas[i + 1], NORMALDAMAGE, 0, 0, spell)
    end

    return true
end
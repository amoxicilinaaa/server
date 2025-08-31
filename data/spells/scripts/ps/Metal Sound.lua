function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Áreas sequenciais para varredura
    local areas = {rock1, rock2, rock3, rock4, rock5, rock4, rock3, rock2, rock1}

    for i = 0, 8 do
        -- Varredura em área com delay progressivo
        addEvent(doMoveInArea2, i * 400, cid, 499, areas[i + 1], STEELDAMAGE, min, max, spell)

        -- Impacto central imediato (executado a cada ciclo)
        doMoveInArea2(cid, 499, selfArea1, STEELDAMAGE, min, max, spell, ret)

        -- Reforço visual ou dano com leve atraso
        addEvent(doMoveInArea2, i * 410, cid, 499, areas[i + 1], STEELDAMAGE, min, max, spell)
    end

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    local pos = getThingPosWithDebug(cid)

    -- Áreas em sequência para múltiplas ondas
    local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}

    -- Executa dano em ondas com delay crescente
    for i = 0, 9 do
        addEvent(doMoveInArea2, i * 400, cid, 140, areas[i + 1], GHOSTDAMAGE, min, max, spell)
    end

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Define efeito visual conforme forma do alvo
    local eff2 = 48
    local subName = getSubName(cid, target)
    if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, subName) then
        eff2 = 641
    elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        eff2 = 979
    end

    -- Parâmetros da condição "Stun"
    local ret = {
        id    = 0,
        cd    = 9,
        eff   = eff2,
        check = 0,
        spell = spell,
        cond  = "Stun"
    }

    local areas = {
        rock5, rock4, rock3, rock2, rock1,
        rock5, rock4, rock3, rock2, rock1,
        rock5, rock4, rock3, rock2, rock1
    }

    -- Executa 15 impactos em sequência com delay progressivo
    for i = 0, 14 do
        addEvent(doMoveInArea2, i * 320, cid, eff2, areas[i + 1], ELECTRICDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, i * 330, cid, eff2, areas[i + 1], ELECTRICDAMAGE, 0, 0, spell)
    end

    return true
end

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max
    local ret   = spellData.ret or {}

    local pos = getThingPosWithDebug(cid)

    -- Áreas e efeitos visuais em sequência
    local areas = {rock1, rock2, rock3, rock1, rock2, rock3}
    local effarea = {514, 515, 513, 514, 515, 513}

    -- Executa dano em ondas com delay crescente
    for i = 0, 5 do
        local delay = i * 320
        addEvent(doMoveInArea2, delay, cid, effarea[i + 1], areas[i + 1], FIREDAMAGE, min, max, spell, ret)
    end

    return true
end

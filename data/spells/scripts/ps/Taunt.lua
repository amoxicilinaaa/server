function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local p     = getThingPosWithDebug(cid)

    -- Condição 1: Silence
    local ret = {
        id    = 0,
        cd    = 6,
        check = 0,
        eff   = 136,
        cond  = "Silence",
        spell = spell
    }

    -- Condição 2: Slow
    local ret2 = {
        id    = 0,
        cd    = 6,
        check = 0,
        eff   = 0,
        cond  = "Slow",
        spell = spell
    }

    -- Cura de status da ball se for summon
    if isSummon(cid) then
        local ball = getPlayerSlotItem(getCreatureMaster(cid), 8)
        doCureBallStatus(ball.uid, "all")
    end

    -- Cura de status do próprio Pokémon
    doCureStatus(cid, "all")

    -- Ativa foco
    setPlayerStorageValue(cid, 253, 1)

    -- Áreas de impacto sequencial
    local areas = {
        rock5, rock4, rock3, rock2, rock1,
        rock5, rock4, rock3, rock2, rock1,
        rock5, rock4, rock3, rock2, rock1
    }

    -- Executa os impactos com delay e alternância de condição
    for i = 0, 14 do
        addEvent(doMoveInArea2, i * 320, cid, 678, areas[i + 1], NORMALDAMAGE, 0, 0, spell, ret)
        addEvent(doMoveInArea2, i * 330, cid, 678, areas[i + 1], NORMALDAMAGE, 0, 0, spell, ret2)
        doSendMagicEffect({x = p.x, y = p.y - 1, z = p.z}, 669)
    end

    return true
end

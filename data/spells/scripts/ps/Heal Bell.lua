function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Remove todas as condições negativas do caster e da ball
    if isSummon(cid) then
        doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
    end
    doCureStatus(cid, "all")

    -- Define múltiplas áreas de impacto
    local areas = {
        rock1, rock2, rock3, rock4, rock5,
        rock1, rock2, rock3, rock4, rock5,
        rock1, rock2, rock3, rock4, rock5,
        rock1, rock2, rock3, rock4, rock5,
        rock1, rock2, rock3, rock4, rock5
    }

    -- Parâmetros do buff
    local ret = {
        id = cid,
        cd = 10,
        eff = 0,
        check = 0,
        buff = spell,
        first = true
    }

    -- Aplica o buff via sistema de condição
    doCondition2(ret)

    -- Executa múltiplos impactos em sequência com delay progressivo
    for i = 0, 22 do
        addEvent(doMoveInArea2, i * 400, cid, 33, areas[i + 1], NORMALDAMAGE, 0, 0, spell)
    end

    return true
end
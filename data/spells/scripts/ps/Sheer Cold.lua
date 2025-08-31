function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max
    local posC1  = {x = getThingPosWithDebug(cid).x + 1, y = getThingPosWithDebug(cid).y, z = getThingPosWithDebug(cid).z}

    -- Efeito visual inicial
    doSendMagicEffect(posC1, 577)

    -- Paralisa temporariamente
    stopNow(cid, 1550)

    -- Storage temporário para controle de efeitos
    setPlayerStorageValue(cid, 5000001, 1)
    addEvent(setPlayerStorageValue, 1210, cid, 32698, 1)
    addEvent(setPlayerStorageValue, 1220, cid, 32698, -1)
    addEvent(setPlayerStorageValue, 3001, cid, 5000001, -1)

    -- Aplicação de buff com doCondition2
    local ret = {
        id = cid,
        cd = 2,
        eff = 0,
        check = 0,
        buff = spell,
        first = true
    }
    doCondition2(ret)

    -- Primeira explosão de gelo na área confusion
    doMoveInArea2(cid, 578, confusion, ICEDAMAGE, min, max, spell)

    -- Ondas sequenciais com dano e efeito visual
    local areas = {rock1, rock2, rock3, rock4, rock5}
    local delays = {10, 310, 610, 910, 1210}

    for i = 1, #areas do
        local area = areas[i]
        local delay = delays[i]

        addEvent(doMoveInArea2, delay, cid, 578, area, ICEDAMAGE, -min, -max, spell, ret2)
        addEvent(doDanoWithProtectWithDelay, 10, cid, area, ICEDAMAGE, min, max, 578)
    end

    return true
end

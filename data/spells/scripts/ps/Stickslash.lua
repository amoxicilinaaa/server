function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    -- Função que aplica dano em uma direção específica
    local function sendStickEff(cid, dir)
        if not isCreature(cid) then return true end
        local pos = getPosByDir(getThingPosWithDebug(cid), dir)
        doAreaCombatHealth(cid, FLYINGDAMAGE, pos, 0, -min, -max, 212)
    end

    -- Função que dispara em várias direções com delay
    local function doStick(cid)
        if not isCreature(cid) then return true end
        local directions = {
            [1] = SOUTHWEST,
            [2] = SOUTH,
            [3] = SOUTHEAST,
            [4] = EAST,
            [5] = NORTHEAST,
            [6] = NORTH,
            [7] = NORTHWEST,
            [8] = WEST,
            [9] = SOUTHWEST
        }

        for a = 1, 9 do
            addEvent(sendStickEff, a * 140, cid, directions[a])
        end
    end

    -- Executa o ataque radial
    doStick(cid)

    return true
end

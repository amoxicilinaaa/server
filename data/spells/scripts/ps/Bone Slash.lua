dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Função para aplicar dano em uma direção específica
    local function sendStickEff(cid, dir)
        if not isCreature(cid) then return end
        local pos = getPosByDir(getThingPosWithDebug(cid), dir)
        doAreaCombatHealth(cid, GROUNDDAMAGE, pos, 0, -min, -max, 227)
    end

    -- Executa golpes em 360° com delay crescente
    local function doStick(cid)
        if not isCreature(cid) then return end
        local directions = {
            SOUTHWEST, SOUTH, SOUTHEAST,
            EAST, NORTHEAST, NORTH,
            NORTHWEST, WEST, SOUTHWEST
        }
        for i = 1, #directions do
            addEvent(sendStickEff, i * 140, cid, directions[i])
        end
    end

    doStick(cid)

    return true
end
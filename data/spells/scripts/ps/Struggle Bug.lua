function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max
    local posC1  = {x = getThingPosWithDebug(cid).x + 1, y = getThingPosWithDebug(cid).y, z = getThingPosWithDebug(cid).z}

    -- Função que aplica dano em uma direção específica
    local function sendFireEff(cid, dir)
        if not isCreature(cid) then return true end

        local posDir = getPosByDir(getThingPosWithDebug(cid), dir)

        if spell == "Struggle Bug" then
            doDanoWithProtect(cid, BUGDAMAGE, posDir, 0, -min, -max, 105)
        else
            doDanoWithProtect(cid, STEELDAMAGE, getPosByDir(posC1, dir), 0, 0, 0, 537) -- efeito visual
            doDanoWithProtect(cid, STEELDAMAGE, posDir, 0, -min, -max, 0) -- dano real
        end
    end

    -- Função que executa o giro de ataques
    local function doWheel(cid)
        if not isCreature(cid) then return true end
        local directions = {
            SOUTH, SOUTHEAST, EAST, NORTHEAST,
            NORTH, NORTHWEST, WEST, SOUTHWEST
        }

        for a = 1, #directions do
            addEvent(sendFireEff, a * 200, cid, directions[a])
        end
    end

    -- Executa o giro de impacto
    doWheel(cid)

    return true
end

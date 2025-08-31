function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    local p = getThingPos(cid)
    local pa = {x = p.x + 1, y = p.y, z = p.z}

    -- Áreas em espiral
    local pos1 = {
        [1] = {{x = p.x, y = p.y+4, z = p.z}, {x = p.x+1, y = p.y+4, z = p.z}, {x = p.x+2, y = p.y+3, z = p.z}, {x = p.x+3, y = p.y+2, z = p.z}, {x = p.x+4, y = p.y+1, z = p.z}, {x = p.x+4, y = p.y, z = p.z}},
        [2] = {{x = p.x, y = p.y+3, z = p.z}, {x = p.x+1, y = p.y+3, z = p.z}, {x = p.x+2, y = p.y+2, z = p.z}, {x = p.x+3, y = p.y+1, z = p.z}, {x = p.x+3, y = p.y, z = p.z}},
    }
    local pos2 = {
        [1] = {{x = p.x, y = p.y-4, z = p.z}, {x = p.x-1, y = p.y-4, z = p.z}, {x = p.x-2, y = p.y-3, z = p.z}, {x = p.x-3, y = p.y-2, z = p.z}, {x = p.x-4, y = p.y-1, z = p.z}, {x = p.x-4, y = p.y, z = p.z}},
        [2] = {{x = p.x, y = p.y-3, z = p.z}, {x = p.x-1, y = p.y-3, z = p.z}, {x = p.x-2, y = p.y-2, z = p.z}, {x = p.x-3, y = p.y-1, z = p.z}, {x = p.x-3, y = p.y, z = p.z}},
    }
    local pos3 = {
        [1] = {{x = p.x+4, y = p.y, z = p.z}, {x = p.x+4, y = p.y-1, z = p.z}, {x = p.x+3, y = p.y-2, z = p.z}, {x = p.x+2, y = p.y-3, z = p.z}, {x = p.x+1, y = p.y-4, z = p.z}, {x = p.x, y = p.y-4, z = p.z}},
        [2] = {{x = p.x+3, y = p.y, z = p.z}, {x = p.x+3, y = p.y-1, z = p.z}, {x = p.x+2, y = p.y-2, z = p.z}, {x = p.x+1, y = p.y-3, z = p.z}, {x = p.x, y = p.y-3, z = p.z}},
    }
    local pos4 = {
        [1] = {{x = p.x-4, y = p.y, z = p.z}, {x = p.x-4, y = p.y+1, z = p.z}, {x = p.x-3, y = p.y+2, z = p.z}, {x = p.x-2, y = p.y+3, z = p.z}, {x = p.x-1, y = p.y+4, z = p.z}, {x = p.x, y = p.y+4, z = p.z}},
        [2] = {{x = p.x-3, y = p.y, z = p.z}, {x = p.x-3, y = p.y+1, z = p.z}, {x = p.x-2, y = p.y+2, z = p.z}, {x = p.x-1, y = p.y+3, z = p.z}, {x = p.x, y = p.y+3, z = p.z}},
    }

    local pos1a = pos1
    local pos2a = pos2
    local pos3a = pos3
    local pos4a = pos4

    -- Define tipo de ataque e efeito visual por espécie
    local atk
    if isInArray({
        "Camerupt", "Typhlosion", "Magmar", "Magmortar",
        "Shiny Camerupt", "Shiny Typhlosion", "Shiny Magmar", "Shiny Magmortar", "Mega Camerupt"
    }, getCreatureName(cid)) then
        atk = {
            ["Lava Plume"] = {98, 712, FIREDAMAGE},
            ["Rash Scald"] = {98, 715, WATERDAMAGE}
        }
    else
        atk = {
            ["Lava Plume"] = {98, 713, FIREDAMAGE},
            ["Rash Scald"] = {98, 715, WATERDAMAGE}
        }
    end

    local fumaaCaa = (spell == "Rash Scald") and 854 or 255

    local function sendDano(cid, pos, eff, delay, min, max)
        if pos and isCreature(cid) then
            addEvent(doDanoWithProtect, delay, cid, atk[spell][3], pos, 0, -min, -max, eff)
        end
    end

    local function doTornado(cid)
        if not isCreature(cid) then return end
        for j = 1, 2 do
            for i = 1, 6 do
                sendDano(cid, pos1[j][i], atk[spell][2], i * 280, min, max)
                sendDano(cid, pos1[j][i], atk[spell][2], i * 290, 0, 0)

                sendDano(cid, pos2[j][i], atk[spell][2], i * 280, min, max)
                sendDano(cid, pos2[j][i], atk[spell][2], i * 290, 0, 0)

                sendDano(cid, pos3[j][i], atk[spell][2], i * 280, min, max)
                sendDano(cid, pos3[j][i], atk[spell][2], i * 290, 0, 0)

                sendDano(cid, pos4[j][i], atk[spell][2], i * 280, min, max)

                sendDano(cid, pos1a[j][i], fumaaCaa, i * 280, 0, 0)
                sendDano(cid, pos2a[j][i], fumaaCaa, i * 280, 0, 0)
                sendDano(cid, pos3a[j][i], fumaaCaa, i * 280, 0, 0)
            end
        end
    end

    for b = 0, 2 do
        addEvent(doTornado, b * 1250, cid)
        doSendMagicEffect(getThingPosWithDebug(cid), 854)
    end

    return true
end
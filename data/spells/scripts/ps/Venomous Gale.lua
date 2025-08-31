function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max
    local p      = getThingPosWithDebug(cid)

    -- Trajetórias em espiral
    local pos1 = {
        [1] = {{x=p.x, y=p.y+4, z=p.z}, {x=p.x+1, y=p.y+4, z=p.z}, {x=p.x+2, y=p.y+3, z=p.z}, {x=p.x+3, y=p.y+2, z=p.z}, {x=p.x+4, y=p.y+1, z=p.z}, {x=p.x+4, y=p.y, z=p.z}},
        [2] = {{x=p.x, y=p.y+3, z=p.z}, {x=p.x+1, y=p.y+3, z=p.z}, {x=p.x+2, y=p.y+2, z=p.z}, {x=p.x+3, y=p.y+1, z=p.z}, {x=p.x+3, y=p.y, z=p.z}},
        [3] = {{x=p.x, y=p.y+2, z=p.z}, {x=p.x+1, y=p.y+2, z=p.z}, {x=p.x+2, y=p.y+1, z=p.z}, {x=p.x+2, y=p.y, z=p.z}},
        [4] = {{x=p.x, y=p.y+1, z=p.z}, {x=p.x+1, y=p.y+1, z=p.z}, {x=p.x+1, y=p.y, z=p.z}},
    }

    local pos2 = {
        [1] = {{x=p.x, y=p.y-4, z=p.z}, {x=p.x-1, y=p.y-4, z=p.z}, {x=p.x-2, y=p.y-3, z=p.z}, {x=p.x-3, y=p.y-2, z=p.z}, {x=p.x-4, y=p.y-1, z=p.z}, {x=p.x-4, y=p.y, z=p.z}},
        [2] = {{x=p.x, y=p.y-3, z=p.z}, {x=p.x-1, y=p.y-3, z=p.z}, {x=p.x-2, y=p.y-2, z=p.z}, {x=p.x-3, y=p.y-1, z=p.z}, {x=p.x-3, y=p.y, z=p.z}},
        [3] = {{x=p.x, y=p.y-2, z=p.z}, {x=p.x-1, y=p.y-2, z=p.z}, {x=p.x-2, y=p.y-1, z=p.z}, {x=p.x-2, y=p.y, z=p.z}},
        [4] = {{x=p.x, y=p.y-1, z=p.z}, {x=p.x-1, y=p.y-1, z=p.z}, {x=p.x-1, y=p.y, z=p.z}},
    }

    local pos3 = {
        [1] = {{x=p.x+4, y=p.y, z=p.z}, {x=p.x+4, y=p.y-1, z=p.z}, {x=p.x+3, y=p.y-2, z=p.z}, {x=p.x+2, y=p.y-3, z=p.z}, {x=p.x+1, y=p.y-4, z=p.z}, {x=p.x, y=p.y-4, z=p.z}},
        [2] = {{x=p.x+3, y=p.y, z=p.z}, {x=p.x+3, y=p.y-1, z=p.z}, {x=p.x+2, y=p.y-2, z=p.z}, {x=p.x+1, y=p.y-3, z=p.z}, {x=p.x, y=p.y-3, z=p.z}},
        [3] = {{x=p.x+2, y=p.y, z=p.z}, {x=p.x+2, y=p.y-1, z=p.z}, {x=p.x+1, y=p.y-2, z=p.z}, {x=p.x, y=p.y-2, z=p.z}},
        [4] = {{x=p.x+1, y=p.y, z=p.z}, {x=p.x+1, y=p.y-1, z=p.z}, {x=p.x, y=p.y-1, z=p.z}},
    }

    local pos4 = {
        [1] = {{x=p.x-4, y=p.y, z=p.z}, {x=p.x-4, y=p.y+1, z=p.z}, {x=p.x-3, y=p.y+2, z=p.z}, {x=p.x-2, y=p.y+3, z=p.z}, {x=p.x-1, y=p.y+4, z=p.z}, {x=p.x, y=p.y+4, z=p.z}},
        [2] = {{x=p.x-3, y=p.y, z=p.z}, {x=p.x-3, y=p.y+1, z=p.z}, {x=p.x-2, y=p.y+2, z=p.z}, {x=p.x-1, y=p.y+3, z=p.z}, {x=p.x, y=p.y+3, z=p.z}},
        [3] = {{x=p.x-2, y=p.y, z=p.z}, {x=p.x-2, y=p.y+1, z=p.z}, {x=p.x-1, y=p.y+2, z=p.z}, {x=p.x, y=p.y+2, z=p.z}},
        [4] = {{x=p.x-1, y=p.y, z=p.z}, {x=p.x-1, y=p.y+1, z=p.z}, {x=p.x, y=p.y+1, z=p.z}},
    }

    -- Tabelas de efeitos

    local atk = {
        ["Electro Field"]   = {41, 207, ELECTRICDAMAGE},
        ["Petal Tornado"]   = {4, 728, GRASSDAMAGE},
        ["Rock Storm"]      = {11, 234, ROCKDAMAGE},
        ["Flame Circle"]    = {98, 6, FIREDAMAGE},
        ["Flare Blitz"]     = {3, 257, FIREDAMAGE},
        ["Waterfall"]       = {98, 155, WATERDAMAGE},
        ["Venomous Gale"]   = {98, 995, POISONDAMAGE},
    }

    local atk2 = {
        ["Electro Field"]   = {90, 751, ELECTRICDAMAGE},
        ["Petal Tornado"]   = {4, 728, GRASSDAMAGE},
        ["Rock Storm"]      = {11, 234, ROCKDAMAGE},
        ["Flame Circle"]    = {98, 6, FIREDAMAGE},
        ["Flare Blitz"]     = {57, 722, FIREDAMAGE},
        ["Waterfall"]       = {98, 155, WATERDAMAGE},
        ["Venomous Gale"]   = {98, 995, POISONDAMAGE},
    }

    -- Funções auxiliares
    local function sendDist(cid, pos1, pos2, eff, delay)
        if pos1 and pos2 and isCreature(cid) then
            addEvent(sendDistanceShootWithProtect, delay, cid, pos1, pos2, eff)
        end
    end

    local function sendDano(cid, pos, eff, delay, min, max)
        if pos and isCreature(cid) then
            local useAlt = isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) or getPlayerStorageValue(cid, 90177) >= 1
            local data = useAlt and atk2[spell] or atk[spell]
            addEvent(doDanoWithProtect, delay, cid, data[3], pos, 0, -min, -max, eff)
        end
    end

    -- Execução principal
    local function doTornado(cid)
        if not isCreature(cid) then return end
        local useAlt = isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) or getPlayerStorageValue(cid, 90177) >= 1
        local data = useAlt and atk2[spell] or atk[spell]

        for j = 1, 4 do
            for i = 1, 6 do
                local delay1 = i * 330
                local delay2 = i * 300
                local delay3 = i * 310

                -- Quadrante 1
                sendDist(cid, pos1[j][i], pos1[j][i+1], data[1], delay1)
                sendDano(cid, pos1[j][i], data[2], delay2, min, max)
                sendDano(cid, pos1[j][i], data[2], delay3, 0, 0)

                -- Quadrante 2
                sendDist(cid, pos2[j][i], pos2[j][i+1], data[1], delay1)
                sendDano(cid, pos2[j][i], data[2], delay2, min, max)
                sendDano(cid, pos2[j][i], data[2], delay3, 0, 0)

                -- Quadrante 3
                sendDist(cid, pos3[j][i], pos3[j][i+1], data[1], delay1 + 450)
                sendDano(cid, pos3[j][i], data[2], delay2 + 450, min, max)
                sendDano(cid, pos3[j][i], data[2], delay3 + 450, 0, 0)

                -- Quadrante 4
                sendDist(cid, pos4[j][i], pos4[j][i+1], data[1], delay1 + 450)
                sendDano(cid, pos4[j][i], data[2], delay2 + 450, min, max)
                sendDano(cid, pos4[j][i], data[2], delay3 + 450, 0, 0)
            end
        end
    end

    -- Inicia a espiral
    doTornado(cid)

    return true
end

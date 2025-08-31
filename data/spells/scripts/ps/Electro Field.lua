dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local p = getThingPos(cid)

    local pos1 = {
        [1] = {{x = p.x, y = p.y+4, z = p.z}, {x = p.x+1, y = p.y+4, z = p.z}, {x = p.x+2, y = p.y+3, z = p.z}, {x = p.x+3, y = p.y+2, z = p.z}, {x = p.x+4, y = p.y+1, z = p.z}, {x = p.x+4, y = p.y, z = p.z}},
        [2] = {{x = p.x, y = p.y+3, z = p.z}, {x = p.x+1, y = p.y+3, z = p.z}, {x = p.x+2, y = p.y+2, z = p.z}, {x = p.x+3, y = p.y+1, z = p.z}, {x = p.x+3, y = p.y, z = p.z}},
        [3] = {{x = p.x, y = p.y+2, z = p.z}, {x = p.x+1, y = p.y+2, z = p.z}, {x = p.x+2, y = p.y+1, z = p.z}, {x = p.x+2, y = p.y, z = p.z}},
        [4] = {{x = p.x, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y, z = p.z}},
    }

    local pos2 = {
        [1] = {{x = p.x, y = p.y-4, z = p.z}, {x = p.x-1, y = p.y-4, z = p.z}, {x = p.x-2, y = p.y-3, z = p.z}, {x = p.x-3, y = p.y-2, z = p.z}, {x = p.x-4, y = p.y-1, z = p.z}, {x = p.x-4, y = p.y, z = p.z}},
        [2] = {{x = p.x, y = p.y-3, z = p.z}, {x = p.x-1, y = p.y-3, z = p.z}, {x = p.x-2, y = p.y-2, z = p.z}, {x = p.x-3, y = p.y-1, z = p.z}, {x = p.x-3, y = p.y, z = p.z}},
        [3] = {{x = p.x, y = p.y-2, z = p.z}, {x = p.x-1, y = p.y-2, z = p.z}, {x = p.x-2, y = p.y-1, z = p.z}, {x = p.x-2, y = p.y, z = p.z}},
        [4] = {{x = p.x, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y, z = p.z}},
    }

    local pos3 = {
        [1] = {{x = p.x+4, y = p.y, z = p.z}, {x = p.x+4, y = p.y-1, z = p.z}, {x = p.x+3, y = p.y-2, z = p.z}, {x = p.x+2, y = p.y-3, z = p.z}, {x = p.x+1, y = p.y-4, z = p.z}, {x = p.x, y = p.y-4, z = p.z}},
        [2] = {{x = p.x+3, y = p.y, z = p.z}, {x = p.x+3, y = p.y-1, z = p.z}, {x = p.x+2, y = p.y-2, z = p.z}, {x = p.x+1, y = p.y-3, z = p.z}, {x = p.x, y = p.y-3, z = p.z}},
        [3] = {{x = p.x+2, y = p.y, z = p.z}, {x = p.x+2, y = p.y-1, z = p.z}, {x = p.x+1, y = p.y-2, z = p.z}, {x = p.x, y = p.y-2, z = p.z}},
        [4] = {{x = p.x+1, y = p.y, z = p.z}, {x = p.x+1, y = p.y-1, z = p.z}, {x = p.x, y = p.y-1, z = p.z}},
    }

    local pos4 = {
        [1] = {{x = p.x-4, y = p.y, z = p.z}, {x = p.x-4, y = p.y+1, z = p.z}, {x = p.x-3, y = p.y+2, z = p.z}, {x = p.x-2, y = p.y+3, z = p.z}, {x = p.x-1, y = p.y+4, z = p.z}, {x = p.x, y = p.y+4, z = p.z}},
        [2] = {{x = p.x-3, y = p.y, z = p.z}, {x = p.x-3, y = p.y+1, z = p.z}, {x = p.x-2, y = p.y+2, z = p.z}, {x = p.x-1, y = p.y+3, z = p.z}, {x = p.x, y = p.y+3, z = p.z}},
        [3] = {{x = p.x-2, y = p.y, z = p.z}, {x = p.x-2, y = p.y+1, z = p.z}, {x = p.x-1, y = p.y+2, z = p.z}, {x = p.x, y = p.y+2, z = p.z}},
        [4] = {{x = p.x-1, y = p.y, z = p.z}, {x = p.x-1, y = p.y+1, z = p.z}, {x = p.x, y = p.y+1, z = p.z}},
    }

    local atk = {
        ["Electro Field"] = {41, 207, ELECTRICDAMAGE},
        ["Petal Tornado"] = {4, 728, GRASSDAMAGE},
        ["Rock Storm"] = {11, 234, ROCKDAMAGE},
        ["Flame Circle"] = {98, 6, FIREDAMAGE},
        ["Flare Blitz"] = {3, 257, FIREDAMAGE},
        ["Waterfall"] = {98, 155, WATERDAMAGE},
        ["Venomous Gale"] = {98, 995, POISONDAMAGE},
    }

    local atk2 = {
        ["Electro Field"] = {90, 751, ELECTRICDAMAGE},
        ["Petal Tornado"] = {4, 728, GRASSDAMAGE},
        ["Rock Storm"] = {11, 234, ROCKDAMAGE},
        ["Flame Circle"] = {98, 6, FIREDAMAGE},
        ["Flare Blitz"] = {57, 722, FIREDAMAGE},
        ["Waterfall"] = {98, 155, WATERDAMAGE},
        ["Venomous Gale"] = {98, 995, POISONDAMAGE},
    }

    local function sendDist(cid, posi1, posi2, eff, delay)
        if posi1 and posi2 and isCreature(cid) then
            addEvent(sendDistanceShootWithProtect, delay, cid, posi1, posi2, eff)
        end
    end

    local function sendDano(cid, pos, eff, delay, damageType)
        if pos and isCreature(cid) then
            addEvent(doDanoWithProtect, delay, cid, damageType, pos, 0, -min, -max, eff)
        end
    end

    local function doTornado(cid, spellData)
        if not isCreature(cid) then return end

        local atkTable = atk
if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, spellData.target)) or getPlayerStorageValue(cid, 90177) >= 1 then
            atkTable = atk2
        end

        for j = 1, 4 do
            for i = 1, #pos1[j] - 1 do
                sendDist(cid, pos1[j][i], pos1[j][i+1], atkTable[spellData.spell][1], i * 330)
                sendDano(cid, pos1[j][i], atkTable[spellData.spell][2], i * 300, atkTable[spellData.spell][3])

                sendDist(cid, pos2[j][i], pos2[j][i+1], atkTable[spellData.spell][1], i * 330)
                sendDano(cid, pos2[j][i], atkTable[spellData.spell][2], i * 300, atkTable[spellData.spell][3])

                sendDist(cid, pos3[j][i], pos3[j][i+1], atkTable[spellData.spell][1], i * 330)
                sendDano(cid, pos3[j][i], atkTable[spellData.spell][2], i * 300, atkTable[spellData.spell][3])

                sendDist(cid, pos4[j][i], pos4[j][i+1], atkTable[spellData.spell][1], i * 330)
                sendDano(cid, pos4[j][i], atkTable[spellData.spell][2], i * 300, atkTable[spellData.spell][3])
            end
        end
    end

    if spell == "Electro Field" then
        addEvent(doMoveInArea2, 1000, cid, 0, electro, ELECTRICDAMAGE, 0, 0, spell, spellData)
    elseif spell == "Rock Storm" then
        addEvent(doMoveInArea2, 1000, cid, 0, electro, ROCKDAMAGE, 0, 0, spell, spellData)
    elseif spell == "Waterfall" then
        addEvent(doMoveInArea2, 800, cid, 0, electro, WATERDAMAGE, 0, 0, spell, spellData)
    elseif spell == "Venomous Gale" then
        local config = {
            Pull = function(cid)
                local pid = getSpectators(getThingPos(cid), 6, 6)
                if pid and #pid > 0 then
                    for i = 1, #pid do
                        if pid[i] ~= cid and ehMonstro(pid[i]) and not isInArray({"Abporygon", "Aporygon"}, getCreatureName(pid[i])) then
                            doTeleportThing(pid[i], getClosestFreeTile(cid, getThingPos(cid)))
                        end
                    end
                end
            end,
        }
        if isSummon(cid) then
            config.Pull(cid)
        end

        addEvent(doMoveInArea2, 50, cid, 0, dazeDano, POISONDAMAGE, 0, 0, spell, spellData)
        doSendMagicEffect(getThingPos(cid), 990)
        stopNow(cid, 3000)
        doDisapear(cid)
        addEvent(doAppear, 3000, cid)

        addEvent(function()
            if isCreature(cid) then
                if isSummon(cid) then
                    local oldpos = getThingPos(cid)
                    local oldlod = getCreatureLookDir(cid)
                    local master = getCreatureMaster(cid)
                    local pk = getCreatureSummons(master)[1]
                    doTeleportThing(pk, oldpos, false)
                    doCreatureSetLookDir(pk, oldlod)
                else
                    doAppear(cid)
                end
            end
        end, 4000)
    end

    if spell == "Flame Circle" then
        doTornado(cid, spellData)
    else
        for b = 0, 2 do
            if spell == "Waterfall" then
                addEvent(doTornado, b * 1200, cid, spellData)
            elseif spell == "Venomous Gale" then
                doSendMagicEffect(getThingPos(cid), 990)
                addEvent(doTornado, b * 400, cid, spellData)
            else
                addEvent(doTornado, b * 1500, cid, spellData)
            end
        end
    end

    return true
end
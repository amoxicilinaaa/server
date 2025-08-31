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




function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max
    local p      = getThingPos(cid)

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

    local ret = {
        id    = 0,
        cd    = 9,
        eff   = 731,
        check = 0,
        spell = spell,
        cond  = "Miss"
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

    local function doTornado(cid)
        if not isCreature(cid) then return end
        local useAlt = isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) or getPlayerStorageValue(cid, 90177) >= 1
        local data = useAlt and atk2[spell] or atk[spell]

        for j = 1, 4 do
            for i = 1, 6 do
                local delay1 = i * 330
                local delay2 = i * 300
                local delay3 = i * 310

                -- Quadrantes
                sendDist(cid, pos1[j][i], pos1[j][i+1], data[1], delay1)
                sendDano(cid, pos1[j][i], data[2], delay2, min, max)
                sendDano(cid, pos1[j][i], data[2], delay3, 0, 0)

                sendDist(cid, pos2[j][i], pos2[j][i+1], data[1], delay1)
                sendDano(cid, pos2[j][i], data[2], delay2, min, max)
                sendDano(cid, pos2[j][i], data[2], delay3, 0, 0)

                sendDist(cid, pos3[j][i], pos3[j][i+1], data[1], delay1 + 450)
                sendDano(cid, pos3[j][i], data[2], delay2 + 450, min, max)
                sendDano(cid, pos3[j][i], data[2], delay3 + 450, 0, 0)

                sendDist(cid, pos4[j][i], pos4[j][i+1], data[1], delay1 + 450)
                sendDano(cid, pos4[j][i], data[2], delay2 + 450, min, max)
                sendDano(cid, pos4[j][i], data[2], delay3 + 450, 0, 0)
            end
        end
    end

    -- Comportamento especial por spell
    if spell == "Electro Field" then
        addEvent(doMoveInArea2, 1000, cid, 0, electro, ELECTRICDAMAGE, 0, 0, spell, ret)
    elseif spell == "Rock Storm" then
        addEvent(doMoveInArea2, 1000, cid, 0, electro, ROCKDAMAGE, 0, 0, spell, ret)
    elseif spell == "Waterfall" then
        addEvent(doMoveInArea2, 800, cid, 0, electro, WATERDAMAGE, 0, 0, spell, ret)
    elseif spell == "Venomous Gale" then
        local function pullMonsters(cid)
            local pid = getSpectators(getThingPos(cid), 6, 6)
            if pid then
                for i = 1, #pid do
                    if pid[i] ~= cid and ehMonstro(pid[i]) and not isInArray({"Abporygon", "Aporygon"}, getCreatureName(pid[i])) then
                        doTeleportThing(pid[i], getClosestFreeTile(cid, getThingPos(cid)))
                    end
                end
            end
        end

        if isSummon(cid) then pullMonsters(cid) end

        addEvent(doMoveInArea2, 50, cid, 0, dazeDano, POISONDAMAGE, 0, 0, spell, ret)
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

    -- Execução do tornado
    if spell == "Flame Circlel" then
        doTornado(cid)
    else
        for b = 0, 2 do
            local delay = (spell == "Waterfall") and b * 1200 or (spell == "Venomous Gale") and b * 400 or b * 1500
            addEvent(doTornado, delay, cid)
        end
    end

    return true
end

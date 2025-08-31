dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)
    local posC = getThingPosWithDebug(cid)
    local posC1 = getThingPosWithDebug(cid)

    local t = {
        [0] = {364, {x = p.x + 1, y = p.y - 1, z = p.z}, 0, -5},
        [1] = {361, {x = p.x + 5, y = p.y + 1, z = p.z}, 5, 0},
        [2] = {363, {x = p.x + 1, y = p.y + 5, z = p.z}, 0, 5},
        [3] = {362, {x = p.x - 1, y = p.y + 1, z = p.z}, -5, 0},
    }

    local qualDano = DRAGONDAMAGE

    -- Spell-specific configurations
    local spellConfigs = {
        ["Mega Wing"] = {STEELDAMAGE, {595, 592, 593, 594}},
        ["Mach Punch"] = {FIGHTINGDAMAGE, {569, 568, 566, 567}},
        ["Shadow Sneak"] = {GHOSTDAMAGE, {686, 687, 689, 688}},
        ["Nuzzle"] = {ELECTRICDAMAGE, {589, 590, 588, 591}},
        ["Shadow Mist"] = {GHOSTDAMAGE, {675, 677, 676, 674}},
        ["Fenix Dash"] = {FIREDAMAGE, {865, 866, 867, 864}},
    }

    if spell == "Flash Kick" then
        local sub = getSubName(cid, target)
        if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, sub) then
            t = {
                [0] = {648, {x = p.x + 1, y = p.y - 1, z = p.z}, 0, -5},
                [1] = {650, {x = p.x + 5, y = p.y + 1, z = p.z}, 5, 0},
                [2] = {649, {x = p.x + 1, y = p.y + 5, z = p.z}, 0, 5},
                [3] = {647, {x = p.x - 1, y = p.y + 1, z = p.z}, -5, 0},
            }
        else
            t = {
                [0] = {658, {x = p.x + 1, y = p.y - 1, z = p.z}, 0, -5},
                [1] = {660, {x = p.x + 5, y = p.y + 1, z = p.z}, 5, 0},
                [2] = {659, {x = p.x + 1, y = p.y + 5, z = p.z}, 0, 5},
                [3] = {657, {x = p.x - 1, y = p.y + 1, z = p.z}, -5, 0},
            }
        end
        qualDano = FIGHTINGDAMAGE
    elseif spellConfigs[spell] then
        qualDano = spellConfigs[spell][1]
        local effects = spellConfigs[spell][2]
        for dir = 0, 3 do
            t[dir][1] = effects[dir + 1]
        end
    end

    -- Teleport logic
    local function doTeleportMe(cid, pos)
        if not isCreature(cid) then return true end
        if canWalkOnPos(pos, false, true, true, true, true) then
            doTeleportThing(cid, pos)
        end

        if spell == "Fenix Dash" then
            addEvent(doAppear, 450, cid)
        else
            doAppear(cid)
        end

        local megaName = getPlayerStorageValue(cid, storages.isMega)
        if megaName == "Mega Ampharos" then
            doPantinOutfit(cid, 0, megaName)
        elseif isMega(cid) then
            doSetCreatureOutfit(cid, {lookType = megasConf[megaName].out}, -1)
            checkOutfitMega(cid, megaName)
        end
    end

    -- Pre-teleport effects
    if spell == "Nuzzle" then
        doSendMagicEffect(posC, 355)
    end

    if spell == "Shadow Sneak" then
        doSendMagicEffect(posC1, 697)
        doMoveInArea2(cid, 0, reto5, qualDano, min, max, spell)
        addEvent(doSendMagicEffect, 30, t[a][2], t[a][1])
    else
        doMoveInArea2(cid, 0, triplo6, qualDano, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
    end

    -- Disappear and teleport
    local pos = getThingPos(cid)
    doSendMagicEffect(pos, 307)
    doDisapear(cid)

    pos.x = pos.x + t[a][3]
    pos.y = pos.y + t[a][4]

    addEvent(doTeleportMe, 300, cid, pos)

    return true
end

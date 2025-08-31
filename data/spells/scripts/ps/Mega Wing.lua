function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posC1 = spellData.posC1

    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)
    local t = {}
    local qualDano = DRAGONDAMAGE

    -- Define efeitos e deslocamento por spell
    if spell == "Mega Wing" then
        t = {
            [0] = {369, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5, 595, posC},
            [1] = {367, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0, 592, posC},
            [2] = {366, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5, 593, posC},
            [3] = {368, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0, 594, posC},
        }
        qualDano = STEELDAMAGE

    elseif spell == "Mach Punch" then
        t = {
            [0] = {569, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {568, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0},
            [2] = {566, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {567, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0},
        }
        qualDano = FIGHTINGDAMAGE

    elseif spell == "Shadow Sneak" then
        t = {
            [0] = {686, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {687, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0},
            [2] = {689, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {688, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0},
        }
        qualDano = GHOSTDAMAGE

    elseif spell == "Nuzzle" then
        t = {
            [0] = {589, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {590, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0},
            [2] = {588, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {591, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0},
        }
        qualDano = ELECTRICDAMAGE

    elseif spell == "Shadow Mist" then
        t = {
            [0] = {675, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {677, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0},
            [2] = {676, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {674, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0},
        }
        qualDano = GHOSTDAMAGE

    elseif spell == "Flash Kick" then
        if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then
            t = {
                [0] = {648, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                [1] = {650, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0},
                [2] = {649, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                [3] = {647, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0},
            }
        else
            t = {
                [0] = {658, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                [1] = {660, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0},
                [2] = {659, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                [3] = {657, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0},
            }
        end
        qualDano = FIGHTINGDAMAGE

    elseif spell == "Fenix Dash" then
        t = {
            [0] = {865, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {866, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0},
            [2] = {867, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {864, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0},
        }
        qualDano = FIREDAMAGE
    end

    -- Efeito de portal para Nuzzle
    if spell == "Nuzzle" then
        doSendMagicEffect(posC, 355)
    end

    -- Execução da spell
    if spell == "Shadow Sneak" then
        doSendMagicEffect(posC1, 697)
        doMoveInArea2(cid, 0, reto5, qualDano, min, max, spell)
        addEvent(doSendMagicEffect, 30, t[a][2], t[a][1])
    else
        doMoveInArea2(cid, 0, triplo6, qualDano, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
    end

    -- Desaparece e teleporta o caster
    local pos = getThingPos(cid)
    doSendMagicEffect(pos, 307)
    doDisapear(cid)

    pos.x = pos.x + t[a][3]
    pos.y = pos.y + t[a][4]
    addEvent(function()
        if not isCreature(cid) then return end
        if canWalkOnPos(pos, false, true, true, true, true) then
            doTeleportThing(cid, pos)
        end

        if spell == "Fenix Dash" then
            addEvent(doAppear, 450, cid)
        else
            doAppear(cid)
        end

        if getPlayerStorageValue(cid, storages.isMega) == "Mega Ampharos" then
            doPantinOutfit(cid, 0, getPlayerStorageValue(cid, storages.isMega))
        elseif isMega(cid) then
            doSetCreatureOutfit(cid, {lookType = megasConf[getPlayerStorageValue(cid, storages.isMega)].out}, -1)
            checkOutfitMega(cid, getPlayerStorageValue(cid, storages.isMega))
        end
    end, 300)

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    local posC = getThingPosWithDebug(cid)

    -- Função que dispara o feixe de energia
    local function ChargingBeam(cid)
        if not isCreature(cid) then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        local tab = {}
        for x = -2, 2 do
            for y = -2, 2 do
                local pos = getThingPosWithDebug(cid)
                pos.x = pos.x + x
                pos.y = pos.y + y
                if pos.x ~= getThingPosWithDebug(cid).x and pos.y ~= getThingPosWithDebug(cid).y then
                    table.insert(tab, pos)
                end
            end
        end
        doSendDistanceShoot(tab[math.random(#tab)], getThingPosWithDebug(cid), 37)
    end

    -- Função que executa o ataque principal
    local function useSolarBeam(cid)
        if not isCreature(cid) then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        local effect1, effect2, effect3, effect4, effect5 = 255, 255, 255, 255, 255
        local area = {}
        local pos1, pos2, pos3, pos4, pos5 = getThingPosWithDebug(cid), getThingPosWithDebug(cid), getThingPosWithDebug(cid), getThingPosWithDebug(cid), getThingPosWithDebug(cid)
        local dir = getCreatureLookDir(cid)

        if getSubName(cid, target) == "Mawile" then
            doFaceOpposite(cid)
            addEvent(doFaceOpposite, 748, cid)
        end

        if dir == 0 then -- norte
            effect1, effect2, effect3, effect4 = 36, 37, 37, 38
            pos1.x = pos1.x + 1; pos1.y = pos1.y - 1
            pos2.x = pos2.x + 1; pos2.y = pos2.y - 3
            pos3.x = pos3.x + 1; pos3.y = pos3.y - 4
            pos4.x = pos4.x + 1; pos4.y = pos4.y - 5
            area = solarn

        elseif dir == 1 then -- leste
            effect1, effect2, effect3, effect4, effect5 = 4, 10, 10, 10, 0
            pos1.x = pos1.x + 2; pos1.y = pos1.y + 1
            pos2.x = pos2.x + 3; pos2.y = pos2.y + 1
            pos3.x = pos3.x + 4; pos3.y = pos3.y + 1
            pos4.x = pos4.x + 5; pos4.y = pos4.y + 1
            pos5.x = pos5.x + 6; pos5.y = pos5.y + 1
            area = solare

        elseif dir == 2 then -- sul
            effect1, effect2, effect3, effect4 = 46, 50, 50, 59
            pos1.x = pos1.x + 1; pos1.y = pos1.y + 2
            pos2.x = pos2.x + 1; pos2.y = pos2.y + 3
            pos3.x = pos3.x + 1; pos3.y = pos3.y + 4
            pos4.x = pos4.x + 1; pos4.y = pos4.y + 5
            area = solars

        elseif dir == 3 then -- oeste
            effect1, effect2, effect3, effect4, effect5 = 115, 162, 162, 162, 163
            pos1.x = pos1.x - 1; pos1.y = pos1.y + 1
            pos2.x = pos2.x - 3; pos2.y = pos2.y + 1
            pos3.x = pos3.x - 4; pos3.y = pos3.y + 1
            pos4.x = pos4.x - 5; pos4.y = pos4.y + 1
            pos5.x = pos5.x - 6; pos5.y = pos5.y + 1
            area = solarw
        end

        -- Efeitos visuais
        for _, posEff in ipairs({{pos1, effect1}, {pos2, effect2}, {pos3, effect3}, {pos4, effect4}, {pos5, effect5}}) do
            if posEff[2] ~= 255 then
                doSendMagicEffect(posEff[1], posEff[2])
            end
        end

        -- Aplica dano em área
        doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), area, -min, -max, 255)
        doRegainSpeed(cid)
        setPlayerStorageValue(cid, 3644587, -1)
    end

    -- Início da spell
    doChangeSpeed(cid, -getCreatureSpeed(cid))
    setPlayerStorageValue(cid, 3644587, 1)
    doSendMagicEffect(posC, 629)
    addEvent(doSendMagicEffect, 720, posC, 728)
    addEvent(useSolarBeam, 680, cid)

    return true
end

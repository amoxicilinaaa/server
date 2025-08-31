dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) then return false end

    local posi = getThingPosWithDebug(cid)
    posi.x = posi.x + 1
    posi.y = posi.y + 1

    local rounds = math.random(9, 12)
    local area = {punish1, punish2, punish3, punish1, punish2, punish3, punish1, punish2, punish3}

    local roardirections = {
        [NORTH] = {SOUTH},
        [SOUTH] = {NORTH},
        [WEST]  = {EAST},
        [EAST]  = {WEST}
    }

    -- Função para empurrar inimigos com controle de velocidade
    local function divineBack(cid)
        if not isCreature(cid) then return end
        local uid = checkAreaUid(getCreaturePosition(cid), check, 1, 1)
        for _, pid in pairs(uid) do
            if pid ~= cid then
                local dirrr = getCreatureDirectionToTarget(pid, cid)
                local pushDir = roardirections[dirrr] and roardirections[dirrr][1]
                if pushDir then
                    if isSummon(cid) and (isMonster(pid) or (isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and canAttackOther(cid, pid) == "Can")) then
                        setPlayerStorageValue(pid, 654878, 1)
                        doChangeSpeed(pid, -getCreatureSpeed(pid))
                        doChangeSpeed(pid, 100)
                        doPushCreature(pid, pushDir, 1, 0)
                        doChangeSpeed(pid, -getCreatureSpeed(pid))
                        addEvent(setPlayerStorageValue, 6450, pid, 654878, -1)
                        addEvent(doRegainSpeed, 6450, pid)
                    elseif isMonster(cid) and (isSummon(pid) or (isPlayer(pid) and #getCreatureSummons(pid) <= 0)) then
                        setPlayerStorageValue(pid, 654878, 1)
                        doChangeSpeed(pid, -getCreatureSpeed(pid))
                        doChangeSpeed(pid, 100)
                        doPushCreature(pid, pushDir, 1, 0)
                        doChangeSpeed(pid, -getCreatureSpeed(pid))
                        addEvent(doRegainSpeed, 6450, pid)
                        addEvent(setPlayerStorageValue, 6450, pid, 654878, -1)
                    end
                end
            end
        end
    end

    -- Função para aplicar dano psíquico em múltiplas áreas com Confusion
    local function doDivine(cid, min, max, spell, rounds, area)
        if not isCreature(cid) then return end
        local ret = {
            id = 0,
            check = 0,
            cd = rounds,
            cond = "Confusion"
        }
        for i = 1, 9 do
            addEvent(doMoveInArea2, i * 500, cid, 137, area[i], psyDmg, min, max, spell, ret)
        end
    end

    -- Preparação: desaparece, aplica efeito visual e paralisa inimigos próximos
    setPlayerStorageValue(cid, 2365487, 1)
    addEvent(setPlayerStorageValue, 6450, cid, 2365487, -1)
    doDisapear(cid)
    doChangeSpeed(cid, -getCreatureSpeed(cid))
    doSendMagicEffect(posi, 247)
    addEvent(doAppear, 4450, cid)
    addEvent(doRegainSpeed, 6450, cid)

    local uid = checkAreaUid(getCreaturePosition(cid), check, 1, 1)
    for _, pid in pairs(uid) do
        if pid ~= cid then
            if isSummon(cid) and (isMonster(pid) or (isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and canAttackOther(cid, pid) == "Can")) then
                doChangeSpeed(pid, -getCreatureSpeed(pid))
            elseif isMonster(cid) and (isSummon(pid) or (isPlayer(pid) and #getCreatureSummons(pid) <= 0)) then
                doChangeSpeed(pid, -getCreatureSpeed(pid))
            end
        end
    end

    -- Execução dos efeitos
    addEvent(divineBack, 2100, cid)
    addEvent(doDivine, 2200, cid, min, max, spell, rounds, area)

    return true
end
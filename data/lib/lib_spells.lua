-- Lib_spells.lua

-- Função auxiliar: checa evasão passiva
local function checkEvasion(cid, target)
    if not ehMonstro(cid) or not isCreature(target) then return false end
    if not isInArray(specialabilities["evasion"], getCreatureName(target)) then return false end

    local master = getCreatureMaster(cid)
    if math.random(1, 100) <= passivesChances["Evasion"][getCreatureName(master)] then
        doSendMagicEffect(getThingPosWithDebug(target), 211)
        doSendAnimatedText(getThingPosWithDebug(target), "TOO BAD", 215)
        doTeleportThing(target, getClosestFreeTile(target, getThingPosWithDebug(cid)), false)
        doSendMagicEffect(getThingPosWithDebug(target), 211)
        doFaceCreature(target, getThingPosWithDebug(cid))
        return true
    end
    return false
end

-- Função auxiliar: calcula dano base
local function calculateDamage(cid, spell, movestable)
    local min, max = 0, 0
    if type(movestable) ~= 'table' or movestable.f == 0 then return min, max end

    local multiplier = 0.1
    local master = getCreatureMaster(cid)

    if isSummon(cid) and getPlayerClanName(master) ~= 'No Clan!' then
        if getPokeClan(master, getCreatureName(cid)) then
            local formula = isInArray({"Ironhard", "Raibolt", "Psycraft", "Volcanic"}, getPlayerClanName(master)) and 0.01 or 0.007
            multiplier = multiplier * tonumber(getPercentClan(master) + (getPlayerSkillLevel(master, 2) * formula))
        end
    end

    if getSpecialAttack(cid) then
        min = getSpecialAttack(cid) * movestable.f * multiplier
    end
    max = min + (isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid))

    if spell == "Selfdestruct" then
        min = getCreatureHealth(cid)
        max = getCreatureHealth(cid)
    end

    return min, max
end

-- Função auxiliar: aplica efeito de Focus
local function applyFocus(cid, min, max, movestable)
    if getPlayerStorageValue(cid, 253) >= 0 and type(movestable) == 'table' and movestable.f ~= 0 then
        min = min * 2
        max = max * 2
        setPlayerStorageValue(cid, 253, -1)
    end
    return min, max
end

-- Função auxiliar: checa sistema de miss
local function checkMissSystem(cid, spell)
    local miss = getPlayerStorageValue(cid, conds["Miss"])
    local confuse = getPlayerStorageValue(cid, conds["Confusion"])
    local stun = getPlayerStorageValue(cid, conds["Stun"])

    if miss >= 0 or confuse >= 0 or stun >= 0 then
        if not isInArray({"Aromateraphy", "Emergency Call", "Magical Leaf", "Sunny Day", "Safeguard", "Rain Dance"}, spell) and getPlayerStorageValue(cid, 21100) <= -1 then
            if math.random(1, 100) > 85 then
                doSendAnimatedText(getThingPosWithDebug(cid), "MISS", 215)
                return true
            end
        end
    end
    return false
end

-- Função auxiliar: retorna posições padrão
local function getSpellPositions(cid, target)
    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    local posC1 = {x = posC.x + 1, y = posC.y + 1, z = posC.z}
    local posT1 = {x = posT.x + 1, y = posT.y + 1, z = posT.z}

    return posC, posT, posC1, posT1
end

-- Função principal usada por todas as spells
function applyStandardSpellLogic(cid, var)
    local spell = var
    local target = 0
    local getDistDelay = 0

    if not isCreature(cid) or getCreatureHealth(cid) <= 0 then return nil end
    if isSleeping(cid) and getPlayerStorageValue(cid, 21100) <= -1 then return nil end

    if isCreature(getMasterTarget(cid)) then
        target = getMasterTarget(cid)
        getDistDelay = getDistanceBetween(getThingPosWithDebug(cid), getThingPosWithDebug(target)) * const_distance_delay
    end

    if isMonster(cid) and not isSummon(cid) then
        if getCreatureCondition(cid, CONDITION_EXHAUST) then return nil end
        doCreatureAddCondition(cid, wildexhaust)
    end

    local mydir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local movestable = getTableMove(cid, spell)

    if checkEvasion(cid, target) then return nil end

    if (isWithFear(cid) or isSilence(cid)) and getPlayerStorageValue(cid, 21100) <= -1 then
        return nil
    end

    local min, max = calculateDamage(cid, spell, movestable)
    min, max = applyFocus(cid, min, max, movestable)

    if not isSummon(cid) and not isInArray({"Demon Puncher", "Demon Kicker"}, spell) then
        doCreatureSay(cid, string.upper(spell).."!", TALKTYPE_MONSTER)
    end

    if isNpcSummon(cid) then
        local mnn = {" use ", " "}
        local use = mnn[math.random(#mnn)]
        doCreatureSay(getCreatureMaster(cid), getPlayerStorageValue(cid, 1007)..","..use..""..doCorrectString(spell).."!", 1)
    end

    if checkMissSystem(cid, spell) then return nil end

    ghostDmg = GHOSTDAMAGE
    psyDmg = PSYCHICDAMAGE
    if getPlayerStorageValue(cid, 999457) >= 1 and type(movestable) == 'table' and movestable.f ~= 0 then
        psyDmg = MIRACLEDAMAGE
        ghostDmg = DARK_EYEDAMAGE
        addEvent(setPlayerStorageValue, 50, cid, 999457, -1)
    end

    setPlayerStorageValue(cid, 21100, -1)
    if not isInArray({"Psybeam", "Sand Attack", "Flamethrower"}, spell) then
        setPlayerStorageValue(cid, 21101, -1)
    end
    setPlayerStorageValue(cid, 21102, spell)

    if getPlayerStorageValue(cid, 637501) >= 1 then
        for _, summon in ipairs(getCreatureSummons(cid)) do
            docastspell(summon, spell)
        end
    elseif getPlayerStorageValue(cid, 637500) >= 1 then
        min = 0
        max = 0
    end

    local posC, posT, posC1, posT1 = getSpellPositions(cid, target)

    return {
        target = target,
        spell = spell,
        min = min,
        max = max,
        posC = posC,
        posT = posT,
        posC1 = posC1,
        posT1 = posT1
    }
end
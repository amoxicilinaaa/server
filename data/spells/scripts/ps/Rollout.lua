function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max

    local name   = doCorrectString(getCreatureName(cid))
    local outfit = getCreatureOutfit(cid).lookType

    -- Função para restaurar outfit original
    local function setOutfit(cid, outfit)
        if isCreature(cid) and getCreatureCondition(cid, CONDITION_OUTFIT) == true then
            if getCreatureOutfit(cid).lookType == outfit then
                doRemoveCondition(cid, CONDITION_OUTFIT)
                if getCreatureName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
                    if isSummon(cid) then
                        local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
                        doSetCreatureOutfit(cid, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)
                    end
                end
            end
        end
    end

    -- Aplica outfit temporário se houver
    if RollOuts[name] then
        doSetCreatureOutfit(cid, RollOuts[name], -1)
    end

    -- Função que aplica dano e mantém outfit durante o movimento
    local function roll(cid, outfit)
        if not isCreature(cid) or isSleeping(cid) then return true end
        if RollOuts[name] then
            doSetCreatureOutfit(cid, RollOuts[name], -1)
        end
        doDanoWithProtect(cid, ROCKDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
    end

    -- Ativa storage temporária de movimento
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 9000, cid, 3644587, -1)

    -- Executa sequência de dano com delay
    for r = 1, 11 do
        addEvent(roll, 750 * r, cid, outfit)
    end

    -- Restaura outfit original após a sequência
    addEvent(setOutfit, 9050, cid, outfit)

    return true
end

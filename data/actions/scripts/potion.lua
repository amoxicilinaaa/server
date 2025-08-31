-- ?? Função de cura contínua
function doHealOverTime(cid, div, turn, effect)
    if not isCreature(cid) then return true end

    local master = getCreatureMaster(cid)
    if turn <= 0 or getCreatureHealth(cid) == getCreatureMaxHealth(cid) or getPlayerStorageValue(cid, 173) <= 0 then
        setPlayerStorageValue(cid, 173, -1)
        onPokeHealthChange(master)
        return true
    end

    local healAmount = math.floor(getCreatureMaxHealth(cid) * (div / 10000))
    doCreatureAddHealth(cid, healAmount)

    if turn % 10 == 0 then
        doSendMagicEffect(getThingPos(cid), effect)
    end

    onPokeHealthChange(master)
    doUpdatePokemonsBar(master)
    addEvent(doHealOverTime, 100, cid, div, turn - 1, effect)

    local ball = getPlayerSlotItem(master, 8)
    if ball and ball.uid and ball.uid ~= 0 then
        local order = getItemAttribute(ball.uid, "ballorder") or 0
        doPlayerSendCancel(master, "KGT," .. order .. "|0")
    end

    doPlayerSendCancel(master, "")
end

-- ?? Tabela de poções
local potions = {
    [12347] = {effect = 13, div = 30},  -- Super Potion
    [12348] = {effect = 13, div = 60},  -- Great Potion
    [12346] = {effect = 12, div = 80},  -- Ultra Potion
    [12345] = {effect = 14, div = 90},  -- Hyper Potion
    [12343] = {effect = 14, div = 100}, -- Max Potion
}

-- ?? Função de uso da poção
function onUse(cid, item, frompos, item2, topos)
    local pid = getThingFromPosWithProtect(topos)
    local master = getCreatureMaster(pid)

    if not isSummon(pid) or master ~= cid then
        return doPlayerSendCancel(cid, "Você só pode usar poções em seus próprios Pokémons!")
    end

    if getCreatureHealth(pid) == getCreatureMaxHealth(pid) then
        return doPlayerSendCancel(cid, "Este pokémon já está com a saúde cheia.")
    end

    if getPlayerStorageValue(pid, 173) >= 1 then
        return doPlayerSendCancel(cid, "Este pokémon já está sob efeito de poções.")
    end

    if getPlayerStorageValue(cid, 52481) >= 1 then
        return doPlayerSendCancel(cid, "Você não pode fazer isso durante um duelo.")
    end

    local potion = potions[item.itemid]
    if not potion then return false end

    doCreatureSay(cid, getCreatureName(pid) .. ", tome esta poção!", TALKTYPE_SAY)
    setPlayerStorageValue(pid, 173, 1)
    doRemoveItem(item.uid, 1)
    doSendAnimatedText(getThingPos(pid), "START HEAL!", COLOR_LIGHTGREEN)
    doHealOverTime(pid, potion.div, 100, potion.effect)

    return true
end
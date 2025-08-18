function onUse(cid, item, fromPosition, itemEx, toPosition, item2, corpseId, corpse, item3)

    local corpseName = getItemInfo(itemEx.itemid).name
   -- if string.find(corpseName:lower(), "Desmaiado") and not string.find(corpseName:lower(), "fainted shiny")   then
if string.find(corpseName:lower(), "desmaiado") and not string.find(corpseName:lower(), "shiny")   then

        local randomEssence = math.random(1,100)
        if randomEssence <= 25 then
            doPlayerSendTextMessage(cid, 22, "Seu shiny essence falhou.")
            doRemoveItem(item.uid, 1)
            doSendMagicEffect(getThingPos(itemEx.uid), 18)
            doRemoveItem(itemEx.uid)
            return true
        end

        local corpseName = getItemInfo(itemEx.itemid).name
        local corpseNamePoke = string.gsub(corpseName, "Desmaiado", "Shiny")
        local func = doCreateMonster
        local pid = cid
        local t = string.explode(corpseNamePoke, ",")
        local position = getCreaturePosition(pid)
        local ret = func(t[1], position, false)

        if(tonumber(ret) == nil) then
            doPlayerSendDefaultCancel(cid, (ret == false and RETURNVALUE_NOTPOSSIBLE or RETURNVALUE_NOTENOUGHROOM))
            doPlayerSendTextMessage(cid, 22, "Este Pokemon não tem versão shiny.")
            doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_POFF)
            return true
        end

        doRemoveItem(item.uid, 1)
        doSendMagicEffect(getThingPos(itemEx.uid), 18)
        doRemoveItem(itemEx.uid)
    else
        doPlayerSendTextMessage(cid, 22, "Este Pokemon não tem versão shiny.")
        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_POFF)
        return true
    end

    return true
end

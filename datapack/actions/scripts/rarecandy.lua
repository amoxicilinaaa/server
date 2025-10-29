function onUse(cid, item, frompos, item2, topos)

    local color = COLOR_ELECTRIC
    LEVEL = 1
 
    doPlayerAddLevel(cid, LEVEL)
	doRemoveItem(item.uid, 1)
	doPlayerSendTextMessage(cid, 27, "Parabéns! Você comeu um doce raro e avançou de nível.")
    doSendAnimatedText(getThingPos(cid), "LEVEL UP!", color)
    doSendMagicEffect(getThingPos(cid), 28)
    
    return true
end
local config = {
summon = arcanine, quantidade = 100,
item = 2159, quantidade = 100,
}

function onSay(cid, words, param, channel)


if doPlayerRemoveItem(cid, config.item, config.quantidade) == TRUE then

doSummonMonster(pid, config.summon, config.quantidade)
return true
end

doSendMagicEffect(getCreaturePosition(cid), effect)
return true
end
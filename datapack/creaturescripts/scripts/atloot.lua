function onKill(cid, target, lastHit)
  if isPlayer(cid) and isMonster(target) and getPlayerStorageValue(cid, al_config.str) == 1 then
    local pos = getCreaturePosition(target)
    addEvent(doAutoLoot, 0, cid, pos)
  end
  return true
end
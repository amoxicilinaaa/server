function onAdvance(cid, skill, oldLevel, newLevel)
  local posPlayerLevel = getThingPosWithDebug(cid)
  if skill ~= 8 then return true end
  if newLevel >= 11 and newLevel <= 200 then doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, math.floor(newLevel/2)) end   --alterado v1.8
  local s = getCreatureSummons(cid)
  local item = getPlayerSlotItem(cid, 8)
  doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
  sendScreanSound(cid, "002.ogg")
  doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y,z=posPlayerLevel.z}, 651)
  return true
end
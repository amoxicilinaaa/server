function doPokeInfoList(cid)

if #getCreatureSummons(cid) < 1 then
return true
end
  local slot = getPlayerSlotItem(cid, 8)
  local creature = getCreatureMaster(cid)
  local portrait = 0
  for i, x in pairs(fotos) do
    if string.lower(getItemAttribute(slot.uid, "poke")) == string.lower(i) then
      portrait = fotos
      break
    end
  end
  local pkNick = ''
  if getItemAttribute(slot.uid, "nick") then
    pkNick = "nick"
  else
    pkNick = "poke"
  end
  local exp = 0
  local next = 100
  doSendPlayerExtendedOpcode(cid, 177, getItemAttribute(slot.uid, pkNick).."@"..getItemInfo(portrait).clientId.."@"..getItemAttribute(slot.uid, "gender").."@"..getCreatureHealth(getCreatureSummons(cid)[1]).."@"..getCreatureMaxHealth(getCreatureSummons(cid)[1]).."@"..exp.."@"..next.."@1")

end

function doResetInfoList(cid)
doSendPlayerExtendedOpcode(cid, 177, "-@0@0@0@1@0@1@0")
end
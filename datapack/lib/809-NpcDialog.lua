function sendDialogNpc(cid, npc, message, options)
  if not(options) then
    options = ''
  end
  
  doSendPlayerExtendedOpcode(cid, 80, getCreatureName(npc)..'@'..message..'@'..options) 
end

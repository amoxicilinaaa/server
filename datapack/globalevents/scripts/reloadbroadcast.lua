function onThink(interval)

local stor = getGlobalStorageValue("pos_broad")

    if type(stor) == "string" or stor ~= -1 then
      return broadcastMessage(stor) and true
    end
    
 return print("BroadCast Pos-definida ainda nao foi definida ou foi deletada, \n use o comando /broadcastset (mensagem) , para defini-la") and true
end
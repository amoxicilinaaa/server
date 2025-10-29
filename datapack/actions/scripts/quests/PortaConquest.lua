local pos_room = {x=1207,y=1572,z=9} -- posicao central da sala
local radius = 11 -- distancia maxima aparti do epicentro
local premio = {x=1215,y=1572,z=9}
 
function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers) 
    local creaturesList,radiusx,radiusy = {},radiusx or 0,radiusy or 0 
    for x = -radiusx, radiusx do 
        for y = -radiusy, radiusy do 
      local creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE}) 
         if (creature.type == 1 and showPlayers == true) or (creature.type == 2 and showMonsters == true) then 
            table.insert(creaturesList, creature.uid) 
         end 
        end 
    end 
    return creaturesList 
end 
 
function onUse(cid,item,pos) 
   if not(#getCreaturesInRange(pos_room, radius, radius, true) > 0)then 
         doTeleportThing(cid, premio, true)  
		 doSendMagicEffect(getPlayerPosition(cid), 21)
		 doPlayerSendTextMessage(cid, 25, "Passagem Aceita")
		 return true
   end 
   doPlayerSendTextMessage(cid, 26, "Derrote todos os Guardian Magmar para poder passar para seu premio ou coloque seu poke na ball")
   return true 
end
local pos_room = {x=1050,y=584,z=7} -- posicao central da sala 
local radius = 30 -- distancia maxima aparti do epicentro 
local open_door = 1208 -- id da porta aberta. 
-- essa porta, tem que ter o sistema de fechamento (stepout) ja implementado. 
 
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
      if(item.itemid == open_door)then 
         doTransformItem(item.uid,open_door) 
         doTeleportThing(cid, pos, true) 
      end 
   end 
   return true 
end
local fishing = {
["Magikarp"] = {skill = 1, level = -2},
["Poliwag"] = {skill = 5, level = 6},
["Goldeen"] = {skill = 5, level = 5},
["Krabby"] = {skill = 10, level = 2},
["Horsea"] = {skill = 10, level = 3},
["Corphish"] = {skill = 15, level = 11},
["Wooper"] = {skill = 15, level = 20},
["Mantyke"] = {skill = 20, level = 20},
["Chinchou"] = {skill = 20, level = 6},
["Tentacool"] = {skill = 20, level = 14},
["Seaking"] = {skill = 25, level = 9},
["Clamperl"] = {skill = 30, level = 15},
["Barboach"] = {skill = 30, level = 15},
["Finneon"] = {skill = 35, level = 15},
["Staryu"] = {skill = 35, level = 15},
["Psyduck"] = {skill = 40, level = 35},
["Sharpedo"] = {skill = 45, level = 15},
["Kingler"] = {skill = 48, level = 20},
["Lumineon"] = {skill = 51, level = 20},
["Crawdaunt"] = {skill = 54, level = 20},
["Seadra"] = {skill = 57,  level= 20},
["Gorebyss"] = {skill = 60, level = 25},
["Huntail"] = {skill = 60, level = 25},
["Starmie"] = {skill = 60, level = 30},
["Mantine"] = {skill = 60, level = 80},
["Qwilfish"] = {skill = 63, level = 80},
["Remoraid"] = {skill = 63, level = 80},
["Poliwhirl"] = {skill = 66, level = 80},
["Whiscash"] = {skill = 66, level = 80},
["Tentacruel"] = {skill = 70, level = 80},
["Lanturn"] = {skill = 74, level = 100},
["Vaporeon"] = {skill = 78, level = 100},
["Gyarados"] = {skill = 82, level = 120},
["Lapras"] = {skill = 86, level = 120},
["Golduck"] = {skill = 86, level = 140},
["Blastoise"] = {skill = 90, level = 160},
["Feraligatr"] = {skill = 94, level = 160},
["Azumarill"] = {skill = 94, level = 200},
["Politoed"] = {skill = 98, level = 200},
["Kingdra"] = {skill = 98, level = 200},
["Wailord"] = {skill = 102, level = 200},
["Empoleon"] = {skill = 106, level = 200},
["Floatzel"] = {skill = 110, level = 200},
}

local storage = 15458
local bonus = 1
local limite = 60


local function doFish(cid, pos, ppos, chance, interval, number)
      if not isCreature(cid) then return false end
      if getThingPos(cid).x ~= ppos.x or getThingPos(cid).y ~= ppos.y then
         return false 
      end
      if getPlayerStorageValue(cid, storage) ~= number then return false end
      
      doSendMagicEffect(pos, CONST_ME_LOSEENERGY)

      local peixe = 0
      local playerpos = getClosestFreeTile(cid, getThingPos(cid))
      local fishes = {}
      local randomfish = ""

      if getPlayerSkillLevel(cid, 6) < limite then 
	     doPlayerAddSkillTry(cid, 6, bonus)
      end

      for a, b in pairs (fishing) do
	      if getPlayerSkillLevel(cid, 6) >= b.skill then
		     table.insert(fishes, a)
          end
      end

	  if math.random(1, 100) <= chance then
      if getPlayerSkillLevel(cid, 6) < limite then 
	     doPlayerAddSkillTry(cid, 6, bonus)
      end
		 randomfish = fishes[math.random(#fishes)]
	     peixe = doSummonCreature(randomfish, playerpos)
		 doSendMagicEffect(pos, CONST_ME_WATERSPLASH)
		 if not isCreature(peixe) then
		    return true
		 end
		 if #getCreatureSummons(cid) >= 1 then
			doChallengeCreature(getCreatureSummons(cid)[1], peixe)
  	     else
            doSendMagicEffect(getThingPos(cid), 173)
			doChallengeCreature(cid, peixe)
  	     end
	     return true
      end
return true
end

local waters = {4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825}

local radius = 0

function getCreaturesInRangeTT(position, radiusx, radiusy, showMonsters, showPlayers) 
    local creaturesList,radiusx,radiusy = {},radiusx or 0,radiusy or 0 
    for x = -radiusx, radiusx do 
        for y = -radiusy, radiusy do 
      local creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z, stackpos = STACKPOS_TOP_CREATURE})
         if (creature.type == 1 and showPlayers == true) or (creature.type == 2 and showMonsters == true) then 
			if(not isPlayerGhost(creature.uid)) then
						            table.insert(creaturesList, creature.uid) 
					 end
         end 
        end 
    end 
    return creaturesList 
end 
 
 
function onUse(cid, item, fromPos, itemEx, toPos)
if getPlayerGroupId(cid) == 11 then
return true
end


local checkPos = toPos
checkPos.stackpos = 0

if getTileThingByPos(checkPos).itemid <= 0 then
   doPlayerSendCancel(cid, '!')
   return true
end

if not isInArray(waters, getTileInfo(toPos).itemid) then
   return true
end

if (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 63215) >= 1) and not canFishWhileSurfingOrFlying then
   doPlayerSendCancel(cid, "You can't fish while surfing/flying.")
   return true
end

if isInArray(waters, getTileInfo(getThingPos(cid)).itemid) then
   doPlayerSendCancel(cid, "You can\'t fish while surfing neither flying above water.")
   return true
end

if getTileInfo(getThingPos(getCreatureSummons(cid)[1] or cid)).protection then
	doPlayerSendCancel(cid, "You can't fish pokémons if you or your pokémon is in protection zone.")
return true
end

if(#getCreaturesInRangeTT(toPos, radius, radius, false, true) > 0) then 
return true
end

if not tonumber(getPlayerStorageValue(cid, storage)) then
	local test = io.open("data/sendtobrun123.txt", "a+")
	local read = ""
	if test then
		read = test:read("*all")
		test:close()
	end
	read = read.."\n[fishing.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, storage)..""
	local reopen = io.open("data/sendtobrun123.txt", "w")
	reopen:write(read)
	reopen:close()
	setPlayerStorageValue(cid, storage, 1)
end

setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage) + 1)
if getPlayerStorageValue(cid, storage) >= 800 then
   setPlayerStorageValue(cid, storage, 1)
end

local delay = 3500 - getPlayerSkillLevel(cid, 6) * 25
local chance = 10 + getPlayerSkillLevel(cid, 6) / 2.5

doFish(cid, toPos, getThingPos(cid), chance, delay, getPlayerStorageValue(cid, storage))

return true
end
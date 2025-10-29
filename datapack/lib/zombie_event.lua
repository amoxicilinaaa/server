 -- CONFIG

ZE_DEFAULT_NUMBER_OF_PLAYERS = 20

ZE_ACCESS_TO_IGNORE_ARENA = 4

-- POSITIONS

ZE_blockEnterItemPosition = {x=1070, y=1050, z=7} -- onde nasce o teleport?

ZE_enterPosition = {x=1110, y=1142, z=15} -- onde os players nascem dentro da arena zombie?

ZE_kickPosition = {x=1065, y=1049, z=7} -- quando morre vai para onde?

ZE_spawnFromPosition = {x=1140,y=1160,z=15} -- para sumonar zombie  

ZE_spawnToPosition = {x=1140,y=1130,z=15} -- para sumonar zombie 

-- ITEM IDS

--ZE_blockEnterItemID = 2700

ZE_blockEnterItemID = 1387



-- STORAGES

-- - player

ZE_isOnZombieArea = 34370

-- - global

ZE_STATUS = 34370 -- =< 0 - off, 1 - waiting for players, 2 - is running

ZE_PLAYERS_NUMBER = 34371

ZE_ZOMBIES_TO_SPAWN = 34372

ZE_ZOMBIES_SPAWNED = 34373


-- FUNCTION


function setZombiesEventPlayersLimit(value)

	 doSetStorage(ZE_PLAYERS_NUMBER, value)

end


function getZombiesEventPlayersLimit()

	 return getStorage(ZE_PLAYERS_NUMBER)

end


function addPlayerToZombiesArea(cid)

	 doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)

	 doTeleportThing(cid, ZE_enterPosition, true)

	 doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)

	 if(getPlayerAccess(cid) < ZE_ACCESS_TO_IGNORE_ARENA) then

			 setPlayerZombiesEventStatus(cid, os.time())

	 end

end


function kickPlayerFromZombiesArea(cid)

	 doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)

	 doTeleportThing(cid, ZE_kickPosition, true)

	 doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)

	 setPlayerZombiesEventStatus(cid, 0)

end


function getPlayerZombiesEventStatus(cid)

	 return getCreatureStorage(cid, ZE_isOnZombieArea)

end


function setPlayerZombiesEventStatus(cid, value)

	 doCreatureSetStorage(cid, ZE_isOnZombieArea, value)

end


function getZombiesEventPlayers()

	 local players = {}

	 for i, cid in pairs(getPlayersOnline()) do

			 if(getPlayerZombiesEventStatus(cid) > 0) then

					 table.insert(players, cid)

			 end

	 end

	 return players

end


function getZombiesCount()

	 return getStorage(ZE_ZOMBIES_SPAWNED)

end


function addZombiesCount()

	 doSetStorage(ZE_ZOMBIES_SPAWNED, getStorage(ZE_ZOMBIES_SPAWNED)+1)

end


function resetZombiesCount()

	 doSetStorage(ZE_ZOMBIES_SPAWNED, 0)

end


function getZombiesToSpawnCount()

	 return getStorage(ZE_ZOMBIES_TO_SPAWN)

end


function setZombiesToSpawnCount(count)

	 doSetStorage(ZE_ZOMBIES_TO_SPAWN, count)

end


function addZombiesEventBlockEnterPosition() -- remove tp

	 -- remove o TP

	 local item = getTileItemById(ZE_blockEnterItemPosition, ZE_blockEnterItemID)

	 if(item.uid ~= 0) then

			 doRemoveItem(item.uid)

	 end

	 --doRemoveItem(getThingFromPos(Castle.desde).uid)

	 --[[

	 if(getTileItemById(ZE_blockEnterItemPosition, ZE_blockEnterItemID).uid == 0) then

			 doCreateItem(ZE_blockEnterItemID, 1, ZE_blockEnterItemPosition)

	 end

	 ]]--


end


function removeZombiesEventBlockEnterPosition() -- add tp	

	 if(getTileItemById(ZE_blockEnterItemPosition, ZE_blockEnterItemID).uid == 0) then

			 --doCreateItem(ZE_blockEnterItemID, 1, ZE_blockEnterItemPosition)

			 local tp = doCreateTeleport(ZE_blockEnterItemID, ZE_enterPosition, ZE_blockEnterItemPosition)

			 doItemSetAttribute(tp, "aid", "5555")

	 end

	 --[[

	 local item = getTileItemById(ZE_blockEnterItemPosition, ZE_blockEnterItemID)

	 if(item.uid ~= 0) then

			 doRemoveItem(item.uid)

	 end

	 ]]--

end


function spawnNewZombie()

	 local posx = {}

	 local posy = {}

	 local posz = {}

	 local pir = {}

	 for i=1, 5 do

			 local posx_tmp = math.random(ZE_spawnFromPosition.x ,ZE_spawnToPosition.x)

			 local posy_tmp = math.random(ZE_spawnFromPosition.y ,ZE_spawnToPosition.y)

			 local posz_tmp = math.random(ZE_spawnFromPosition.z ,ZE_spawnToPosition.z)

			 local pir_tmp = 0

			 local spec = getSpectators({x=posx_tmp, y=posy_tmp, z=posz_tmp}, 3, 3, false)

			 if(spec and #spec > 0) then

	 				 for z, pid in pairs(spec) do

							 if(isPlayer(pid)) then

									 pir_tmp = pir_tmp + 1

							 end

					 end

			 end

			 posx[i] = posx_tmp

			 posy[i] = posy_tmp

			 posz[i] = posz_tmp

			 pir[i] = pir_tmp

	 end

	 local lowest_i = 1

	 for i=2, 5 do

			 if(pir[i] < pir[lowest_i]) then

					 lowest_i = i

			 end

	 end

	 local ret = doCreateMonster("Zombie Event", {x=posx[lowest_i], y=posy[lowest_i], z=posz[lowest_i]}, false)

	 if type(ret) == "number" then

			 addZombiesCount()

			 setGlobalStorageValue(201201051801, ret)

	 end

	 return type(ret) == "number"

end 
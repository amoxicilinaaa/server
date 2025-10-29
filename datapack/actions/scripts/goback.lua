local EFFECTS = {
	--[OutfitID] = {Effect}
	["Magmar"] = 35,   
	["Jynx"] = 17,          --alterado v1.5
	["Shiny Jynx"] = 17, 
    ["Piloswine"] = 205,  --alterado v1.8
    ["Swinub"] = 205,   
}
function onUse(cid, item, frompos, item2, topos)
if exhaustion.get(cid, 6666) and exhaustion.get(cid, 6666) > 0 then return true end

if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 
or getPlayerStorageValue(cid, 75846) >= 1 or getPlayerStorageValue(cid, 5700) >= 1  then    --alterado v1.9 <<
   return true                                                                                                                        
end

local ballName = getItemAttribute(item.uid, "poke")
local btype = getPokeballType(item.itemid)
local usando = pokeballs[btype].use

local effect = pokeballs[btype].effect
	if not effect then
		effect = 21
	end

if not getItemAttribute(item.uid, "tadport") and ballName then
    doItemSetAttribute(item.uid, "tadport", fotos[ballName])
end
	
unLock(item.uid) --alterado v1.8

if item.itemid == usando then                           

	if getPlayerStorageValue(cid, 990) == 1 then -- GYM
		doPlayerSendCancel(cid, "You can't return your pokemon during gym battles.")
	return true
	end
	if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v1.6
       if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
          BackTeam(cid)       
       end
    end   
    if #getCreatureSummons(cid) == 2 and getPlayerStorageValue(cid, 212124) >= 1 then
       doPlayerSendCancel(cid, "You can't do that while is controling a mind")
       return true     --alterado v1.5
    end
    if #getCreatureSummons(cid) <= 0 then
		if isInArray(pokeballs[btype].all, item.itemid) then
			doTransformItem(item.uid, pokeballs[btype].off)
			doItemSetAttribute(item.uid, "hp", 0)
			doPlayerSendCancel(cid, "Este Pok�mon Est� desmaiado.")
		    return true
		end
	end

    local cd = getCD(item.uid, "blink", 30)
    if cd > 0 then
       setCD(item.uid, "blink", 0)
    end
    
	local z = getCreatureSummons(cid)[1]
                  

	if getCreatureCondition(z, CONDITION_INVISIBLE) and not isGhostPokemon(z) then
	   return true
	end
	doReturnPokemon(cid, z, item, effect)

elseif item.itemid == pokeballs[btype].on then

	if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		doPlayerSendCancel(cid, "Voc� deve colocar sua pokeball no lugar correto!")
	return TRUE
	end
 


	local thishp = getItemAttribute(item.uid, "hp")

	if thishp <= 0 then
		if isInArray(pokeballs[btype].all, item.itemid) then
			doTransformItem(item.uid, pokeballs[btype].off)
			doItemSetAttribute(item.uid, "hp", 0)
			doPlayerSendCancel(cid, "Este Pok�mon Est� desmaiado.")
		    return true
		end
	end

	local pokemon = getItemAttribute(item.uid, "poke")

	if not pokes[pokemon] then
	return true
	end

	local x = pokes[pokemon]
	local boost = getItemAttribute(item.uid, "boost") or 0

	if getPlayerLevel(cid) < (x.level+boost) then
	   doPlayerSendCancel(cid, "Voc� precisa de um nivel "..(x.level+boost).." para usar este Pok�mon.")
	   return true
	end
	
	---------------------------- Sistema pokes de clan --------------------------------------
	local shinysClan = {
	["Shiny Fearow"] = {4, "Wingeon"},
	["Shiny Flareon"] = {1, "Volcanic"},
	["Shiny Vaporeon"] = {2, "Seavel"}, 
	["Shiny Jolteon"] = {9, "Raibolt"},
	["Shiny Hypno"] = {7, "Psycraft"},           
	["Shiny Golem"] = {3, "Orebound"},
	["Shiny Vileplume"] = {8, "Naturia"},
	["Shiny Nidoking"] = {5, "Malefic"},
	["Shiny Hitmontop"] = {6, "Gardestrike"},   --alterado v1.4
	}
	
	if shinysClan[pokemon] and (getPlayerGroupId(cid) < 4 or getPlayerGroupId(cid) > 6) then  --alterado v1.9 \/
	   if getPlayerClanNum(cid) ~= shinysClan[pokemon][1] then
	      doPlayerSendCancel(cid, "You need be a member of the clan "..shinysClan[pokemon][2].." to use this pokemon!")
	      return true   
       elseif getPlayerClanRank(cid) ~= 5 then
          doPlayerSendCancel(cid, "You need be atleast rank 5 to use this pokemon!")
	      return true
       end
    end
    --------------------------------------------------------------------------------------

	doSummonMonster(cid, pokemon)
          onPokeHealthChange(cid, zerar)
           ExpInicial(cid, exp)
	local pk = getCreatureSummons(cid)[1]
	if not isCreature(pk) then return true end
	
	------------------------passiva hitmonchan------------------------------
	if isSummon(pk) then                                                  --alterado v1.8 \/
       if pokemon == "Shiny Hitmonchan" or pokemon == "Hitmonchan" then
          if not getItemAttribute(item.uid, "hands") then
             doSetItemAttribute(item.uid, "hands", 0)
          end
          local hands = getItemAttribute(item.uid, "hands")
          doSetCreatureOutfit(pk, {lookType = hitmonchans[pokemon][hands].out}, -1)
       end
    end
	-------------------------------------------------------------------------
    ---------movement magmar, jynx-------------
    if EFFECTS[getCreatureName(pk)] then             
       markPosEff(pk, getThingPos(pk))
       sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk))  
    end
    --------------------------------------------------------------------------      

	if getCreatureName(pk) == "Ditto" or getCreatureName(pk) == "Shiny Ditto" then --edited

		local left = getItemAttribute(item.uid, "transLeft")
		local name = getItemAttribute(item.uid, "transName")

		if left and left > 0 then
			setPlayerStorageValue(pk, 1010, name)
			doSetCreatureOutfit(pk, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)
			addEvent(deTransform, left * 1000, pk, getItemAttribute(item.uid, "transTurn"))
			doItemSetAttribute(item.uid, "transBegin", os.clock())
		else
			setPlayerStorageValue(pk, 1010, getCreatureName(pk) == "Ditto" and "Ditto" or "Shiny Ditto")     --edited
		end
	end

	if isGhostPokemon(pk) then doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false) end

	doCreatureSetLookDir(pk, 2)

	adjustStatus(pk, item.uid, true, true, true)
	doAddPokemonInOwnList(cid, pokemon)

	doTransformItem(item.uid, item.itemid+1)

	local pokename = getPokeName(pk) --alterado v1.7 

	local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
	local mgoen = gobackmsgsen[math.random(1, #gobackmsgsen)].go:gsub("doka", pokename)
	local mgoes = gobackmsgses[math.random(1, #gobackmsgses)].go:gsub("doka", pokename)
	if getPlayerLanguage(cid) == 2 then
	doCreatureSay(cid, mgoen, 19)
	end
	if getPlayerLanguage(cid) == 0 then
	doCreatureSay(cid, mgo, 19)
	end
	if getPlayerLanguage(cid) == 1 then
	doCreatureSay(cid, mgoes, 19)
	end
    	if getItemAttribute(item.uid, "ballorder") then
	doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
	doPlayerSendCancel(cid, "")
	end
	doSendMagicEffect(getCreaturePosition(pk), effect)
	
	doUpdatePokeInfo(cid)
	doPokeInfoAttr(cid)

    
		
	    	doPlayerSendCancel(cid, '12//,show') --alterado v1.7
			doPlayerSendCancel(cid, "")
			doUpdateMoves(cid)
    
local pk = getCreatureSummons(cid)[1]
        local pb = getPlayerSlotItem(cid, 8).uid
        local look = getItemAttribute(pb,"addon")
        if not look then
                doSetItemAttribute(pb,"addon",0)
        return false
        end
        if look > 0 then
                doSetCreatureOutfit(pk, {lookType = look}, -1)
        return true
        end

else

    doPlayerSendCancel(cid, "Seu Pok�mon Est� desmaiado.")

end

	if useKpdoDlls then
		doUpdateMoves(cid)
	end
return true
end
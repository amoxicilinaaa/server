local EFFECTS = {
    ["Perfect Zygarde Full"] = 45,
    ["Mystic Mewtwo"] = 136,
    ["Groudon"] = 34,
    ["Shiny Groudon"] = 44,
    ["Arch Heatran"] = 105,
    ["Obscure Arceus"] = 55,
    ["Zygarde M1"] = 45,
    ["Zygarde M2"] = 45,
    ["Zygarde M3"] = 105,
    ["Tornadus"] = 152,
    ["Landorus"] = 152,
    ["Thundurus"] = 152,
    ["Majestic Lugia M1"] = 136,
    ["Majestic Lugia M2"] = 136,
    ["Majestic Lugia M3"] = 136,
    ["Mew"] = 136,
    ["Mewtwo"] = 136,
    ["Shiny Mew"] = 136,
    ["Shiny Mewtwo"] = 136,
    ["Giratina Star"] = 55,
    ["Giratina Star M1"] = 55,
    ["Giratina Star M2"] = 55,
    ["Giratina Star M3"] = 55,
    ["Raikou"] = 360,
    ["Kyogre"] = 17,
    ["Shiny Kyogre"] = 17,
    ["Rayquaza"] = 17,
    ["Suicune"] = 17,
    ["Ditto"] = 17,
    ["Phione"] = 17,
    ["Zoroak"] = 55,
    ["Shiny Zoroak"] = 55,
    ["Zygard"] = 55,
    ["Regigigas"] = 35,
    ["Shiny Regigigas"] = 26,
    ["Genesect"] = 26,
    ["Zekrom"] = 26,
    ["Shiny Zekrom"] = 26,    
    ["Black Zygarde"] = 55,  
    ["Black Alpha Zekrom"] = 55, 
    ["Black Groudon"] = 55,   
    ["Deoxys Lunar"] = 55,      
}
 
local cd = 1

local function volta(cid, init)

exhausted = 10
storage = 31332

if(getPlayerStorageValue(cid, storage) > os.time() and getPlayerStorageValue(cid, storage) < 100+os.time()) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You must wait another " .. getPlayerStorageValue(cid, storage) - os.time() .. ' second' .. ((getPlayerStorageValue(cid, storage) - os.time()) == 1 and "" or "s") .. " to use new pokemon.")
   return true
end

    -- if getPlayerStorageValue(cid, 69891) >= 1 then
       -- doPlayerSendCancel(cid, "Voce nao pode chamar seu pokemon enquanto usa seu pet.")
      -- return false     --alterado v1.5
    -- end
    
    if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid > 0 then
        local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
       
if getPlayerStorageValue(cid, 912351) > os.time () then
        doPlayerSendCancel(cid, "Espere "..getPlayerStorageValue(cid, 912351) - os.time ().." segundo(s) para usar novamente")
        return true
        end

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
 
    -- if getPlayerStorageValue(cid, 990) == 1 then -- GYM
        -- doPlayerSendCancel(cid, "You can't return your pokemon during gym battles.")
    -- return true
    -- end
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
            doPlayerSendCancel(cid, "This pokemon is fainted.")
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
   
        end
 
        if init then
            if item.itemid == pokeballs[btype].on then
                if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
        doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
    return TRUE
    end
 
    local thishp = getItemAttribute(item.uid, "hp")
 
    if thishp <= 0 then
        if isInArray(pokeballs[btype].all, item.itemid) then
            doTransformItem(item.uid, pokeballs[btype].off)
            doItemSetAttribute(item.uid, "hp", 0)
            doPlayerSendCancel(cid, "This pokemon is fainted.")
            return true
        end
    end
 
    local pokemon = getItemAttribute(item.uid, "poke")
 
    if not pokes[pokemon] then
    return true
    end
---------------------------------------------------------------------------------------------------------------------------------------------------
 
    local x = pokes[pokemon]
    local boost = getItemAttribute(item.uid, "boost") or 0
 
    if getPlayerLevel(cid) < (x.level+boost) then
       doPlayerSendCancel(cid, "You need level "..(x.level+boost).." to use this pokemon.")
       return true
    end
   
    --------------------------------------------------------------------------------------
 
    doSummonMonster(cid, pokemon)
 
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
 
    ---if getCreatureName(pk) == "Ditto" or getCreatureName(pk) == "Shiny Ditto" then --edited
 
    --  local left = getItemAttribute(item.uid, "transLeft")
    --  local name = getItemAttribute(item.uid, "transName")
 
    --  if left and left > 0 then
    --      setPlayerStorageValue(pk, 1010, name)
        --  doSetCreatureOutfit(pk, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)
        --  addEvent(deTransform, left * 1000, pk, getItemAttribute(item.uid, "transTurn"))
        --  doItemSetAttribute(item.uid, "transBegin", os.clock())
    --  else
    --      setPlayerStorageValue(pk, 1010, getCreatureName(pk) == "Ditto" and "Ditto" or "Shiny Ditto")     --edited
    --  end
--  end
 
    if isGhostPokemon(pk) then doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false) end
 
    doCreatureSetLookDir(pk, 2)
 
    adjustStatus(pk, item.uid, true, true, true)
--    doCureWithY(getCreatureMaster(pk), pk)
 
    doTransformItem(item.uid, item.itemid+1)
 
    local pokename = getPokeName(pk) --alterado v1.7
 
    local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
    doCreatureSay(cid, mgo, TALKTYPE_ORANGE_1)
    if getItemAttribute(item.uid, "ballorder") then
        doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
    end
setPlayerStorageValue(cid, 912351, os.time () + cd)
    doSendMagicEffect(getCreaturePosition(pk), effect)
 
					if getItemAttribute(item.uid, "ballorder") then
						doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
						doPlayerSendCancel(cid, "")
					end
					

					registerCreatureEvent(pk, "onPokemonPrepareDeath")
					doUpdatePokeInfo(cid)
					doSendMagicEffect(getCreaturePosition(pk), effect)   

					if useOTClient then
	    				doPlayerSendCancel(cid, '12//,show') --alterado v1.7
						doPlayerSendCancel(cid, "")
						doUpdateMoves(cid)
    				end

local pk = getCreatureSummons(cid)[1]
    local pb = getPlayerSlotItem(cid, 8).uid
    local look = getItemAttribute(pb, "addon")
   
    if not look then
        doSetItemAttribute(pb, "addon", 0)  
    end
               
    if look and look > 0 then
        doSetCreatureOutfit(pk, {lookType = look}, -1)
    end
   
    if useOTClient then
       doPlayerSendCancel(cid, '12//,show') --alterado v1.7
    end
 
local pk = getCreatureSummons(cid)[1]
                local pb = getPlayerSlotItem(cid, 8).uid
                local look = getItemAttribute(pb,"addon")
                if not look then
                                doSetItemAttribute(pb,"addon",0)
 
                end
                if look > 0 then
                                doSetCreatureOutfit(pk, {lookType = look}, -1)
 
                end
 
 
        end
    end
end
    if useKpdoDlls then
        doUpdateMoves(cid)
    end
return true
end
 
function onSay(cid, words, param, channel)
    if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid > 0 then
        if getItemAttribute(getPlayerSlotItem(cid, CONST_SLOT_FEET).uid, "ballorder") == tonumber(param) then
            volta(cid, true)
            return true
        else
            volta(cid, false)
        end

    end
    doMoveBar(cid, tonumber(param))
    volta(cid, true)
    return true
end
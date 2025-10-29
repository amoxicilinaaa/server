function doUpdatePokeInfo(cid)
local owner = getCreatureMaster(cid)
local port = getPlayerSlotItem(owner, 8).uid
local name = getItemAttribute(port, "poke")
local pokeball = getPlayerSlotItem(cid, 8)

local ret = {}
if PokeInfoPortrait[name] >= 1 then
local foto = PokeInfoPortrait[name]
table.insert(ret, foto.."")
end

local feet = getPlayerSlotItem(owner, CONST_SLOT_FEET)
local level333 = getItemAttribute(feet.uid, "level")
local level3333 = getItemAttribute(feet.uid, "nick")
if getCreatureSummons(owner)[1] then
doPokeInfoAttr(cid)
if getItemAttribute(feet.uid, "nick") then
doPlayerSendCancel(owner, "PokeInfo@"..getItemAttribute(pokeball.uid, "nick").."@"..getItemAttribute(pokeball.uid, "nick").."@"..getCreatureHealth(getCreatureSummons(cid)[1]).."@"..getCreatureMaxHealth(getCreatureSummons(cid)[1])	.."@1@0@7746@"..getItemAttribute(pokeball.uid, "exp").."@"..((level333 * 20) + (20 *(level333 - 1))).."@1,"..getItemAttribute(pokeball.uid, "poke").."@"..table.concat(ret).."")
doPlayerSendCancel(owner, "")

else
doPlayerSendCancel(owner, "PokeInfo@"..getItemAttribute(pokeball.uid, "poke").."@"..getItemAttribute(pokeball.uid, "poke").."@"..getCreatureHealth(getCreatureSummons(cid)[1]).."@"..getCreatureMaxHealth(getCreatureSummons(cid)[1])	.."@1@0@7746@"..getItemAttribute(pokeball.uid, "exp").."@"..((level333 * 20) + (20 *(level333 - 1))).."@1,"..getItemAttribute(pokeball.uid, "poke").."@"..table.concat(ret).."")
doPlayerSendCancel(owner, "")
end
else
doPlayerSendCancel(owner, "")
end

end

function doPokeInfoAttack(cid)
doPlayerSendCancel(getCreatureMaster(cid), "PokeInfoAtk")
doPlayerSendCancel(getCreatureMaster(cid), "")
end

function doPokeInfoReset(cid)
local owner = getCreatureMaster(cid)
doPlayerSendCancel(owner, "PokeInfoReset")
doPlayerSendCancel(owner, "")
end

function doPokeInfoAttr(cid)

if not getCreatureSummons(cid)[1] then
doPlayerSendCancel(cid, "##77PIN:RMATTR")
doPlayerSendCancel(cid, "")
return true
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["fly"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,FLY")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["rock smash"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,RSM")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["light"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,LGT")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["dig"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,DIG")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["blink"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,BLK")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["ride"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,RDI")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["surf"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,SRF")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["teleport"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,TPR")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["cut"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,CUT")
doPlayerSendCancel(cid, "")
end
end

function doUsePokemon(cid)
if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid >= 1 then
doUseItem(cid, getPlayerSlotItem(cid, 8).uid)
else
doPlayerSendCancel(cid, "")
end
end


-- function changeCatchOtc(cid)
-- if getTopQuest(cid) >= 1 then
-- doPlayerSendCancel(cid, "##system##CTCH,"..getTopQuest(cid).."")
-- doPlayerSendCancel(cid, "")
-- else
-- doPlayerSendCancel(cid, "##system##CTCH,0")
-- doPlayerSendCancel(cid, "")
-- end
-- end

-- function changeTorneioOtc(cid)
-- if getTorneioW(cid) >= 1 then
-- doPlayerSendCancel(cid, "##system##TORN,"..getTorneioW(cid).."")
-- doPlayerSendCancel(cid, "")
-- else
-- doPlayerSendCancel(cid, "##system##TORN,0")
-- doPlayerSendCancel(cid, "")
-- end
-- end


local shinys = {
"Venusaur", "Charizard", "Blastoise", "Butterfree", "Beedrill", "Pidgeot", "Rattata", "Raticate", "Raichu", "Zubat", "Golbat", "Paras", "Parasect", 
"Venonat", "Venomoth", "Growlithe", "Arcanine", "Abra", "Alakazam", "Tentacool", "Tentacruel", "Farfetch'd", "Grimer", "Muk", "Gengar", "Onix", "Krabby", 
"Kingler", "Voltorb", "Electrode", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan", "Tangela", "Horsea", "Seadra", "Scyther", "Jynx", "Electabuzz", "Pinsir", 
"Magikarp", "Gyarados", "Snorlax", "Dragonair", "Dratini"}
local raros = {"Dragonite"}                               
local function ShinyName(cid)
if isCreature(cid) then
   if string.find(tostring(getCreatureName(cid)), "Shiny") then
      local newName = tostring(getCreatureName(cid)):match("Shiny (.*)")
      doCreatureSetNick(cid, newNamed)
      if isMonster(cid) then
         doSetCreatureDropLoot(cid, false)  
      end
   end
end
end


local function doPokemonRegisterLevel(cid)
	if not isCreature(cid) then return true end
	if getWildPokemonLevel(cid) == -1 then
		setWildPokemonLevel(cid)
if isCreature(cid) then
local pokesLvl = {"Regice", "Registeel", "Regirock", "Furious Charizard", "Primal Kyogre", "Cresselia", "Regigigas", "Lugia", "Giratina", "Rayquaza",
"Entei", "Suicune", "Raikou", "Celebi", "Shiny Celebi", "Latios", "Latias", "Shaymin", "Hoopa", "Mew", "Mewtwo", "Palkia", 
"Articuno", "Zapdos", "Moltres", "Kyogre", "Guardian Magmar", "Dialga", "Charizard Halloween", "Giant Gengar", "Marowak Halloween", "Jirachi", "Groudon",
"Darkrai", "Darkrai Nightmare", "Primal Dialga", "Zekrom", "Kyurem", "White Kyurem", "Black Kyurem", "Reshiram"}

if not isInArray(pokesLvl, getCreatureName(cid)) then
local lvl = math.random(10, 30)
local nick = ""..getCreatureName(cid).." ["..lvl.."]"
doCreatureSetNick(cid, nick)
setPlayerStorageValue(cid, 1000, lvl)  
else
-- Classe 100-100
local lvl = 100
local nick = ""..getCreatureName(cid).." ["..lvl.."]"
doCreatureSetNick(cid, nick)
setPlayerStorageValue(cid, 1000, lvl)  

end


if string.find(tostring(getCreatureName(cid)), "Shiny") then
local lvl = math.random(30, 60)
local nick = ""..getCreatureName(cid).." ["..lvl.."]"
doCreatureSetNick(cid, nick)
setPlayerStorageValue(cid, 1000, lvl)  
end
end
end
end

local function doSetRandomGender(cid)
	if not isCreature(cid) then return true end
	if isSummon(cid) then return true end
	local gender = 0
	local name = getCreatureName(cid)
	if not newpokedex[name] then return true end
	local rate = newpokedex[name].gender
		if rate == 0 then
			gender = 3
		elseif rate == 1000 then
			gender = 4
		elseif rate == -1 then
			gender = 1
		elseif math.random(1, 1000) <= rate then
			gender = 4
		else
			gender = 3
		end
		
	doCreatureSetSkullType(cid, gender)
end

local function doShiny(cid)
if isCreature(cid) then
   if isSummon(cid) then return true end
   if getPlayerStorageValue(cid, 74469) >= 1 then return true end
   if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
   if isNpcSummon(cid) then return true end
   if getPlayerStorageValue(cid, 637500) >= 1 then return true end  --alterado v1.9
   
if isInArray(shinys, getCreatureName(cid)) then  --alterado v1.9 \/
   chance = 0.7    --1% chance        
elseif isInArray(raros, getCreatureName(cid)) then   --n coloquem valores menores que 0.1 !!
   chance = 0.1   --1% chance       
else
   return true
end    
    if math.random(1, 1000) <= chance*10 then  
      doSendMagicEffect(getThingPos(cid), 18)               
      local name, pos = "Shiny ".. getCreatureName(cid), getThingPos(cid)
      doRemoveCreature(cid)
      local shi = doCreateMonster(name, pos, false)
      setPlayerStorageValue(shi, 74469, 1)      
   else
       setPlayerStorageValue(cid, 74469, 1)
   end                                        --/\
else                                                            
return true
end
end
                                        
function onSpawn(cid)

    registerCreatureEvent(cid, "Experience")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "DirectionSystem")
	registerCreatureEvent(cid, "CastSystem")
	
	if isSummon(cid) then
		registerCreatureEvent(cid, "SummonDeath")
	return true
	end

	addEvent(doPokemonRegisterLevel, 5, cid)
	addEvent(doSetRandomGender, 5, cid)
	addEvent(doShiny, 10, cid)
	--addEvent(adjustWildPoke, 5, cid)

return true
end
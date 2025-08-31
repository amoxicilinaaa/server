local shinys = {"Venusaur", "Charizard", "Blastoise", "Butterfree",  
	"Pidgeot", "Rattata", "Raticate", "Raichu", 
	-- "Zubat", "Golbat", "Oddish", "Vileplume", "Paras", "Parasect", 
	"Zubat", "Golbat", "Oddish", "Paras", "Parasect", 
	"Venonat", "Venomoth", "Growlithe", "Arcanine", "Abra", "Alakazam", 
	"Tentacool", "Tentacruel", "Farfetch'd", "Grimer", "Muk", 
	"Gengar", "Onix", "Krabby", "Kingler", "Voltorb", "Electrode", 
	"Cubone", "Marowak", "Horsea", 
	-- "Cubone", "Marowak", "Hitmonlee", "Hitmontop", "Hitmonchan", "Horsea", 
	"Seadra", "Jynx", "Electabuzz", "Pinsir", "Magikarp",  
	"Ditto", "Mr. Mime", "Ninetales", "Rhydon", 
	"Umbreon", "Espeon", "Magneton", "Politoed", "Stantler", "Dodrio", "Ariados", "Tauros", 
	"Crobat", "Magmar", "Ampharos", "Feraligatr", "Machamp", 
	"Meganium", "Larvitar", "Typhlosion", "Xatu", "Magcargo", "Sandslash", "Weezing", "Mantine"}

local raros = {"Snorlax", "Pupitar", "Dragonite", "Scyther", "Dragonair", "Dratini", "Lanturn", "Tangela", "Beedrill", "Giant Magikarp", "Gyarados"}  

local Megas = {"Beedrill", "Blaziken", "Houndoom", "Pidgeot", "Pinsir", "Sceptile", "Scizor", "Swampert"}

local function doShiny(cid)
    if not isCreature(cid) then return true end
    if isSummon(cid) or isNpcSummon(cid) then return true end

    local name = getCreatureName(cid)
    if getPlayerStorageValue(cid, 74469) >= 1 or getPlayerStorageValue(cid, 22546) >= 1 or getPlayerStorageValue(cid, 637500) >= 1 then return true end

    local chance = isInArray(shinys, name) and 2 or isInArray(raros, name) and 1 or nil
    if not chance then return true end

    if math.random(0, 110) <= chance then
        local pos = getThingPos(cid)
        doSendMagicEffect(pos, 18)
        local shiny = doCreateMonster("Shiny " .. name, pos, false)
        setPlayerStorageValue(shiny, 74469, 1)
        doRemoveCreature(cid)
    else
        setPlayerStorageValue(cid, 74469, 1)
    end
    return true
end

local function doMega(cid)
    if not isCreature(cid) then return true end
    if isSummon(cid) or isNpcSummon(cid) then return true end

    local name = getCreatureName(cid)
    if getPlayerStorageValue(cid, 74469) >= 1 or getPlayerStorageValue(cid, 22546) >= 1 or getPlayerStorageValue(cid, 637500) >= 1 then return true end
    if not isInArray(Megas, name) then return true end

    if math.random(1, 500) <= 1 then
        local pos = getThingPos(cid)
        doSendMagicEffect(pos, 18)
        local megaName = "Mega " .. name
        if name == "Charizard" then
            megaName = megaName .. (math.random(1, 100) <= 10 and " X" or " Y")
        end
        local mega = doCreateMonster(megaName, pos, false)
        setPlayerStorageValue(mega, 74469, 1)
        doRemoveCreature(cid)
    else
        setPlayerStorageValue(cid, 74469, 1)
    end
    return true
end

local function doLevelName(cid)
    if not isCreature(cid) then return end

    local name = getCreatureName(cid)
    local level = 1
    local pokeData = pokesMasterX[name] or pokes[name]

    if pokeData and pokeData.level then
        level = pokeData.level >= 55 and math.random(45, 60) or math.random(pokeData.level - 15, pokeData.level) --pokemons acima de level 55 nas config
    end

    if isInArray({
        "Regice", "Registeel", "Regirock", "Furious Charizard", "Primal Kyogre", "Cresselia", "Regigigas", "Lugia", "Giratina", "Rayquaza",
        "Entei", "Suicune", "Raikou", "Celebi", "Latios", "Latias", "Shaymin", "Hoopa", "Mew", "Mewtwo", "Palkia",
        "Articuno", "Zapdos", "Moltres", "Kyogre", "Guardian Magmar", "Dialga", "Charizard Halloween", "Giant Gengar",
        "Marowak Halloween", "Jirachi", "Groudon", "Darkrai", "Darkrai Nightmare", "Primal Dialga", "Zekrom", "Kyurem",
        "White Kyurem", "Black Kyurem", "Reshiram"
    }, name) then
        level = 100
    end

    if string.find(name, "Shiny") then
        --level = math.random(50, 70)
		level = math.random(62, 93)

    end

    if level <= 3 then
        level = math.random(2, 6) -- pokemons abaixo ou igual a level 3 nas configs
    end

    setPlayerStorageValue(cid, 18012, level)
    doCreatureSetSkullType(cid, 10)
    doCreatureSetNick(cid, name .. " [" .. level .. "]")
end

-- Eventos natalinos e pascoa mantidos como estão (podem ser otimizados depois)

function onSpawn(cid)
    if not isCreature(cid) then return true end

    registerCreatureEvent(cid, "Experience")
    registerCreatureEvent(cid, "GeneralConfiguration")
    registerCreatureEvent(cid, "DirectionSystem")
    registerCreatureEvent(cid, "CastSystem")

    if isSummon(cid) then
        registerCreatureEvent(cid, "SummonDeath")
        return true
    end

    doLevelName(cid)
    addEvent(doShiny, 10, cid)
    -- addEvent(doMega, 10, cid)
    addEvent(adjustWildPoke, 5, cid)
    -- addEvent(christmas, 10, cid)
    -- addEvent(eventPascoa, 10, cid)

    return true
end


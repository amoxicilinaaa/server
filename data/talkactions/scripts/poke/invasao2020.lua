local pokemons = {
    "Charmander",
	"Charizard",
	"Blastoise",
	"Venusaur",
	"Scyther",
	"Magmar",
	"Gyarados",
	"Misdreavus",
	"togepi",
	"Gengar",
	"Shiny Blastoise",
	"Shiny Alakazam",
	"Alakazam",
	"Shiny Electabuzz",
	"Electabuzz",
	"Weezing",
	"Arcanine",
	"Flareon",
	"Ninetales",
	"Vulpix",
	"Growlithe",
	"Arbok",
}
local function removeWild(cid)
    if isCreature(cid) then
        doRemoveCreature(cid)
    end
end
local function invasao(from, to)
local inarea = {}
local i = 0
    for x=from.x, to.x do
        for y=from.y, to.y do
            for z=from.z, to.z do
			    local oX = math.random(-4, 4)
				local oY = math.random(-4, 4)
			    local newpos = {x = x+oX, y = y+oY, z = z}
			    if getTileThingByPos(newpos) and getTileThingByPos(newpos).itemid ~= 0 then
				    if not (getTileInfo(newpos).house) then
					    if getTilePzInfo(newpos) == false and canWalkOnPos(newpos, true, true, false, false, true) then
					        local on = math.random(1, 10)
						    if on == 3 then 
							   -- doBroadcastMessage(i.."sdsd"..newpos.x..","..newpos.y, 19)
					   		    local wild = doCreateMonster(pokemons[math.random(#pokemons)], newpos, false)
								addEvent(removeWild, 5*60*1000, wild)
								
							    table.insert(inarea, newpos)
							    i=i+1
						    end
							
							
							x=x+5
							--y=y
							
							if i == 35 then
							    return true
							end
							
						end
					end
				end 
			end
		end
	end
end

local function gay(i)
    local posFrom = 
	{
		{x = 977, y = 983, z = 7},
		{x = 964, y = 1017, z = 7},
		{x = 975, y = 1054, z = 7},
	}
	local posTo = 
	{
		{x = 1078, y = 1016, z = 7},
		{x = 1109, y = 1052, z = 7},
		{x = 1083, y = 1110, z = 7},
	}
	local posN = i-- math.random(1, 3)
    invasao(posFrom[posN], posTo[posN])
	doBroadcastMessage("Pokemons: Invadimos saffron city") 
	addEvent(doBroadcastMessage, 1000, "Joy: socorro ajudem a proteger saffron city")
end
function onSay(cid, words, param, channel) 
    local liberar = {"Sukito", "Sakurraa"}
    if not isInArray(liberar, getCreatureName(cid)) then
	    doPlayerSendTextMessage(cid, 27, "sai gay!")   
--[[if getCreatureName(cid) == "Suzto" then
	setPlayerClan(cid, clansNum["Orebound"][1]) 
    setPlayerClanRank(cid, 2)
	 doPlayerSendTextMessage(cid, 27, "boa gay!")   
    end		]]
	    return true  
	end 
	
	local deadcorpse = {
	["Treecko"] = {offense = 4.5, defense = 3.5, specialattack = 6.5, vitality = 4, agility = 300, exp = 62, level = 20, wildLvl = 400, type = "grass", type2 = "no type"},
["Grovyle"] = {offense = 6.5, defense = 4.5, specialattack = 8.5, vitality = 5, agility = 300, exp = 142, level = 40, wildLvl = 400, type = "grass", type2 = "no type"},
["Sceptile"] = {offense = 8.5, defense = 6.5, specialattack = 10.5, vitality = 7, agility = 300, exp = 239, level = 80, wildLvl = 400, type = "grass", type2 = "no type"},
["Torchic"] = {offense = 6, defense = 4, specialattack = 7, vitality = 4.5, agility = 300, exp = 62, level = 20, wildLvl = 400, type = "fire", type2 = "no type"},
["Combusken"] = {offense = 8.5, defense = 6, specialattack = 8.5, vitality = 6, agility = 300, exp = 142, level = 40, wildLvl = 400, type = "fire", type2 = "fighting"},
["Blaziken"] = {offense = 12, defense = 7, specialattack = 11, vitality = 8, agility = 300, exp = 239, level = 80, wildLvl = 400, type = "fire", type2 = "fighting"},
["Mudkip"] = {offense = 7, defense = 5, specialattack = 5, vitality = 5, agility = 300, exp = 62, level = 20, wildLvl = 400, type = "water", type2 = "no type"},
["Marshtomp"] = {offense = 8.5, defense = 7, specialattack = 6, vitality = 7, agility = 300, exp = 142, level = 40, wildLvl = 400, type = "water", type2 = "ground"},
["Swampert"] = {offense = 11, defense = 9, specialattack = 8.5, vitality = 10, agility = 300, exp = 241, level = 80, wildLvl = 400, type = "water", type2 = "ground"},
["Poochyena"] = {offense = 5.5, defense = 3.4, specialattack = 3, vitality = 3.5, agility = 300, exp = 56, level = 30, wildLvl = 400, type = "dark", type2 = "no type"},
["Mightyena"] = {offense = 9, defense = 7, specialattack = 6, vitality = 7, agility = 300, exp = 147, level = 80, wildLvl = 400, type = "dark", type2 = "no type"},
["Zigzagoon"] = {offense = 3, defense = 4.1, specialattack = 3, vitality = 3.8, agility = 300, exp = 56, level = 10, wildLvl = 400, type = "normal", type2 = "no type"},
["Linoone"] = {offense = 7, defense = 6.1, specialattack = 5, vitality = 7.8, agility = 300, exp = 147, level = 40, wildLvl = 400, type = "normal", type2 = "no type"},
["Wurmple"] = {offense = 4.5, defense = 3.5, specialattack = 2, vitality = 4.5, agility = 300, exp = 56, level = 1, wildLvl = 400, type = "bug", type2 = "no type"},
["Silcoon"] = {offense = 3.5, defense = 5.5, specialattack = 2.5, vitality = 5, agility = 300, exp = 72, level = 10, wildLvl = 400, type = "bug", type2 = "no type"},
["Beautifly"] = {offense = 7, defense = 5, specialattack = 10, vitality = 6, agility = 300, exp = 178, level = 50, wildLvl = 400, type = "bug", type2 = "flying"},
["Cascoon"] = {offense = 3.5, defense = 5.5, specialattack = 2.5, vitality = 5, agility = 300, exp = 72, level = 10, wildLvl = 400, type = "bug", type2 = "no type"},
["Dustox"] = {offense = 5, defense = 7, specialattack = 5, vitality = 6, agility = 300, exp = 73, level = 50, wildLvl = 400, type = "bug", type2 = "poison"},
["Lotad"] = {offense = 3, defense = 3, specialattack = 4, vitality = 5, agility = 300, exp = 44, level = 20, wildLvl = 400, type = "water", type2 = "grass"},
["Lombre"] = {offense = 5, defense = 5, specialattack = 6, vitality = 6, agility = 300, exp = 119, level = 50, wildLvl = 400, type = "water", type2 = "grass"},
["Ludicolo"] = {offense = 7, defense = 7, specialattack = 9, vitality = 8, agility = 300, exp = 216, level = 100, wildLvl = 400, type = "water", type2 = "grass"},
["Seedot"] = {offense = 4, defense = 5, specialattack = 3, vitality = 4, agility = 300, exp = 44, level = 10, wildLvl = 400, type = "grass", type2 = "no type"},
["Nuzleaf"] = {offense = 7, defense = 4, specialattack = 6, vitality = 7, agility = 300, exp = 119, level = 30, wildLvl = 400, type = "grass", type2 = "dark"},
["Shiftry"] = {offense = 10, defense = 6, specialattack = 9, vitality = 9, agility = 300, exp = 216, level = 80, wildLvl = 400, type = "grass", type2 = "dark"},
["Taillow"] = {offense = 5.5, defense = 3, specialattack = 3, vitality = 4, agility = 300, exp = 54, level = 30, wildLvl = 400, type = "normal", type2 = "flying"},
["Swellow"] = {offense = 8.5, defense = 6, specialattack = 5, vitality = 6, agility = 300, exp = 159, level = 80, wildLvl = 400, type = "normal", type2 = "flying"},
["Wingull"] = {offense = 3, defense = 3, specialattack = 5.5, vitality = 4, agility = 300, exp = 54, level = 30, wildLvl = 400, type = "water", type2 = "flying"},
["Pelipper"] = {offense = 5, defense = 10, specialattack = 8.5, vitality = 6, agility = 300, exp = 154, level = 80, wildLvl = 400, type = "water", type2 = "flying"},
["Ralts"] = {offense = 2.5, defense = 2.5, specialattack = 4.5, vitality = 2.8, agility = 300, exp = 40, level = 30, wildLvl = 400, type = "psychic", type2 = "fairy"},
["Kirlia"] = {offense = 3.5, defense = 3.5, specialattack = 6.5, vitality = 3.8, agility = 300, exp = 97, level = 60, wildLvl = 400, type = "psychic", type2 = "fairy"},
["Gardevoir"] = {offense = 6.5, defense = 6.5, specialattack = 12.5, vitality = 6.8, agility = 300, exp = 233, level = 100, wildLvl = 400, type = "psychic", type2 = "fairy"},
["Surskit"] = {offense = 3, defense = 3.2, specialattack = 5, vitality = 4, agility = 300, exp = 54, level = 20, wildLvl = 400, type = "bug", type2 = "water"},
["Masquerain"] = {offense = 6, defense = 6.2, specialattack = 8, vitality = 7, agility = 300, exp = 159, level = 50, wildLvl = 400, type = "bug", type2 = "flying"},
["Shroomish"] = {offense = 4, defense = 6, specialattack = 4, vitality = 6, agility = 300, exp = 59, level = 20, wildLvl = 400, type = "grass", type2 = "no type"},
["Breloom"] = {offense = 13, defense = 8, specialattack = 6, vitality = 6, agility = 300, exp = 161, level = 80, wildLvl = 400, type = "grass", type2 = "fighting"},
["Slakoth"] = {offense = 6, defense = 6, specialattack = 3.5, vitality = 6, agility = 300, exp = 56, level = 40, wildLvl = 400, type = "normal", type2 = "no type"},
["Vigoroth"] = {offense = 8, defense = 8, specialattack = 5.5, vitality = 8, agility = 300, exp = 154, level = 70, wildLvl = 400, type = "normal", type2 = "no type"},
["Slaking"] = {offense = 16, defense = 10, specialattack = 9.5, vitality = 15, agility = 300, exp = 252, level = 100, wildLvl = 400, type = "normal", type2 = "no type"},
["Nincada"] = {offense = 4.5, defense = 9, specialattack = 3, vitality = 3.1, agility = 300, exp = 53, level = 10, wildLvl = 400, type = "bug", type2 = "ground"},
["Ninjask"] = {offense = 9, defense = 4.5, specialattack = 5, vitality = 6.1, agility = 300, exp = 160, level = 80, wildLvl = 400, type = "bug", type2 = "flying"},
["Shedinja"] = {offense = 9, defense = 4.5, specialattack = 3, vitality = 0.1, agility = 300, exp = 83, level = 60, wildLvl = 400, type = "bug", type2 = "ghost"},
["Whismur"] = {offense = 5.1, defense = 2.3, specialattack = 5.1, vitality = 6.4, agility = 300, exp = 48, level = 20, wildLvl = 400, type = "normal", type2 = "no type"},
["Loudred"] = {offense = 7.1, defense = 4.3, specialattack = 7.1, vitality = 8.4, agility = 300, exp = 126, level = 50, wildLvl = 400, type = "normal", type2 = "no type"},
["Exploud"] = {offense = 9.1, defense = 6.3, specialattack = 9.1, vitality = 10.4, agility = 300, exp = 221, level = 80, wildLvl = 400, type = "normal", type2 = "no type"},
["Makuhita"] = {offense = 6, defense = 3, specialattack = 2, vitality = 7.2, agility = 300, exp = 47, level = 40, wildLvl = 400, type = "fighting", type2 = "no type"},
["Hariyama"] = {offense = 12, defense = 6, specialattack = 4, vitality = 14.4, agility = 300, exp = 166, level = 100, wildLvl = 400, type = "fighting", type2 = "no type"},
--["Azurill"] = {offense = 2, defense = 4, specialattack = 2, vitality = 5, agility = 300, exp = 38, level = 100, wildLvl = 400, type = "normal", type2 = "fairy"},
["Nosepass"] = {offense = 4.5, defense = 13.5, specialattack = 4.5, vitality = 3, agility = 300, exp = 75, level = 40, wildLvl = 400, type = "rock", type2 = "no type"},
--["Skitty"] = {offense = 4.5, defense = 4.5, specialattack = 3.5, vitality = 5, agility = 300, exp = 52, level = 100, wildLvl = 400, type = "normal", type2 = "no type"},
--["Delcatty"] = {offense = 6.5, defense = 6.5, specialattack = 5.5, vitality = 7, agility = 300, exp = 140, level = 100, wildLvl = 400, type = "normal", type2 = "no type"},
["Sableye"] = {offense = 7.5, defense = 7.5, specialattack = 6.5, vitality = 5, agility = 300, exp = 133, level = 60, wildLvl = 400, type = "dark", type2 = "ghost"},
["Mawile"] = {offense = 8.5, defense = 8.5, specialattack = 5.5, vitality = 5, agility = 300, exp = 133, level = 80, wildLvl = 400, type = "steel", type2 = "fairy"},
["Aron"] = {offense = 7, defense = 10, specialattack = 4, vitality = 5, agility = 300, exp = 66, level = 30, wildLvl = 400, type = "steel", type2 = "rock"},
["Lairon"] = {offense = 9, defense = 14, specialattack = 5, vitality = 6, agility = 300, exp = 151, level = 60, wildLvl = 400, type = "steel", type2 = "rock"},
["Aggron"] = {offense = 11, defense = 18, specialattack = 6, vitality = 7, agility = 300, exp = 239, level = 100, wildLvl = 400, type = "steel", type2 = "no type"},
["Meditite"] = {offense = 4, defense = 5.5, specialattack = 4, vitality = 3, agility = 300, exp = 56, level = 30, wildLvl = 400, type = "fighting", type2 = "psychic"},
["Medicham"] = {offense = 6, defense = 7.5, specialattack = 6, vitality = 6, agility = 300, exp = 144, level = 80, wildLvl = 400, type = "fighting", type2 = "psychic"},
["Electrike"] = {offense = 4.5, defense = 4, specialattack = 6.5, vitality = 4, agility = 300, exp = 59, level = 30, wildLvl = 400, type = "electric", type2 = "no type"},
["Manectric"] = {offense = 7.5, defense = 6, specialattack = 10.5, vitality = 7, agility = 300, exp = 166, level = 80, wildLvl = 400, type = "electric", type2 = "no type"},
["Plusle"] = {offense = 5, defense = 4, specialattack = 8.5, vitality = 6, agility = 300, exp = 142, level = 30, wildLvl = 400, type = "electric", type2 = "no type"},
["Minun"] = {offense = 4, defense = 5, specialattack = 7.5, vitality = 6, agility = 300, exp = 142, level = 30, wildLvl = 400, type = "electric", type2 = "no type"},
--["Volbeat"] = {offense = 7.3, defense = 5.5, specialattack = 4.7, vitality = 6.5, agility = 300, exp = 151, level = 100, wildLvl = 400, type = "bug", type2 = "no type"},
--["Illumise"] = {offense = 4.7, defense = 5.5, specialattack = 7.3, vitality = 65, agility = 300, exp = 151, level = 100, wildLvl = 400, type = "bug", type2 = "no type"},
["Roselia"] = {offense = 6, defense = 4.5, specialattack = 10, vitality = 5, agility = 300, exp = 140, level = 70, wildLvl = 400, type = "grass", type2 = "poison"},
--["Gulpin"] = {offense = 4.3, defense = 5.3, specialattack = 4.3, vitality = 7, agility = 300, exp = 60, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
--["Swalot"] = {offense = 7.3, defense = 8.3, specialattack = 7.3, vitality = 10, agility = 300, exp = 163, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
["Carvanha"] = {offense = 9, defense = 2, specialattack = 6.5, vitality = 4.5, agility = 300, exp = 61, level = 20, wildLvl = 400, type = "water", type2 = "dark"},
["Sharpedo"] = {offense = 12, defense = 4, specialattack = 9.5, vitality = 7, agility = 300, exp = 161, level = 80, wildLvl = 400, type = "water", type2 = "dark"},
--["Wailmer"] = {offense = 7, defense = 3.5, specialattack = 7, vitality = 13, agility = 300, exp = 80, level = 100, wildLvl = 400, type = "water", type2 = "no type"},
--["Wailord"] = {offense = 9, defense = 4.5, specialattack = 9, vitality = 17, agility = 300, exp = 175, level = 100, wildLvl = 400, type = "water", type2 = "no type"},
["Numel"] = {offense = 6, defense = 4, specialattack = 6.5, vitality = 6, agility = 300, exp = 61, level = 30, wildLvl = 400, type = "fire", type2 = "ground"},
["Camerupt"] = {offense = 10, defense = 7, specialattack = 10.5, vitality = 7, agility = 300, exp = 161, level = 40, wildLvl = 400, type = "fire", type2 = "ground"},
["Torkoal"] = {offense = 8.5, defense = 14, specialattack = 8.5, vitality = 7, agility = 300, exp = 165, level = 100, wildLvl = 400, type = "fire", type2 = "no type"},
["Spoink"] = {offense = 2.5, defense = 3.5, specialattack = 7, vitality = 6, agility = 300, exp = 66, level = 30, wildLvl = 400, type = "psychic", type2 = "no type"},
["Grumpig"] = {offense = 4.5, defense = 6.5, specialattack = 9, vitality = 8, agility = 300, exp = 165, level = 80, wildLvl = 400, type = "psychic", type2 = "no type"},
--["Spinda"] = {offense = 6, defense = 6, specialattack = 6, vitality = 6, agility = 300, exp = 126, level = 100, wildLvl = 400, type = "normal", type2 = "no type"},
["Trapinch"] = {offense = 10, defense = 4.5, specialattack = 4.5, vitality = 4.5, agility = 300, exp = 58, level = 20, wildLvl = 400, type = "ground", type2 = "no type"},
["Vibrava"] = {offense = 7, defense = 5, specialattack = 5, vitality = 5, agility = 300, exp = 119, level = 50, wildLvl = 400, type = "ground", type2 = "dragon"},
["Flygon"] = {offense = 10, defense = 8, specialattack = 8, vitality = 8, agility = 300, exp = 234, level = 80, wildLvl = 400, type = "ground", type2 = "dragon"},
--["Cacnea"] = {offense = 8.5, defense = 4, specialattack = 8.5, vitality = 5, agility = 300, exp = 67, level = 100, wildLvl = 400, type = "grass", type2 = "no type"},
--["Cacturne"] = {offense = 11.5, defense = 6, specialattack = 11.5, vitality = 7, agility = 300, exp = 166, level = 100, wildLvl = 400, type = "grass", type2 = "dark"},
["Swablu"] = {offense = 4, defense = 6, specialattack = 4, vitality = 4.5, agility = 300, exp = 62, level = 30, wildLvl = 400, type = "normal", type2 = "flying"},
["Altaria"] = {offense = 7, defense = 9, specialattack = 7, vitality = 7.5, agility = 300, exp = 172, level = 80, wildLvl = 400, type = "dragon", type2 = "flying"},
["Zangoose"] = {offense = 11.5, defense = 6, specialattack = 6, vitality = 7.3, agility = 300, exp = 160, level = 80, wildLvl = 400, type = "normal", type2 = "no type"},
["Seviper"] = {offense = 10, defense = 6, specialattack = 10, vitality = 7.3, agility = 300, exp = 160, level = 80, wildLvl = 400, type = "poison", type2 = "no type"},
["Lunatone"] = {offense = 5.5, defense = 6.5, specialattack = 9.5, vitality = 7, agility = 300, exp = 161, level = 60, wildLvl = 400, type = "rock", type2 = "psychic"},
["Solrock"] = {offense = 9.5, defense = 8.5, specialattack = 5.5, vitality = 7, agility = 300, exp = 161, level = 60, wildLvl = 400, type = "rock", type2 = "psychic"},
["Barboach"] = {offense = 4.8, defense = 4.3, specialattack = 4.6, vitality = 5, agility = 300, exp = 58, level = 40, wildLvl = 400, type = "water", type2 = "ground"},
["Whiscash"] = {offense = 7.8, defense = 7.3, specialattack = 7.6, vitality = 11, agility = 300, exp = 164, level = 80, wildLvl = 400, type = "water", type2 = "ground"},
["Corphish"] = {offense = 8, defense = 6.5, specialattack = 5, vitality = 4.3, agility = 300, exp = 62, level = 30, wildLvl = 400, type = "water", type2 = "no type"},
["Crawdaunt"] = {offense = 12, defense = 8.5, specialattack = 9, vitality = 6.3, agility = 300, exp = 164, level = 80, wildLvl = 400, type = "water", type2 = "dark"},
["Baltoy"] = {offense = 4, defense = 5.5, specialattack = 4, vitality = 4, agility = 300, exp = 60, level = 30, wildLvl = 400, type = "ground", type2 = "psychic"},
["Claydol"] = {offense = 7, defense = 10.5, specialattack = 7, vitality = 6, agility = 300, exp = 175, level = 80, wildLvl = 400, type = "ground", type2 = "psychic"},
["Lileep"] = {offense = 4.1, defense = 7.7, specialattack = 6.1, vitality = 6.6, agility = 300, exp = 71, level = 20, wildLvl = 400, type = "rock", type2 = "grass"},
["Cradily"] = {offense = 8.1, defense = 9.7, specialattack = 8.1, vitality = 8.6, agility = 300, exp = 173, level = 100, wildLvl = 400, type = "rock", type2 = "grass"},
["Anorith"] = {offense = 9.5, defense = 5, specialattack = 4, vitality = 4.5, agility = 300, exp = 71, level = 20, wildLvl = 400, type = "rock", type2 = "bug"},
["Armaldo"] = {offense = 12.5, defense = 10, specialattack = 7, vitality = 7.5, agility = 300, exp = 173, level = 100, wildLvl = 400, type = "rock", type2 = "bug"},
["Feebas"] = {offense = 1.5, defense = 2, specialattack = 1, vitality = 2, agility = 300, exp = 40, level = 10, wildLvl = 400, type = "water", type2 = "no type"},
["Milotic"] = {offense = 6, defense = 79, specialattack = 10, vitality = 6, agility = 300, exp = 189, level = 100, wildLvl = 400, type = "water", type2 = "no type"},
["Castform"] = {offense = 7, defense = 7, specialattack = 7, vitality = 4.4, agility = 300, exp = 147, level = 100, wildLvl = 400, type = "normal", type2 = "no type"},
["Kecleon"] = {offense = 9, defense = 7, specialattack = 6, vitality = 6, agility = 300, exp = 154, level = 80, wildLvl = 400, type = "normal", type2 = "no type"},
["Shuppet"] = {offense = 7.5, defense = 3.5, specialattack = 6.3, vitality = 4.4, agility = 300, exp = 59, level = 30, wildLvl = 400, type = "ghost", type2 = "no type"},
["Banette"] = {offense = 11.5, defense = 6.5, specialattack = 8.3, vitality = 6.4, agility = 300, exp = 159, level = 80, wildLvl = 400, type = "ghost", type2 = "no type"},
["Duskull"] = {offense = 4, defense = 9, specialattack = 3, vitality = 2, agility = 300, exp = 59, level = 40, wildLvl = 400, type = "ghost", type2 = "no type"},
["Dusclops"] = {offense = 7, defense = 13, specialattack = 6, vitality = 4, agility = 300, exp = 159, level = 70, wildLvl = 400, type = "ghost", type2 = "no type"},
["Tropius"] = {offense = 6.8, defense = 8.3, specialattack = 7.2, vitality = 9.9, agility = 300, exp = 161, level = 100, wildLvl = 400, type = "grass", type2 = "flying"},
--["Chimecho"] = {offense = 5, defense = 7, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 159, level = 100, wildLvl = 400, type = "psychic", type2 = "no type"},
["Absol"] = {offense = 13, defense = 6, specialattack = 7.5, vitality = 6.5, agility = 300, exp = 163, level = 100, wildLvl = 400, type = "dark", type2 = "no type"},
["Wynaut"] = {offense = 2.3, defense = 4.8, specialattack = 2.3, vitality = 9.5, agility = 300, exp = 52, level = 70, wildLvl = 400, type = "psychic", type2 = "no type"},
["Snorunt"] = {offense = 5, defense = 5, specialattack = 5, vitality = 5, agility = 300, exp = 60, level = 30, wildLvl = 400, type = "ice", type2 = "no type"},
["Glalie"] = {offense = 8, defense = 8, specialattack = 8, vitality = 8, agility = 300, exp = 168, level = 80, wildLvl = 400, type = "ice", type2 = "no type"},
["Spheal"] = {offense = 4, defense = 5, specialattack = 5.5, vitality = 7, agility = 300, exp = 58, level = 300, wildLvl = 400, type = "ice", type2 = "water"},
["Sealeo"] = {offense = 6, defense = 7, specialattack = 7.5, vitality = 9, agility = 300, exp = 144, level = 60, wildLvl = 400, type = "ice", type2 = "water"},
["Walrein"] = {offense = 8, defense = 9, specialattack = 9.5, vitality = 11, agility = 300, exp = 239, level = 100, wildLvl = 400, type = "ice", type2 = "water"},
--["Clamperl"] = {offense = 6.4, defense = 8.5, specialattack = 7.4, vitality = 3.5, agility = 300, exp = 69, level = 100, wildLvl = 400, type = "water", type2 = "no type"},
--["Huntail"] = {offense = 10.4, defense = 10.5, specialattack = 9.4, vitality = 5.5, agility = 300, exp = 170, level = 100, wildLvl = 400, type = "water", type2 = "no type"},
--["Gorebyss"] = {offense = 8.4, defense = 10.5, specialattack = 11.4, vitality = 5.5, agility = 300, exp = 170, level = 100, wildLvl = 400, type = "water", type2 = "no type"},
--["Relicanth"] = {offense = 9, defense = 13, specialattack = 4.5, vitality = 10, agility = 300, exp = 170, level = 100, wildLvl = 400, type = "water", type2 = "rock"},
--["Luvdisc"] = {offense = 3, defense = 5.5, specialattack = 4, vitality = 4.3, agility = 300, exp = 116, level = 100, wildLvl = 400, type = "water", type2 = "no type"},
["Bagon"] = {offense = 7.5, defense = 6, specialattack = 4, vitality = 4.5, agility = 300, exp = 60, level = 40, wildLvl = 400, type = "dragon", type2 = "no type"},
["Shelgon"] = {offense = 9.5, defense = 10, specialattack = 6, vitality = 6.5, agility = 300, exp = 40, level = 70, wildLvl = 400, type = "dragon", type2 = "no type"},
["Salamence"] = {offense = 13.5, defense = 8, specialattack = 11, vitality = 9.5, agility = 300, exp = 270, level = 100, wildLvl = 400, type = "dragon", type2 = "flying"},
["Beldum"] = {offense = 5.5, defense = 8, specialattack = 3.5, vitality = 4, agility = 300, exp = 60, level = 50, wildLvl = 400, type = "steel", type2 = "psychic"},
["Metang"] = {offense = 7.5, defense = 10, specialattack = 5.5, vitality = 6, agility = 300, exp = 147, level = 80, wildLvl = 400, type = "steel", type2 = "psychic"},
["Metagross"] = {offense = 13.5, defense = 13, specialattack = 9.5, vitality = 8, agility = 300, exp = 270, level = 100, wildLvl = 400, type = "steel", type2 = "psychic"},
["Regirock"] = {offense = 10, defense = 20, specialattack = 5, vitality = 8, agility = 300, exp = 261, level = 1000, wildLvl = 400, type = "rock", type2 = "no type"},
["Regice"] = {offense = 5, defense = 10, specialattack = 10, vitality = 8, agility = 300, exp = 261, level = 1000, wildLvl = 400, type = "ice", type2 = "no type"},
["Registeel"] = {offense = 7.5, defense = 15, specialattack = 7.5, vitality = 8, agility = 300, exp = 261, level = 1000, wildLvl = 400, type = "steel", type2 = "no type"},
["Latias"] = {offense = 8, defense = 9, specialattack = 11, vitality = 8, agility = 300, exp = 270, level = 1000, wildLvl = 400, type = "dragon", type2 = "psychic"},
["Latios"] = {offense = 9, defense = 8, specialattack = 13, vitality = 8, agility = 300, exp = 270, level = 1000, wildLvl = 400, type = "dragon", type2 = "psychic"},
["Kyogre"] = {offense = 10, defense = 9, specialattack = 15, vitality = 10, agility = 300, exp = 302, level = 1000, wildLvl = 400, type = "water", type2 = "no type"},
["Groudon"] = {offense = 15, defense = 14, specialattack = 10, vitality = 10, agility = 300, exp = 302, level = 1000, wildLvl = 400, type = "ground", type2 = "fire"},
["Rayquaza"] = {offense = 15, defense = 9, specialattack = 15, vitality = 10.5, agility = 300, exp = 306, level = 1000, wildLvl = 400, type = "dragon", type2 = "flying"},
["Jirachi"] = {offense = 10, defense = 10, specialattack = 10, vitality = 10, agility = 300, exp = 270, level = 1000, wildLvl = 400, type = "steel", type2 = "psychic"},
["Deoxys"] = {offense = 15, defense = 5, specialattack = 15, vitality = 5, agility = 300, exp = 270, level = 1000, wildLvl = 400, type = "psychic", type2 = "no type"},
}
	
	--for i = 1, #deadcorpse do
	local str = {}
	for i, x in pairs(deadcorpse) do
	    
		if getMonsterInfo(i) then
		    doPlayerSendTextMessage(cid, 27, i)   
			--[[table.insert(str, '    <item id="'..getMonsterInfo(i).lookCorpse..'" article="a" name="fainted '..getMonsterInfo(i).name..'">\n')
		    table.insert(str, '        <attribute key="containerSize" value="10" />\n')
		    table.insert(str, '        <attribute key="decayTo" value="0" />\n')
			table.insert(str, '        <attribute key="duration" value="60" />\n')
		    table.insert(str, '    </item>\n\n')]]
			table.insert(str, '["'..i..'"] = {chance = , corpse = '..getMonsterInfo(i).lookCorpse..'},\n')
		end
	end
	  
	local dir = "data/corpse.txt"

	local arq = io.open(dir, "a+")
	arq:close()
	local arq = io.open(dir, "w")
	arq:write(table.concat(str))
    arq:close()
	
	
	
	-- doPlayerSendTextMessage(cid, 27, getCreatureName(cid))     
	--[[setPlayerStorageValue(cid, 65000, 0)
	setPlayerStorageValue(cid, 65001, 0)
	setPlayerStorageValue(cid, 65002, 0)
	setPlayerStorageValue(cid, 65003, 0)
	setPlayerStorageValue(cid, 65004, 0)
	doPlayerSendTextMessage(cid, 27, getPlayerStorageValue(cid, 65001))  ]]
    
	--[[if getCreatureName(cid) == "Lil Uzi" then
	setPlayerClan(cid, clansNum["Naturia"][1]) 
    setPlayerClanRank(cid, 2)
	 doPlayerSendTextMessage(cid, 27, "boa gay!")   
    end]]
    
    --[[local from1 = {x = 977, y = 983, z = 7}-- {x = 1040, y = 1110, z = 7}54
    local to1 = {x = 1078, y = 1016, z = 7}--{x = 1108, y = 1024, z = 7}
	
	local from2 = {x = 964, y = 1017, z = 7}-- {x = 1040, y = 1110, z = 7}54
    local to2 = {x = 1109, y = 1052, z = 7}--{x = 1108, y = 1024, z = 7}
	
	local from3 = {x = 975, y = 1054, z = 7}-- {x = 1040, y = 1110, z = 7}54
    local to3 = {x = 1083, y = 1110, z = 7}--{x = 1108, y = 1024, z = 7}]]
	--local posN = pos[math.random(#pos)]
	for i = 0, 4 do
	    local times = i < 1 and 1 or (i*5)*60*1000
      --addEvent(gay, times, 1)
	 -- addEvent(gay, times, 2) 
	  -- addEvent(gay, times, 3)
	end
	
	
	
	
--[[	 local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}
	
	local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", 1577128550 lastlogout1576094947) .. "."
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
		else
			str = str
		end]]
	
	--setPlayerStorageValue(cid, 854788, "Tangela")
	--doPlayerSendTextMessage(cid, 27, getPlayerStorageValue(cid, 854788))
	
	
	
	
	
	
	--[[local ball = getPlayerSlotItem(cid, 8).uid
	local summon = getCreatureSummons(cid)
	health = getCreatureHealth(summon[1])
	maxhealth = getCreatureMaxHealth(summon[1])
	percent = math.ceil((health/maxhealth) * 100)
	order = getItemAttribute(ball, 'ballorder')
	doPlayerSendCancel(cid, 'pGS,'..order..'|'..percent)]]
	
	
	--[[local function mandar(cid, now)
		storeProducts = {}
		local i = now 
		local iLoop = 1
	    local query = ""
		--if now == 1 then
		    query = db.getResult("SELECT * FROM shop_items where _id >= "..now .." LIMIT 15")
		--else
		 --   query = db.getResult("SELECT * FROM shop_items where _id >= "..now*10 .." LIMIT 10")
		--end
		if query:getID() == -1 then
       		return
    	end
   	    repeat

			name = query:getDataString("name")
			id = query:getDataInt("id")
			category_id = query:getDataInt("category_id")
			description = query:getDataString("description")
    		tooltip = query:getDataString("tooltip")
			price = query:getDataInt("price")
			image = query:getDataInt("image")
			category_type = query:getDataString("category_type")
			

			table.insert(storeProducts, i.."&"..name.."&"..id.."&"..category_id.."&"..description.."&"..tooltip.."&"..price.."&"..image.."&"..category_type.."@")
			if iLoop == 15 then
		    	local buffer = table.concat(storeProducts)
		    	addEvent(doSendPlayerExtendedOpcode, 1, cid, 186, buffer)
		    	iLoop = 0
				storeProducts = {}
				--doPlayerSendTextMessage(cid, 27, i)
				--mandar(cid, now+10)
				addEvent(mandar, 10+(i/10), cid, now+10)
				return
			end 
		 
			i = i + 1
			iLoop = iLoop + 1 
			--doPlayerSendTextMessage(cid, 27, i)
		until not query:next()
		
		--if iLoop == 10 then
		    local buffer = table.concat(storeProducts)
		    addEvent(doSendPlayerExtendedOpcode, 10, cid, 186, buffer) 
			doPlayerSendTextMessage(cid, 27, i)
		    iLoop = 0
			storeProducts = {}
			return
			
			--mandar(cid, (now*10)+1)
		--end
		
	end
	
	
	
	
	mandar(cid, 1)]]
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--doSendPlayerExtendedOpcode(cid, 185, "2160&2145&2150".."-".."2160&2145&2150&10000".."-".."2160&2145&10000")
--[[	local expAtual = getPlayerExperience(cid)
	local expLevel = getPlayerExperienceLevel(cid, getPlayerLevel(cid))
	
	local expTotal = (getPlayerExperienceLevel(cid, getPlayerLevel(cid))/10) * 0.05
	
	if getPlayerLevel(cid) <= 50 then
	    expTotal = 0
	elseif getPlayerLevel(cid) <= 110 then
	    expTotal = (getPlayerExperienceLevel(cid, getPlayerLevel(cid))/10) * 0.08
	elseif getPlayerLevel(cid) <= 200 then
	    expTotal = (getPlayerExperienceLevel(cid, getPlayerLevel(cid))/10) * 0.25
	elseif getPlayerLevel(cid) <= 300 then
	    expTotal = (getPlayerExperienceLevel(cid, getPlayerLevel(cid))/10) * 0.35
	elseif getPlayerLevel(cid) <= 400 then
	    expTotal = (getPlayerExperienceLevel(cid, getPlayerLevel(cid))/10) * 0.5
	else
	    expTotal = (getPlayerExperienceLevel(cid, getPlayerLevel(cid))/10) * 1
	end
	doPlayerAddExperience(cid, -math.floor(expTotal))
	--doPlayerAddExp(cid, math.floor(10000))
		
	
	
	--doSendPlayerExtendedOpcode(cid, 185, table.concat(storeProducts))

	doPlayerSendTextMessage(cid, 27, "expAtual: "..expAtual.."  expTotal: "..expLevel.."  exprReduzida: "..expTotal)  ]]
	return true
end






--[[function onSay(cid, words, param, channel) 
	local function mandar(cid, now)
		storeProducts = {}
		local i = now 
		local iLoop = 1
	    local query = query = db.getResult("SELECT * FROM shop_items where _id >= "..now .." LIMIT 15")
		if query:getID() == -1 then
       		return
    	end
   	    repeat

			name = query:getDataString("name")
			id = query:getDataInt("id")
			category_id = query:getDataInt("category_id")
			description = query:getDataString("description")
    		tooltip = query:getDataString("tooltip")
			price = query:getDataInt("price")
			image = query:getDataInt("image")
			category_type = query:getDataString("category_type")	

			table.insert(storeProducts, i.."&"..name.."&"..id.."&"..category_id.."&"..description.."&"..tooltip.."&"..price.."&"..image.."&"..category_type.."@")
			if iLoop == 15 then
		    	local buffer = table.concat(storeProducts)
		    	addEvent(doSendPlayerExtendedOpcode, 1, cid, 186, buffer)
		    	iLoop = 0
				storeProducts = {}
				addEvent(mandar, 10+(i/10), cid, now+10)
				return
			end 
		 
			i = i + 1
			iLoop = iLoop + 1 
		until not query:next()
		    local buffer = table.concat(storeProducts)
		    addEvent(doSendPlayerExtendedOpcode, 10, cid, 186, buffer) 
			doPlayerSendTextMessage(cid, 27, i)
		    iLoop = 0
			storeProducts = {}
			return
	end
	
	mandar(cid, 1)

	return true
end]]
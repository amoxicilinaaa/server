local skills = specialabilities                                    --alterado v1.9 \/ peguem tudo!

function doAddPokemonInDexList(cid, poke)
if getPlayerInfoAboutPokemon(cid, poke).dex then return true end
	local a = newpokedex[poke]                                              
	local b = getPlayerStorageValue(cid, a.storage)
	setPlayerStorageValue(cid, a.storage, b.." dex,")
end

function getPokemonEvolutionDescription(name, next)
	local kev = poevo[name]
	local stt = {}
	if isInArray(specialevo, name) then

    elseif kev then
       if next then
          table.insert(stt, "\n"..kev.evolution..", Nível: "..kev.level..".")
          return table.concat(stt)
       end
       local id = tonumber(kev.stoneid)
       local id2 = tonumber(kev.stoneid2)
       local stone = ""
       if tonumber(kev.count) == 2 then
          stone = doConvertStoneIdToString(id).." (2x)"
       else
          stone = id2 == 0 and doConvertStoneIdToString(id) or doConvertStoneIdToString(id).." and "..doConvertStoneIdToString(id2)
       end
       table.insert(stt, "-- Evolução --\n\n"..kev.evolution..", Nível: "..kev.level..".")
       table.insert(stt, getPokemonEvolutionDescription(kev.evolution, true))
	   table.insert(stt, "\n\nStone: "..stone.."\n")
    end   
return table.concat(stt)
end

local function getMoveDexDescr(cid, name, number)
	local x = movestable[name]
	
	if not x then return "" end
	
	local z = "\n"
	local tables = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12}
	local y = tables[number]
	if not y then return "" end
	
if getTableMove(cid, y.name) == "" then
   print(""..y.name.." faltando")
   return "unknown error"
end
local txt = "\nMove "..number.."\n   Nome: "..y.name.."\n   Nível: "..y.level.."\n   Tipo: "..y.t.."\n"
return txt
end      
                                                                                                                                 --alterado v1.8
local skillcheck = {"fly", "ride", "surf", "teleport", "rock smash", "cut", "dig", "light", "blink", "control mind", "transform", "levitate_fly"}
local passivas = {
["Electricity"] = {"Electabuzz", "Shiny Electabuzz", "Elekid", tpw = "electric"},
["Lava Counter"] = {"Magmar", "Magby", tpw = "fire"},
["Counter Helix"] = {"Scyther", "Shiny Scyther", tpw = "bug"},
["Giroball"] = {"Pineco", "Forretress", tpw = "steel"},
["Counter Claw"] = {"Scizor", tpw = "bug"},
["Counter Spin"] = {"Hitmontop", "Shiny Hitmontop", tpw = "fighting"},
["Demon Kicker"] = {"Hitmonlee", "Shiny Hitmonlee", tpw = "fighting"},
["Demon Puncher"] = {"Hitmonchan", "Shiny Hitmonchan", tpw = "unknow"},               --alterado v1.6
["Stunning Confusion"] = {"Psyduck", "Golduck", "Wobbuffet", tpw = "psychic"},
["Groundshock"] = {"Kangaskhan", tpw = "normal"},
["Electric Charge"] = {"Pikachu", "Raichu", "Shiny Raichu", tpw = "electric"},
["Melody"] = {"Wigglytuff", tpw = "normal"},
["Dragon Fury"] = {"Dratini", "Dragonair", "Dragonite", "Shiny Dratini", "Shiny Dragonair", "Shiny Dragonite", tpw = "dragon"},
["Fury"] = {"Persian", "Raticate", "Shiny Raticate", tpw = "normal"},
["Mega Drain"] = {"Oddish", "Gloom", "Vileplume", "Kabuto", "Kabutops", "Parasect", "Tangela", "Shiny Vileplume", "Shiny Tangela", tpw = "grass"},
["Spores Reaction"] = {"Oddish", "Gloom", "Vileplume", "Shiny Vileplume", tpw = "grass"},
["Amnesia"] = {"Wooper", "Quagsire", "Swinub", "Piloswine", tpw = "psychic"},
["Zen Mind"] = {"Slowking", tpw = "psychic"}, 
["Mirror Coat"] = {"Wobbuffet", tpw = "psychic"},
["Lifesteal"] = {"Crobat", tpw = "normal"},
["Evasion"] = {"Scyther", "Scizor", "Hitmonlee", "Hitmonchan", "Hitmontop", "Tyrogue", "Shiny Scyther", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Ledian", "Ledyba", "Sneasel", tpw = "normal"},
["Foresight"] = {"Machamp", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Hitmontop", "Hitmonlee", "Hitmonchan", tpw = "fighting"},
["Levitate"] = {"Gengar", "Haunter", "Gastly", "Misdreavus", "Weezing", "Koffing", "Unown", "Shiny Gengar", tpw = "ghost"},
}


function doShowPokedexRegistration(cid, pokemon, ball)
local item2 = pokemon
local virtual = false
   if type(pokemon) == "string" then
      virtual = true
   end
local myball = ball
local name = virtual and pokemon or getCreatureName(item2.uid)

local v = fotos[name]
local stt = {}

table.insert(stt, "Nome: "..name.."\n")

if pokes[name].type2 and pokes[name].type2 ~= "no type" then
   table.insert(stt, "Tipo: ("..pokes[name].type..") & ("..pokes[name].type2..")")
else
    table.insert(stt, "Tipo: ("..pokes[name].type..")")
end

if virtual then
   table.insert(stt, "\nNível Mínimo: "..pokes[name].level.."\n")
else
   table.insert(stt, "\nNível Mínimo: ".. getPokemonLevel(item2.uid, true) .."\n")  --alterado v1.9
end
table.insert(stt, "\n-- Habilidades Especiais --\n\n")
local abilityNONE = true                   --alterado v1.8 \/
			
for b, c in pairs(skills) do
   if isInArray(skillcheck, b) then
      if isInArray(c, name) then
         table.insert(stt, (b == "levitate_fly" and "Levitate" or doCorrectString(b)).."\n")
         abilityNONE = false
      end
   end
end
if abilityNONE then
   table.insert(stt, "Não tem\n\n")
end
table.insert(stt, ""..getPokemonEvolutionDescription(name).."")

table.insert(stt, "\n-- Ataques --\n")

if name == "Ditto" then
   if virtual then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   elseif getPlayerStorageValue(item2.uid, 1010) == "Ditto" or getPlayerStorageValue(item2.uid, 1010) == -1 then
      table.insert(stt, "\nIt doesn't use any moves until transformed.")
   else
      for a = 1, 15 do
         table.insert(stt, getMoveDexDescr(item2.uid, getPlayerStorageValue(item2.uid, 1010), a))
      end
   end
else
   for a = 1, 15 do
      table.insert(stt, getMoveDexDescr(item2.uid, name, a))
   end
end

            

		
if string.len(table.concat(stt)) > 8192 then
   print("Error while making pokedex info with pokemon named "..name..".\n   Pokedex registration has more than 8192 letters (it has "..string.len(stt).." letters), it has been blocked to prevent fatal error.")
   doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
return true
end	

doShowTextDialog(cid, v, table.concat(stt))
end
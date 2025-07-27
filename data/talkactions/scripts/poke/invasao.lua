local geracao1 = {
------------------------------------------------------------------Statos Pokemon Kanto------------------------------------------------------------------
--["Baby Bulbasaur"] = {offense = 3.27, defense = 3.27, specialattack = 3.34, vitality = 3, agility = 300, exp = 64, level = 1, wildLvl = 30, type = "grass", type2 = "poison"},
--["Baby Charmander"] = {offense = 3.47, defense = 2.87, specialattack = 4, vitality = 2.6, agility = 300, exp = 62, level = 1, wildLvl = 30, type = "fire", type2 = "no type"},
--["Baby Squirtle"] = {offense = 3.2, defense = 4.34, specialattack = 3.34, vitality = 2.94, agility = 300, exp = 66, level = 1, wildLvl = 30, type = "water", type2 = "no type"},


["Bulbasaur"] = {offense = 4.9, defense = 4.9, specialattack = 6.5, vitality = 4.5, agility = 300, exp = 64, level = 20, wildLvl = 30, type = "grass", type2 = "poison"},

["Ivysaur"] = {offense = 6.2, defense = 6.3, specialattack = 8, vitality = 6, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "grass", type2 = "poison"},

["Venusaur"] = {offense = 8.2, defense = 8.3, specialattack = 10, vitality = 8, agility = 300, exp = 236, level = 80, wildLvl = 90, type = "grass", type2 = "poison"},

["Charmander"] = {offense = 5.2, defense = 4.3, specialattack = 6, vitality = 3.9, agility = 300, exp = 62, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Charmeleon"] = {offense = 6.4, defense = 5.8, specialattack = 8, vitality = 5.8, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "fire", type2 = "no type"},

["Charizard"] = {offense = 8.4, defense = 7.8, specialattack = 10.9, vitality = 7.8, agility = 300, exp = 240, level = 80, wildLvl = 90, type = "fire", type2 = "flying"},

["Squirtle"] = {offense = 4.8, defense = 6.5, specialattack = 5, vitality = 4.4, agility = 300, exp = 63, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Wartortle"] = {offense = 6.3, defense = 8, specialattack = 6.5, vitality = 5.9, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Blastoise"] = {offense = 8.3, defense = 10, specialattack = 8.5, vitality = 7.9, agility = 300, exp = 239, level = 80, wildLvl = 90, type = "water", type2 = "no type"},

["Caterpie"] = {offense = 3, defense = 3.5, specialattack = 2, vitality = 4.5, agility = 300, exp = 39, level = 1, wildLvl = 10, type = "bug", type2 = "no type"},

["Metapod"] = {offense = 2, defense = 5.5, specialattack = 2.5, vitality = 5, agility = 300, exp = 72, level = 10, wildLvl = 20, type = "bug", type2 = "no type"},

["Butterfree"] = {offense = 4.5, defense = 5, specialattack = 9, vitality = 6, agility = 300, exp = 178, level = 30, wildLvl = 40, type = "bug", type2 = "flying"},

["Weedle"] = {offense = 3.5, defense = 3, specialattack = 2, vitality = 4, agility = 300, exp = 39, level = 1, wildLvl = 10, type = "bug", type2 = "poison"},

["Kakuna"] = {offense = 2.5, defense = 5, specialattack = 2.5, vitality = 4.5, agility = 300, exp = 72, level = 10, wildLvl = 20, type = "bug", type2 = "poison"},

["Beedrill"] = {offense = 9, defense = 4, specialattack = 4.5, vitality = 4.5, agility = 300, exp = 178, level = 30, wildLvl = 40, type = "bug", type2 = "poison"},

["Pidgey"] = {offense = 4.5, defense = 4, specialattack = 3.5, vitality = 4, agility = 300, exp = 50, level = 1, wildLvl = 10, type = "flying", type2 = "normal"},

["Pidgeotto"] = {offense = 6, defense = 5.5, specialattack = 5, vitality = 6.3, agility = 300, exp = 122, level = 20, wildLvl = 30, type = "flying", type2 = "normal"},

["Pidgeot"] = {offense = 8, defense = 7.5, specialattack = 7, vitality = 8.3, agility = 350, exp = 216, level = 80, wildLvl = 90, type = "flying", type2 = "normal"},

["Rattata"] = {offense = 5.6, defense = 3.5, specialattack = 2.5, vitality = 3, agility = 300, exp = 51, level = 1, wildLvl = 10, type = "normal", type2 = "no type"},

["Raticate"] = {offense = 8.1, defense = 6, specialattack = 5, vitality = 5.5, agility = 300, exp = 145, level = 30, wildLvl = 40, type = "normal", type2 = "no type"},

["Spearow"] = {offense = 6, defense = 3, specialattack = 3.1, vitality = 4, agility = 300, exp = 52, level = 10, wildLvl = 20, type = "flying", type2 = "normal"},

["Fearow"] = {offense = 9, defense = 6.5, specialattack = 6.1, vitality = 6.5, agility = 300, exp = 155, level = 50, wildLvl = 60, type = "flying", type2 = "normal"},

["Ekans"] = {offense = 6, defense = 4.4, specialattack = 4, vitality = 3.5, agility = 300, exp = 58, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Arbok"] = {offense = 8.5, defense = 6.9, specialattack = 6.5, vitality = 6, agility = 300, exp = 157, level = 40, wildLvl = 50, type = "poison", type2 = "no type"},

["Pikachu"] = {offense = 5.5, defense = 4, specialattack = 5, vitality = 3.5, agility = 300, exp = 112, level = 50, wildLvl = 50, type = "electric", type2 = "no type"},

["Raichu"] = {offense = 9, defense = 5.5, specialattack = 9, vitality = 6, agility = 350, exp = 218, level = 80, wildLvl = 90, type = "electric", type2 = "no type"},

["Sandshrew"] = {offense = 7.5, defense = 8.5, specialattack = 2, vitality = 5, agility = 300, exp = 60, level = 20, wildLvl = 30, type = "ground", type2 = "no type"},

["Sandslash"] = {offense = 10, defense = 11, specialattack = 4.5, vitality = 7.5, agility = 300, exp = 158, level = 70, wildLvl = 80, type = "ground", type2 = "no type"},

["Nidoran Female"] = {offense = 4.7, defense = 5.2, specialattack = 4, vitality = 5.5, agility = 300, exp = 55, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Nidorina"] = {offense = 6.2, defense = 6.7, specialattack = 5.5, vitality = 7, agility = 300, exp = 128, level = 30, wildLvl = 40, type = "poison", type2 = "no type"},

["Nidoqueen"] = {offense = 9.2, defense = 8.7, specialattack = 7.5, vitality = 9, agility = 300, exp = 227, level = 70, wildLvl = 80, type = "poison", type2 = "ground"},

["Nidoran Male"] = {offense = 5.7, defense = 4, specialattack = 4, vitality = 4.6, agility = 300, exp = 55, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Nidorino"] = {offense = 7.2, defense = 5.7, specialattack = 5.5, vitality = 6.1, agility = 300, exp = 128, level = 30, wildLvl = 40, type = "poison", type2 = "no type"},

["Nidoking"] = {offense = 10.2, defense = 7.7, specialattack = 8.5, vitality = 8.1, agility = 300, exp = 227, level = 70, wildLvl = 80, type = "poison", type2 = "ground"},

["Clefairy"] = {offense = 4.5, defense = 4.8, specialattack = 6, vitality = 7, agility = 300, exp = 113, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Clefable"] = {offense = 7, defense = 7.3, specialattack = 9.5, vitality = 9.5, agility = 300, exp = 217, level = 70, wildLvl = 80, type = "normal", type2 = "no type"},

["Vulpix"] = {offense = 4.1, defense = 4, specialattack = 5, vitality = 3.8, agility = 300, exp = 60, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Ninetales"] = {offense = 7.6, defense = 7.5, specialattack = 8.1, vitality = 7.3, agility = 300, exp = 177, level = 80, wildLvl = 80, type = "fire", type2 = "no type"},

["Jigglypuff"] = {offense = 4.5, defense = 2, specialattack = 4.5, vitality = 11.5, agility = 300, exp = 95, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Wigglytuff"] = {offense = 7, defense = 4.5, specialattack = 8.5, vitality = 14, agility = 300, exp = 196, level = 70, wildLvl = 80, type = "normal", type2 = "no type"},

["Zubat"] = {offense = 4.5, defense = 3.5, specialattack = 3, vitality = 4, agility = 300, exp = 49, level = 10, wildLvl = 20, type = "poison", type2 = "flying"},

["Golbat"] = {offense = 8, defense = 7, specialattack = 6.5, vitality = 7.5, agility = 300, exp = 159, level = 40, wildLvl = 50, type = "poison", type2 = "flying"},

["Oddish"] = {offense = 5, defense = 5.5, specialattack = 7.5, vitality = 4.5, agility = 300, exp = 64, level = 1, wildLvl = 10, type = "grass", type2 = "poison"},

["Gloom"] = {offense = 6.5, defense = 7, specialattack = 8.5, vitality = 6, agility = 300, exp = 138, level = 30, wildLvl = 40, type = "grass", type2 = "poison"},

["Vileplume"] = {offense = 8, defense = 8.5, specialattack = 11, vitality = 7.5, agility = 300, exp = 221, level = 50, wildLvl = 60, type = "grass", type2 = "poison"},

["Paras"] = {offense = 7, defense = 5.5, specialattack = 4.5, vitality = 3.5, agility = 300, exp = 57, level = 1, wildLvl = 10, type = "bug", type2 = "grass"},

["Parasect"] = {offense = 9.5, defense = 8, specialattack = 6, vitality = 6, agility = 300, exp = 142, level = 50, wildLvl = 60, type = "bug", type2 = "grass"},

["Venonat"] = {offense = 5.5, defense = 5, specialattack = 4, vitality = 6, agility = 300, exp = 61, level = 20, wildLvl = 30, type = "bug", type2 = "poison"},

["Venomoth"] = {offense = 6.5, defense = 6, specialattack = 9, vitality = 7, agility = 300, exp = 158, level = 50, wildLvl = 60, type = "bug", type2 = "poison"},

["Diglett"] = {offense = 55, defense = 2.5, specialattack = 3.5, vitality = 1, agility = 300, exp = 53, level = 10, wildLvl = 20, type = "ground", type2 = "no type"},

["Dugtrio"] = {offense = 8, defense = 5, specialattack = 5, vitality = 3.5, agility = 300, exp = 149, level = 40, wildLvl = 50, type = "ground", type2 = "no type"},

["Meowth"] = {offense = 4.5, defense = 3.5, specialattack = 4, vitality = 4, agility = 300, exp = 58, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Persian"] = {offense = 7, defense = 6, specialattack = 6.5, vitality = 6.5, agility = 300, exp = 154, level = 50, wildLvl = 60, type = "normal", type2 = "no type"},

["Psyduck"] = {offense = 5.2, defense = 4.8, specialattack = 6.5, vitality = 5, agility = 300, exp = 64, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Golduck"] = {offense = 8.2, defense = 7.8, specialattack = 9.5, vitality = 8, agility = 300, exp = 175, level = 70, wildLvl = 80, type = "water", type2 = "no type"},

["Mankey"] = {offense = 8, defense = 3.5, specialattack = 3.5, vitality = 4, agility = 300, exp = 61, level = 10, wildLvl = 20, type = "fight", type2 = "no type"},

["Primeape"] = {offense = 10.5, defense = 6, specialattack = 6, vitality = 6.5, agility = 300, exp = 159, level = 50, wildLvl = 60, type = "fight", type2 = "no type"},

["Growlithe"] = {offense = 7, defense = 4.5, specialattack = 7, vitality = 5.5, agility = 300, exp = 70, level = 30, wildLvl = 40, type = "fire", type2 = "no type"},

["Arcanine"] = {offense = 11, defense = 8, specialattack = 10, vitality = 9, agility = 350, exp = 194, level = 100, wildLvl = 100, type = "fire", type2 = "no type"},

["Poliwag"] = {offense = 5, defense = 4, specialattack = 4, vitality = 4, agility = 300, exp = 60, level = 1, wildLvl = 10, type = "water", type2 = "no type"},

["Poliwhirl"] = {offense = 6.5, defense = 6.5, specialattack = 5, vitality = 6.5, agility = 300, exp = 135, level = 30, wildLvl = 40, type = "water", type2 = "no type"},

["Poliwrath"] = {offense = 9.5, defense = 9.5, specialattack = 7, vitality = 9, agility = 300, exp = 230, level = 80, wildLvl = 80, type = "water", type2 = "fight"},

["Abra"] = {offense = 2, defense = 1.5, specialattack = 10.5, vitality = 2.5, agility = 300, exp = 62, level = 10, wildLvl = 20, type = "psychic", type2 = "no type"},

["Kadabra"] = {offense = 3.5, defense = 3, specialattack = 12, vitality = 4, agility = 300, exp = 140, level = 40, wildLvl = 50, type = "psychic", type2 = "no type"},

["Alakazam"] = {offense = 5, defense = 4.5, specialattack = 13.5, vitality = 5.5, agility = 300, exp = 225, level = 80, wildLvl = 90, type = "psychic", type2 = "no type"},

["Machop"] = {offense = 8, defense = 5, specialattack = 3.5, vitality = 7, agility = 300, exp = 61, level = 20, wildLvl = 30, type = "fight", type2 = "no type"},

["Machoke"] = {offense = 10, defense = 7, specialattack = 5, vitality = 8, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "fight", type2 = "no type"},

["Machamp"] = {offense = 13, defense = 8, specialattack = 6.5, vitality = 9, agility = 300, exp = 227, level = 80, wildLvl = 90, type = "fight", type2 = "no type"},

["Bellsprout"] = {offense = 7.5, defense = 3.5, specialattack = 7, vitality = 5, agility = 300, exp = 60, level = 1, wildLvl = 10, type = "grass", type2 = "poison"},

["Weepinbell"] = {offense = 9, defense = 5, specialattack = 8.5, vitality = 6.5, agility = 300, exp = 137, level = 30, wildLvl = 40, type = "grass", type2 = "poison"},

["Victreebel"] = {offense = 10.5, defense = 6.5, specialattack = 10, vitality = 8, agility = 300, exp = 221, level = 70, wildLvl = 60, type = "grass", type2 = "poison"},

["Tentacool"] = {offense = 4, defense = 3.5, specialattack = 5, vitality = 4, agility = 300, exp = 67, level = 10, wildLvl = 20, type = "water", type2 = "poison"},

["Tentacruel"] = {offense = 7, defense = 6.5, specialattack = 8, vitality = 8, agility = 300, exp = 180, level = 80, wildLvl = 90, type = "water", type2 = "poison"},

["Geodude"] = {offense = 8, defense = 10, specialattack = 3, vitality = 4, agility = 300, exp = 60, level = 10, wildLvl = 20, type = "ground", type2 = "rock"},

["Graveler"] = {offense = 9.5, defense = 11.5, specialattack = 4.5, vitality = 5.5, agility = 300, exp = 137, level = 40, wildLvl = 50, type = "ground", type2 = "rock"},

["Golem"] = {offense = 12, defense = 13, specialattack = 5.5, vitality = 8, agility = 300, exp = 223, level = 70, wildLvl = 80, type = "ground", type2 = "rock"},

["Ponyta"] = {offense = 8.5, defense = 5.5, specialattack = 6.5, vitality = 5, agility = 300, exp = 82, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Rapidash"] = {offense = 10, defense = 7, specialattack = 8, vitality = 6.5, agility = 300, exp = 175, level = 100, wildLvl = 80, type = "fire", type2 = "no type"},

["Slowpoke"] = {offense = 6.5, defense = 6.5, specialattack = 4, vitality = 9, agility = 300, exp = 63, level = 10, wildLvl = 20, type = "water", type2 = "psychic"},

["Slowbro"] = {offense = 7.5, defense = 11, specialattack = 10, vitality = 9.5, agility = 300, exp = 172, level = 50, wildLvl = 60, type = "water", type2 = "psychic"},

["Magnemite"] = {offense = 3.5, defense = 7, specialattack = 9.5, vitality = 2.5, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "electric", type2 = "steel"},

["Magneton"] = {offense = 6, defense = 9.5, specialattack = 12, vitality = 5, agility = 300, exp = 163, level = 80, wildLvl = 90, type = "electric", type2 = "steel"},

["Farfetch'd"] = {offense = 6.5, defense = 5.5, specialattack = 5.8, vitality = 5.2, agility = 300, exp = 132, level = 50, wildLvl = 60, type = "flying", type2 = "normal"},

["Doduo"] = {offense = 8.5, defense = 4.5, specialattack = 3.5, vitality = 3.5, agility = 300, exp = 62, level = 10, wildLvl = 20, type = "flying", type2 = "normal"},

["Dodrio"] = {offense = 11, defense = 7, specialattack = 6, vitality = 6, agility = 300, exp = 165, level = 50, wildLvl = 60, type = "flying", type2 = "normal"},

["Seel"] = {offense = 4.5, defense = 5.5, specialattack = 4.5, vitality = 6.5, agility = 300, exp = 65, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Dewgong"] = {offense = 7, defense = 8, specialattack = 7, vitality = 9, agility = 300, exp = 166, level = 60, wildLvl = 80, type = "water", type2 = "ice"},

["Grimer"] = {offense = 8, defense = 5, specialattack = 4, vitality = 8, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Muk"] = {offense = 10.5, defense = 7.5, specialattack = 6.5, vitality = 10.5, agility = 300, exp = 175, level = 80, wildLvl = 90, type = "poison", type2 = "no type"},

["Shellder"] = {offense = 6.5, defense = 10, specialattack = 4.5, vitality = 3, agility = 300, exp = 61, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Cloyster"] = {offense = 9.5, defense = 18, specialattack = 8.5, vitality = 5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "water", type2 = "ice"},

["Gastly"] = {offense = 3.5, defense = 3, specialattack = 10, vitality = 3, agility = 300, exp = 62, level = 20, wildLvl = 30, type = "ghost", type2 = "poison"},

["Haunter"] = {offense = 5, defense = 4.5, specialattack = 11.5, vitality = 4.5, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "ghost", type2 = "poison"},

["Gengar"] = {offense = 6.5, defense = 6, specialattack = 13.0, vitality = 6, agility = 300, exp = 225, level = 80, wildLvl = 90, type = "ghost", type2 = "poison"},

["Onix"] = {offense = 4.5, defense = 16, specialattack = 3, vitality = 3.5, agility = 300, exp = 77, level = 50, wildLvl = 60, type = "rock", type2 = "ground"},

["Drowzee"] = {offense = 4.8, defense = 4.5, specialattack = 4.3, vitality = 6, agility = 300, exp = 66, level = 30, wildLvl = 40, type = "psychic", type2 = "no type"},

["Hypno"] = {offense = 7.3, defense = 7, specialattack = 7.3, vitality = 8.5, agility = 300, exp = 169, level = 50, wildLvl = 60, type = "psychic", type2 = "no type"},

["Krabby"] = {offense = 10.5, defense = 9, specialattack = 2.5, vitality = 3, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Kingler"] = {offense = 13, defense = 11.5, specialattack = 5, vitality = 5.5, agility = 300, exp = 166, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Voltorb"] = {offense = 3, defense = 5, specialattack = 5.5, vitality = 4, agility = 300, exp = 66, level = 10, wildLvl = 20, type = "electric", type2 = "no type"},

["Electrode"] = {offense = 5, defense = 7, specialattack = 8, vitality = 6, agility = 300, exp = 172, level = 40, wildLvl = 50, type = "electric", type2 = "no type"},

["Exeggcute"] = {offense = 4, defense = 8, specialattack = 6, vitality = 6, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "psychic", type2 = "grass"},

["Exeggutor"] = {offense = 9.5, defense = 8.5, specialattack = 12.5, vitality = 9.5, agility = 300, exp = 186, level = 100, wildLvl = 90, type = "psychic", type2 = "grass"},

["Cubone"] = {offense = 5, defense = 9.5, specialattack = 4, vitality = 5, agility = 300, exp = 64, level = 20, wildLvl = 30, type = "ground", type2 = "no type"},

["Marowak"] = {offense = 8, defense = 11, specialattack = 5, vitality = 6, agility = 300, exp = 149, level = 50, wildLvl = 60, type = "ground", type2 = "no type"},

["Hitmonlee"] = {offense = 12, defense = 5.3, specialattack = 3.5, vitality = 5, agility = 300, exp = 159, level = 60, wildLvl = 70, type = "fight", type2 = "no type"},

["Hitmonchan"] = {offense = 10.5, defense = 7.9, specialattack = 3.5, vitality = 5, agility = 300, exp = 159, level = 60, wildLvl = 70, type = "fight", type2 = "no type"},

["Lickitung"] = {offense = 5.5, defense = 7.5, specialattack = 6, vitality = 9, agility = 300, exp = 77, level = 60, wildLvl = 70, type = "normal", type2 = "no type"},

["Koffing"] = {offense = 6.5, defense = 6.3, specialattack = 6, vitality = 4, agility = 300, exp = 68, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Weezing"] = {offense = 9, defense = 12, specialattack = 8.5, vitality = 6.5, agility = 300, exp = 172, level = 50, wildLvl = 60, type = "poison", type2 = "no type"},

["Rhyhorn"] = {offense = 8.5, defense = 9.5, specialattack = 3, vitality = 8, agility = 300, exp = 69, level = 30, wildLvl = 40, type = "ground", type2 = "rock"},

["Rhydon"] = {offense = 13, defense = 12, specialattack = 4.5, vitality = 10.5, agility = 300, exp = 170, level = 80, wildLvl = 90, type = "ground", type2 = "rock"},

["Chansey"] = {offense = 5, defense = 5, specialattack = 3.5, vitality = 25, agility = 300, exp = 395, level = 60, wildLvl = 70, type = "normal", type2 = "no type"},

["Tangela"] = {offense = 5.5, defense = 11.5, specialattack = 10, vitality = 6.5, agility = 300, exp = 87, level = 50, wildLvl = 60, type = "grass", type2 = "no type"},

["Kangaskhan"] = {offense = 9.5, defense = 8, specialattack = 4, vitality = 10.5, agility = 300, exp = 172, level = 80, wildLvl = 90, type = "normal", type2 = "no type"},

["Horsea"] = {offense = 4, defense = 7, specialattack = 7, vitality = 3, agility = 300, exp = 59, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Seadra"] = {offense = 6.5, defense = 9.5, specialattack = 9.5, vitality = 5.5, agility = 300, exp = 154, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Goldeen"] = {offense = 6.7, defense = 6, specialattack = 3.5, vitality = 4.5, agility = 300, exp = 64, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Seaking"] = {offense = 9.2, defense = 6.5, specialattack = 6.5, vitality = 8, agility = 300, exp = 158, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Staryu"] = {offense = 4.5, defense = 5.5, specialattack = 7, vitality = 3, agility = 300, exp = 68, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Starmie"] = {offense = 7.5, defense = 8.5, specialattack = 10, vitality = 6, agility = 350, exp = 182, level = 80, wildLvl = 90, type = "water", type2 = "psychic"},

["Mr.Mime"] = {offense = 4.5, defense = 6.5, specialattack = 10, vitality = 4, agility = 300, exp = 161, level = 70, wildLvl = 70, type = "psychic", type2 = "no type"},

["Scyther"] = {offense = 11, defense = 8, specialattack = 5.5, vitality = 7, agility = 350, exp = 100, level = 100, wildLvl = 90, type = "bug", type2 = "flying"},

["Jynx"] = {offense = 5, defense = 3.5, specialattack = 11.5, vitality = 6.5, agility = 300, exp = 159, level = 80, wildLvl = 90, type = "psychic", type2 = "ice"},

["Electabuzz"] = {offense = 8.3, defense = 5.7, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 172, level = 100, wildLvl = 100, type = "electric", type2 = "no type"},

["Magmar"] = {offense = 9.5, defense = 5.7, specialattack = 10, vitality = 6.5, agility = 300, exp = 173, level = 100, wildLvl = 100, type = "fire", type2 = "no type"},

["Pinsir"] = {offense = 12.5, defense = 10, specialattack = 5.5, vitality = 6.5, agility = 300, exp = 175, level = 100, wildLvl = 60, type = "bug", type2 = "no type"},

["Tauros"] = {offense = 10, defense = 9.5, specialattack = 4, vitality = 7.5, agility = 300, exp = 172, level = 50, wildLvl = 60, type = "normal", type2 = "no type"},

["Magikarp"] = {offense = 1, defense = 5.5, specialattack = 1.5, vitality = 2, agility = 300, exp = 40, level = 1, wildLvl = 10, type = "water", type2 = "no type"},

["Gyarados"] = {offense = 12.5, defense = 7.9, specialattack = 6, vitality = 9.5, agility = 300, exp = 189, level = 100, wildLvl = 100, type = "water", type2 = "flying"},

["Lapras"] = {offense = 8.5, defense = 8, specialattack = 8.5, vitality = 13, agility = 300, exp = 187, level = 100, wildLvl = 90, type = "water", type2 = "ice"},

["Ditto"] = {offense = 4.8, defense = 4.8, specialattack = 4.8, vitality = 4.8, agility = 180, exp = 101, level = 1, wildLvl = 50, type = "normal", type2 = "no type"},

["Eevee"] = {offense = 5.5, defense = 5, specialattack = 4.5, vitality = 5.5, agility = 300, exp = 65, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Vaporeon"] = {offense = 6.5, defense = 6, specialattack = 11, vitality = 13, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "water", type2 = "no type"},

["Jolteon"] = {offense = 6.5, defense = 6, specialattack = 11, vitality = 6.5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "electric", type2 = "no type"},

["Flareon"] = {offense = 13, defense = 6, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "fire", type2 = "no type"},

["Porygon"] = {offense = 6, defense = 7, specialattack = 8.5, vitality = 6.5, agility = 300, exp = 79, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Omanyte"] = {offense = 4, defense = 10, specialattack = 9, vitality = 3.5, agility = 300, exp = 71, level = 20, wildLvl = 30, type = "rock", type2 = "water"},

["Omastar"] = {offense = 6, defense = 12.5, specialattack = 11.5, vitality = 7, agility = 300, exp = 173, level = 80, wildLvl = 90, type = "rock", type2 = "water"},

["Kabuto"] = {offense = 8, defense = 9, specialattack = 5.5, vitality = 3, agility = 300, exp = 71, level = 20, wildLvl = 30, type = "rock", type2 = "water"},

["Kabutops"] = {offense = 11.5, defense = 10.5, specialattack = 6.5, vitality = 6, agility = 300, exp = 173, level = 80, wildLvl = 90, type = "rock", type2 = "water"},

["Aerodactyl"] = {offense = 10.5, defense = 6.5, specialattack = 6, vitality = 8, agility = 300, exp = 180, level = 150, wildLvl = 600, type = "rock", type2 = "flying"},
 
["Snorlax"] = {offense = 11, defense = 6.5, specialattack = 6.5, vitality = 16, agility = 200, exp = 189, level = 100, wildLvl = 100, type = "normal", type2 = "no type"},

["Articuno"] = {offense = 8.5, defense = 10, specialattack = 9.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "ice", type2 = "no type"},
  
["Zapdos"] = {offense = 9, defense = 8.5, specialattack = 12.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "electric", type2 = "flying"},

["Moltres"] = {offense = 10, defense = 9, specialattack = 12.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "fire", type2 = "flying"},

["Dratini"] = {offense = 6.4, defense = 4.5, specialattack = 5, vitality = 4.1, agility = 300, exp = 60, level = 20, wildLvl = 30, type = "dragon", type2 = "no type"},

["Dragonair"] = {offense = 8.4, defense = 6.5, specialattack = 7, vitality = 6.1, agility = 300, exp = 147, level = 60, wildLvl = 70, type = "dragon", type2 = "no type"},

["Dragonite"] = {offense = 13.4, defense = 9.5, specialattack = 10, vitality = 9.1, agility = 300, exp = 270, level = 100, wildLvl = 110, type = "dragon", type2 = "flying"},

["Mewtwo"] = {offense = 11, defense = 9, specialattack = 15.4, vitality = 10.6, agility = 300, exp = 306, level = 150, wildLvl = 300, type = "psychic", type2 = "no type"},

["Mew"] = {offense = 10, defense = 10, specialattack = 10, vitality = 10, agility = 300, exp = 270, level = 150, wildLvl = 300, type = "psychic", type2 = "no type"},
}

local geracao2 = {
["Chikorita"] = {offense = 4.9, defense = 6.5, specialattack = 4.9, vitality = 4.5 , agility = 200, exp = 64, level = 20, wildLvl = 30, type = "grass", type2 = "no type"},

["Bayleef"] = {offense = 6.2, defense = 8, specialattack = 6.3, vitality = 6, agility = 200, exp = 142, level = 40, wildLvl = 50, type = "grass", type2 = "no type"},
                                        --10
["Meganium"] = {offense = 8.2, defense = 10, specialattack = 8.3, vitality = 8, agility = 200, exp = 236, level = 85, wildLvl = 95, type = "grass", type2 = "no type"},

["Cyndaquil"] = {offense = 5.2, defense = 4.3, specialattack = 6, vitality = 3.9, agility = 200, exp = 62, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Quilava"] = {offense = 6.4, defense = 5.8, specialattack = 8, vitality = 5.8, agility = 200, exp = 142, level = 40, wildLvl = 50, type = "fire", type2 = "no type"},

["Typhlosion"] = {offense = 8.4, defense = 7.8, specialattack = 10.9, vitality = 7.8, agility = 200, exp = 240, level = 85, wildLvl = 95, type = "fire", type2 = "no type"},

["Totodile"] = {offense = 6.5, defense = 6.5, specialattack = 4.4, vitality = 5, agility = 200, exp = 63, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Croconaw"] = {offense = 8.0, defense = 8, specialattack = 5.9, vitality = 6.5, agility = 200, exp = 142, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Feraligatr"] = {offense = 10.5, defense = 10, specialattack = 7.9, vitality = 8.5, agility = 200, exp = 239, level = 85, wildLvl = 95, type = "water", type2 = "no type"},

["Sentret"] = {offense = 4.6, defense = 3.4, specialattack = 3.5, vitality = 3.5, agility = 200, exp = 43, level = 15, wildLvl = 15, type = "normal", type2 = "no type"},

["Furret"] = {offense = 7.6, defense = 6.4, specialattack = 4.5, vitality = 8.5, agility = 200, exp = 145, level = 35, wildLvl = 45, type = "normal", type2 = "no type"},

["Hoothoot"] = {offense = 3, defense = 3, specialattack = 3.6, vitality = 6, agility = 200, exp = 52, level = 20, wildLvl = 30, type = "normal", type2 = "flying"},

["Noctowl"] = {offense = 5, defense = 5, specialattack = 7.6, vitality = 10, agility = 280, exp = 158, level = 65, wildLvl = 75, type = "normal", type2 = "flying"},

["Ledyba"] = {offense = 2, defense = 3, specialattack = 4, vitality = 4, agility = 200, exp = 53, level = 15, wildLvl = 15, type = "bug", type2 = "flying"},

["Ledian"] = {offense = 3.5, defense = 5, specialattack = 5.5, vitality = 5.5, agility = 200, exp = 137, level = 35, wildLvl = 45, type = "bug", type2 = "flying"},

["Spinarak"] = {offense = 6, defense = 4, specialattack = 4, vitality = 4, agility = 200, exp = 50, level = 10, wildLvl = 10, type = "bug", type2 = "poison"},

["Ariados"] = {offense = 9, defense = 7, specialattack = 6, vitality = 7, agility = 250, exp = 140, level = 40, wildLvl = 50, type = "bug", type2 = "poison"},

["Crobat"] = {offense = 9, defense = 8, specialattack = 7, vitality = 8.5, agility = 300, exp = 241, level = 80, wildLvl = 90, type = "poison", type2 = "flying"},

["Chinchou"] = {offense = 3.8, defense = 3.8, specialattack = 5.6, vitality = 7.5, agility = 190, exp = 66, level = 15, wildLvl = 15, type = "water", type2 = "electric"},

["Lanturn"] = {offense = 5.8, defense = 5.8, specialattack = 7.6, vitality = 12.5, agility = 200, exp = 161, level = 50, wildLvl = 60, type = "water", type2 = "electric"},

["Pichu"] = {offense = 4, defense = 1.5, specialattack = 3.5, vitality = 2, agility = 200, exp = 41, level = 20, wildLvl = 30, type = "electric", type2 = "no type"},

["Cleffa"] = {offense = 2.5, defense = 2.8, specialattack = 4.5, vitality = 5, agility = 200, exp = 44, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Igglybuff"] = {offense = 3, defense = 1.5, specialattack = 4, vitality = 9, agility = 200, exp = 42, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Togepi"] = {offense = 2, defense = 6.5, specialattack = 4, vitality = 3.5, agility = 200, exp = 49, level = 5, wildLvl = 5, type = "normal", type2 = "no type"},

["Togetic"] = {offense = 4, defense = 8.5, specialattack = 8, vitality = 5.5, agility = 230, exp = 142, level = 60, wildLvl = 70, type = "normal", type2 = "flying"},

["Natu"] = {offense = 5, defense = 4.5, specialattack = 7, vitality = 4, agility = 250, exp = 64, level = 25, wildLvl = 35, type = "psychic", type2 = "flying"},

["Xatu"] = {offense = 7.5, defense = 7, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 165, level = 80, wildLvl = 90, type = "psychic", type2 = "flying"},

["Mareep"] = {offense = 4, defense = 4, specialattack = 6.5, vitality = 5.5, agility = 200, exp = 56, level = 20, wildLvl = 30, type = "electric", type2 = "no type"},

["Flaaffy"] = {offense = 5.5, defense = 5.5, specialattack = 8, vitality = 7, agility = 200, exp = 128, level = 40, wildLvl = 50, type = "electric", type2 = "no type"},

["Ampharos"] = {offense = 7.5, defense = 8.5, specialattack = 11.5, vitality = 9, agility = 200, exp = 230, level = 85, wildLvl = 95, type = "electric", type2 = "no type"},

["Bellossom"] = {offense = 8, defense = 9.5, specialattack = 9, vitality = 7.5, agility = 200, exp = 221, level = 50, wildLvl = 60, type = "grass", type2 = "no type"},

["Marill"] = {offense = 2, defense = 5, specialattack = 2, vitality = 7, agility = 200, exp = 88, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Azumarill"] ={offense = 5, defense = 8, specialattack = 6, vitality = 10, agility = 200, exp = 189, level = 65, wildLvl = 75, type = "water", type2 = "no type"},

["Sudowoodo"] = {offense = 10, defense = 11.5, specialattack = 3, vitality = 7, agility = 200, exp = 144, level = 80, wildLvl = 90, type = "rock", type2 = "no type"},
 
["Politoed"] = {offense = 7.5, defense = 7.5, specialattack = 9, vitality = 9, agility = 200, exp = 225, level = 65, wildLvl = 75, type = "water", type2 = "no type"},

["Hoppip"] = {offense = 3.5, defense = 4, specialattack = 3.5, vitality = 3.5, agility = 180, exp = 50, level = 5, wildLvl = 5, type = "grass", type2 = "flying"},

["Skiploom"] = {offense = 4.5, defense = 5, specialattack = 4.5, vitality = 5.5, agility = 200, exp = 119, level = 25, wildLvl = 35, type = "grass", type2 = "flying"},

["Jumpluff"] = {offense = 5.5, defense = 7, specialattack = 5.5, vitality = 7.5, agility = 200, exp = 207, level = 50, wildLvl = 60, type = "grass", type2 = "flying"},

["Aipom"] = {offense = 7, defense = 5.5, specialattack = 4, vitality = 5.5, agility = 200, exp = 72, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Sunkern"] = {offense = 3, defense = 3, specialattack = 3, vitality = 3, agility = 160, exp = 36, level = 5, wildLvl = 5, type = "grass", type2 = "no type"},

["Sunflora"] = {offense = 7.5, defense = 5.5, specialattack = 10.5, vitality = 7.5, agility = 200, exp = 149, level = 30, wildLvl = 40, type = "grass", type2 = "no type"},

["Yanma"] = {offense = 6.5, defense = 4.5, specialattack = 7.5, vitality = 6.5, agility = 230, exp = 78, level = 50, wildLvl = 60, type = "bug", type2 = "flying"},

["Wooper"] = {offense = 4.5, defense = 4.5, specialattack = 2.5, vitality = 5.5, agility = 200, exp = 42, level = 20, wildLvl = 30, type = "water", type2 = "ground"},

["Quagsire"] = {offense = 8.5, defense = 8.5, specialattack = 6.5, vitality = 9.5, agility = 200, exp = 151, level = 65, wildLvl = 75, type = "water", type2 = "ground"},

["Espeon"] = {offense = 6.5, defense = 6, specialattack = 13, vitality = 6.5, agility = 230, exp = 184, level = 55, wildLvl = 65, type = "psychic", type2 = "no type"},

["Umbreon"] = {offense = 6.5, defense = 11, specialattack = 6, vitality = 9.5, agility = 230, exp = 184, level = 55, wildLvl = 65, type = "dark", type2 = "no type"},

["Murkrow"] = {offense = 8.5, defense = 4.2, specialattack = 8.5, vitality = 6, agility = 280, exp = 81, level = 55, wildLvl = 65, type = "dark", type2 = "flying"},

["Slowking"] = {offense = 7.5, defense = 8, specialattack = 10, vitality = 9.5, agility = 220, exp = 172, level = 100, wildLvl = 110, type = "water", type2 = "psychic"},

["Misdreavus"] = {offense = 6, defense = 6, specialattack = 8.5, vitality = 6, agility = 200, exp = 87, level = 80, wildLvl = 90, type = "ghost", type2 = "no type"},

["Unown"] = {offense = 7.2, defense = 4.8, specialattack = 7.2, vitality = 4.8, agility = 200, exp = 118, level = 100, wildLvl = 110, type = "psychic", type2 = "no type"},

["Wobbuffet"] = {offense = 3.3, defense = 5.8, specialattack = 3.3, vitality = 19, agility = 200, exp = 142, level = 80, wildLvl = 90, type = "psychic", type2 = "no type"},

["Girafarig"] = {offense = 8, defense = 6.5, specialattack = 9, vitality = 7, agility = 300, exp = 159, level = 80, wildLvl = 90, type = "normal", type2 = "psychic"},

["Pineco"] = {offense = 6.5, defense = 9, specialattack = 3.5, vitality = 5, agility = 190, exp = 58, level = 15, wildLvl = 15, type = "bug", type2 = "no type"},

["Forretress"] = {offense = 9, defense = 14, specialattack = 6, vitality = 7.5, agility = 200, exp = 163, level = 65, wildLvl = 75, type = "bug", type2 = "steel"},

["Dunsparce"] = {offense = 7, defense = 7, specialattack = 6.5, vitality = 10, agility = 180, exp = 145, level = 30, wildLvl = 40, type = "normal", type2 = "no type"},

["Gligar"] = {offense = 7.5, defense = 10.5, specialattack = 3.5, vitality = 6.5, agility = 200, exp = 86, level = 40, wildLvl = 50, type = "ground", type2 = "flying"},

["Steelix"] = {offense = 8.5, defense = 20, specialattack = 5.5, vitality = 7.5, agility = 220, exp = 179, level = 100, wildLvl = 110, type = "steel", type2 = "ground"},

["Snubbull"] = {offense = 8, defense = 5, specialattack = 4, vitality = 6, agility = 200, exp = 60, level = 30, wildLvl = 40, type = "normal", type2 = "no type"},

["Granbull"] = {offense = 12, defense = 7.5, specialattack = 6, vitality = 9, agility = 200, exp = 158, level = 65, wildLvl = 75, type = "normal", type2 = "no type"},

["Qwilfish"] = {offense = 9.5, defense = 7.5, specialattack = 5.5, vitality = 6.5, agility = 200, exp = 88, level = 55, wildLvl = 65, type = "water", type2 = "poison"},
                                                                    
["Scizor"] = {offense = 13, defense = 10, specialattack = 5.5, vitality = 7, agility = 310, exp = 175, level = 100, wildLvl = 110, type = "bug", type2 = "steel"},

["Shuckle"] = {offense = 1, defense = 23, specialattack = 1, vitality = 2, agility = 200, exp = 177, level = 30, wildLvl = 40, type = "bug", type2 = "rock"},

["Heracross"] = {offense = 12.5, defense = 7.5, specialattack = 4, vitality = 8, agility = 200, exp = 175, level = 80, wildLvl = 90, type = "bug", type2 = "fighting"},

["Sneasel"] = {offense = 9.5, defense = 5.5, specialattack = 3.5, vitality = 5.5, agility = 270, exp = 86, level = 55, wildLvl = 65, type = "dark", type2 = "ice"},

["Teddiursa"] = {offense = 8, defense = 5, specialattack = 5, vitality = 6, agility = 200, exp = 66, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Ursaring"] = {offense = 13, defense = 7.5, specialattack = 7.5, vitality = 9, agility = 200, exp = 175, level = 90, wildLvl = 100, type = "normal", type2 = "no type"},

["Slugma"] = {offense = 4, defense = 4, specialattack = 7, vitality = 4, agility = 200, exp = 50, level = 15, wildLvl = 15, type = "fire", type2 = "no type"},

["Magcargo"] = {offense = 5, defense = 12, specialattack = 8, vitality = 5, agility = 200, exp = 151, level = 80, wildLvl = 90, type = "fire", type2 = "rock"},

["Swinub"] = {offense = 5, defense = 4, specialattack = 3, vitality = 5, agility = 180, exp = 50, level = 15, wildLvl = 15, type = "ice", type2 = "ground"},

["Piloswine"] = {offense = 10, defense = 8, specialattack = 6, vitality = 10, agility = 200, exp = 158, level = 80, wildLvl = 90, type = "ice", type2 = "ground"},

["Corsola"] = {offense = 5.5, defense = 8.5, specialattack = 6.5, vitality = 5.5, agility = 200, exp = 144, level = 50, wildLvl = 60, type = "water", type2 = "rock"},

["Remoraid"] = {offense = 6.5, defense = 3.5, specialattack = 6.5, vitality = 3.5, agility = 200, exp = 60, level = 10, wildLvl = 10, type = "water", type2 = "no type"},

["Octillery"] = {offense = 10.5, defense = 7.5, specialattack = 10.5, vitality = 7.5, agility = 200, exp = 168, level = 70, wildLvl = 80, type = "water", type2 = "no type"},

["Delibird"] = {offense = 5.5, defense = 4.5, specialattack = 6.5, vitality = 4.5, agility = 200, exp = 116, level = 40, wildLvl = 50, type = "ice", type2 = "flying"},

["Mantine"] = {offense = 4, defense = 7, specialattack = 8, vitality = 6.5, agility = 200, exp = 170, level = 80, wildLvl = 90, type = "water", type2 = "flying"},

["Skarmory"] = {offense = 8, defense = 14, specialattack = 4, vitality = 6.5, agility = 300, exp = 163, level = 85, wildLvl = 95, type = "steel", type2 = "flying"},

["Houndour"] = {offense = 6, defense = 3, specialattack = 8, vitality = 4.5, agility = 270, exp = 66, level = 20, wildLvl = 30, type = "dark", type2 = "fire"},

["Houndoom"] = {offense = 9, defense = 5, specialattack = 11, vitality = 7.5, agility = 300, exp = 175, level = 80, wildLvl = 90, type = "dark", type2 = "fire"},

["Kingdra"] = {offense = 9.5, defense = 9.5, specialattack = 9.5, vitality = 7.5, agility = 210, exp = 243, level = 90, wildLvl = 100, type = "water", type2 = "dragon"},

["Phanpy"] = {offense = 6, defense = 6, specialattack = 4, vitality = 9, agility = 200, exp = 66, level = 20, wildLvl = 30, type = "ground", type2 = "no type"},

["Donphan"] = {offense = 12, defense = 12, specialattack = 6, vitality = 9, agility = 200, exp = 175, level = 80, wildLvl = 90, type = "ground", type2 = "no type"},

["Porygon2"] = {offense = 8, defense = 9, specialattack = 10.5, vitality = 8.5, agility = 200, exp = 180, level = 75, wildLvl = 85, type = "normal", type2 = "no type"},

["Stantler"] = {offense = 9.5, defense = 6.2, specialattack = 8.5, vitality = 7.3, agility = 200, exp = 163, level = 55, wildLvl = 65, type = "normal", type2 = "no type"},

["Smeargle"] = {offense = 2, defense = 3.5, specialattack = 2, vitality = 5.5, agility = 310, exp = 88, level = 100, wildLvl = 110, type = "normal", type2 = "no type"},

["Tyrogue"] = {offense = 3.5, defense = 3.5, specialattack = 3.5, vitality = 3.5, agility = 200, exp = 42, level = 30, wildLvl = 40, type = "fighting", type2 = "no type"},

["Hitmontop"] = {offense = 9.5, defense = 9.5, specialattack = 3.5, vitality = 5, agility = 200, exp = 159, level = 60, wildLvl = 70, type = "fighting", type2 = "no type"},

["Smoochum"] = {offense = 3, defense = 1.5, specialattack = 8.5, vitality = 4.5, agility = 200, exp = 61, level = 30, wildLvl = 40, type = "ice", type2 = "psychic"},

["Elekid"] = {offense = 6.3, defense = 3.7, specialattack = 6.5, vitality = 4.5, agility = 200, exp = 72, level = 30, wildLvl = 40, type = "electric", type2 = "no type"},

["Magby"] = {offense = 7.5, defense = 3.7, specialattack = 7, vitality = 4.5, agility = 200, exp = 73, level = 30, wildLvl = 40, type = "fire", type2 = "no type"},

["Miltank"] = {offense = 8, defense = 10.5, specialattack = 4, vitality = 9.5, agility = 200, exp = 172, level = 80, wildLvl = 90, type = "normal", type2 = "no type"},

["Blissey"] = {offense = 1, defense = 1, specialattack = 7.5, vitality = 25.5, agility = 200, exp = 608, level = 100, wildLvl = 110, type = "normal", type2 = "no type"},

["Raikou"] = {offense = 8.5, defense = 7.5, specialattack = 11.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "electric", type2 = "no type"},

["Entei"] = {offense = 11.5, defense = 8.5, specialattack = 9, vitality = 11.5, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "fire", type2 = "no type"},

["Suicune"] = {offense = 7.5, defense = 11.5, specialattack = 9, vitality = 10, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "water", type2 = "no type"},

["Larvitar"] = {offense = 6.4, defense = 5, specialattack = 4.5, vitality = 5, agility = 200, exp = 60, level = 20, wildLvl = 30, type = "rock", type2 = "ground"},

["Pupitar"] = {offense = 8.4, defense = 7, specialattack = 6.5, vitality = 7, agility = 200, exp = 144, level = 65, wildLvl = 75, type = "rock", type2 = "ground"},

["Tyranitar"] = {offense = 13.4, defense = 11, specialattack = 9.5, vitality = 10, agility = 200, exp = 270, level = 100, wildLvl = 110, type = "rock", type2 = "dark"},

["Lugia"] = {offense = 9, defense = 13, specialattack = 9, vitality = 10.6, agility = 300, exp = 306, level = 1000, wildLvl = 1000, type = "psychic", type2 = "flying"},

["Ho-oh"] = {offense = 13, defense = 9, specialattack = 11, vitality = 10.6, agility = 300, exp = 306, level = 1000, wildLvl = 1000, type = "fire", type2 = "flying"},

["Celebi"] = {offense = 10, defense = 10, specialattack = 10, vitality = 10, agility = 300, exp = 270, level = 1000, wildLvl = 1000, type = "psychic", type2 = "grass"}
 
}

lootItems = {
["Horsea"] = {{12170, 50},{12161, 75},{17301, 35}},
["Arbok"] = {{11443, 6},{12175, 50},{17326, 50},{12165, 75}},
["Psyduck"] = {{12170, 50},{12161, 75},{12189, 50}},
["Raichu"] = {{11444, 6},{17269, 50},{12176, 50},{12164, 75}},
["Vileplume"] = {{11443, 6},{11441, 6},{12163, 75},{12155, 50},{13889, 50},{12153, 50}},
["Ekans"] = {{12175, 50},{17326, 50},{12165, 75}},
["Bulbasaur"] = {{12154, 50},{12163, 75},{12155, 50},{12153, 50}},
["Sandshrew"] = {{12177, 50},{17321, 50}},
["Venusaur"] = {{12154, 50},{11443, 6},{11441, 6},{12163, 75},{12155, 50},{12153, 50}},
["Machoke"] = {{11446, 6},{12195, 20}},
["Kingler"] = {{12170, 50},{11442, 6},{12161, 75},{12207, 50}},
["Wartortle"] = {{12170, 50},{11442, 6},{12161, 75},{12158, 50}},
["Graveler"] = {{11445, 6},{12196, 50},{11451, 6},{13867, 35}},
["Poliwrath"] = {{12170, 50},{11446, 6},{11442, 6},{12161, 75},{17276, 50}},
["Mewtwo"] = {{13785, 75}},
["Kabutops"] = {{11449, 3},{12579, 6},{11442, 6},{12196, 50},{12337, 75}},
["Golduck"] = {{12170, 50},{11442, 6},{17656, 20},{12161, 75},{17657, 20},{17655, 20},{12190, 50}},
["Kadabra"] = {{12193, 35},{11452, 6},{13785, 75},{12194, 50}},
["Fearow"] = {{2694, 75},{11453, 6},{19694, 6},{12200, 50},{13874, 50},{12172, 50}},
["Exeggutor"] = {{11441, 6},{12155, 50},{13785, 75},{17332, 50}},
["Nidoqueen"] = {{12177, 50},{17320, 50},{11443, 6},{11451, 6},{12165, 75}},
["Machop"] = {{12195, 20}},
["Haunter"] = {{11443, 6},{11450, 6},{17350, 75},{12204, 35}},
["Parasect"] = {{11448, 6},{11441, 6},{12171, 50},{12183, 50},{13783, 75},{12153, 50}},
["Dodrio"] = {{2694, 75},{11453, 6},{19694, 6},{12172, 50},{17328, 50}},
["Meowth"] = {{12187, 50},{12157, 50},{17356, 20},{2147, 75}},
["Charmander"] = {{12152, 50},{12162, 75},{13892, 50}},
["Persian"] = {{11453, 6},{12187, 50},{12157, 50},{2147, 75}},
["Alakazam"] = {{12193, 35},{11452, 6},{13785, 75},{12194, 50}},
["Pikachu"] = {{11444, 6},{17269, 50},{12176, 50},{12164, 75}},
["Dratini"] = {{12170, 50},{17340, 35},{12159, 20},{12417, 75}},
["Rhyhorn"] = {{12178, 50},{12196, 50},{17333, 35}},
["Golbat"] = {{11443, 6},{12175, 50},{12182, 50},{12165, 75}},
["Metapod"] = {{12171, 50},{13783, 75},{17314, 50}},
["Electrode"] = {{11444, 6},{12176, 50},{12164, 75}},
["Machamp"] = {{11446, 6},{12195, 20}},
["Eevee"] = {{12181, 50},{2147, 75}},
["Charmeleon"] = {{11447, 6},{12152, 50},{12162, 75},{13892, 50}},
["Koffing"] = {{12210, 50},{12165, 75}},
["Squirtle"] = {{12170, 50},{12161, 75},{12158, 50}},
["Caterpie"] = {{12171, 50},{13783, 75},{17314, 50}},
["Rapidash"] = {{11447, 6},{12152, 50},{12162, 75},{17327, 50}},
["Articuno"] = {{2111, 75}},
["Magikarp"] = {{12161, 75},{12334, 50}},
["Magmar"] = {{11447, 6},{12152, 50},{12162, 75},{17337, 20}},
["Zapdos"] = {{12164, 75}},
["Dewgong"] = {{12170, 50},{11442, 6},{11454, 6},{12161, 75},{17329, 50},{12201, 50}},
["Slowbro"] = {{12170, 50},{11442, 6},{12161, 75},{12197, 35}},
["Electabuzz"] = {{11444, 6},{12176, 50},{12169, 20},{12164, 75}},
["Nidorino"] = {{12177, 50},{11443, 6},{12165, 75},{17319, 50}},
["Dugtrio"] = {{12177, 50},{11451, 6},{17322, 50}},
["Onix"] = {{12205, 35},{11445, 6},{12196, 50},{11451, 6},{12337, 75}},
["Raticate"] = {{11453, 6},{12173, 50},{2147, 75},{12174, 50}},
["Sandslash"] = {{12177, 50},{11451, 6},{17321, 50}},
["Magneton"] = {{12198, 50},{11444, 6},{12176, 50},{12164, 75}},
["Charizard"] = {{11447, 6},{12152, 50},{19694, 6},{12162, 75},{12159, 20},{13892, 50}},
["Poliwhirl"] = {{12170, 50},{11442, 6},{12161, 75},{17276, 50}},
["Clefairy"] = {{12179, 50},{11453, 6},{2147, 75},{13901, 50}},
["Farfetch'd"] = {{12199, 35},{2694, 75}},
["Spearow"] = {{2694, 75},{12200, 50},{13874, 50}},
["Zubat"] = {{12175, 50},{12182, 50},{12165, 75}},
["Staryu"] = {{12188, 50},{12161, 75},{17336, 50}},
["Abra"] = {{12193, 35},{13785, 75},{12194, 50}},
["Drowzee"] = {{17357, 35},{13785, 75},{12194, 50}},
["Hitmonlee"] = {{2345, 35},{11446, 6},{19645, 50}},
["Krabby"] = {{12170, 50},{12161, 75},{12207, 50}},
["Ninetales"] = {{11447, 6},{12179, 50},{12181, 50},{12162, 75},{12180, 20}},
["Pinsir"] = {{11448, 6},{12141, 50},{12171, 50},{13783, 75}},
["Snorlax"] = {{11453, 6},{12173, 50},{2147, 75}},
["Arcanine"] = {{11449, 3},{12152, 50},{12157, 50},{12181, 50},{12162, 75},{17323, 35}},
["Dragonite"] = {{11449, 3},{17340, 35},{12159, 20},{12417, 75}},
["Nidoran Female"] = {{12165, 75}},
["Doduo"] = {{2694, 75},{12172, 50},{17328, 50}},
["Seel"] = {{12170, 50},{12161, 75},{17329, 50},{12201, 50}},
["Weezing"] = {{11443, 6},{12210, 50},{12165, 75}},
["Gyarados"] = {{12170, 50},{11449, 3},{11442, 6},{17656, 20},{12161, 75},{17657, 20},{17655, 20},{12148, 20}},
["Mew"] = {{13785, 75}},
["Dragonair"] = {{12170, 50},{11449, 3},{17340, 35},{12159, 20},{12417, 75}},
["Moltres"] = {{12162, 75}},
["Seaking"] = {{11442, 6},{12178, 50},{17656, 20},{12161, 75},{17657, 20},{17655, 20},{17335, 50}},
["Cubone"] = {{12177, 50},{12208, 50}},
["Lapras"] = {{12170, 50},{11442, 6},{11454, 6},{12161, 75},{12201, 50},{17339, 35}},
["Omanyte"] = {{12580, 6},{12196, 50},{12337, 75}},
["Porygon"] = {{2147, 75}},
["Butterfree"] = {{11448, 6},{12171, 50},{13783, 75},{12153, 50},{17314, 50}},
["Flareon"] = {{11447, 6},{12152, 50},{12162, 75}},
["Jolteon"] = {{11444, 6},{11444, 6},{12176, 50},{12164, 75}},
["Mr.Mime"] = {{12166, 35},{11452, 6},{13785, 75},{12194, 50}},
["Vaporeon"] = {{12170, 50},{11442, 6},{12161, 75}},
["Scyther"] = {{11448, 6},{19694, 6},{12171, 50},{13783, 75},{12167, 20}},
["Nidorina"] = {{12177, 50},{17320, 50},{11443, 6},{12165, 75}},
["Pidgeotto"] = {{2694, 75},{11453, 6},{19694, 6},{12200, 50},{17316, 35}},
["Ditto"] = {{2147, 75}},
["Weedle"] = {{17315, 50},{12171, 50},{13783, 75}},
["Venomoth"] = {{11448, 6},{11443, 6},{12175, 50},{13783, 75},{12153, 50},{12185, 35}},
["Omastar"] = {{11449, 3},{11442, 6},{12580, 6},{12196, 50},{12337, 75}},
["Tauros"] = {{11453, 6},{12178, 50},{2147, 75},{17338, 50}},
["Kakuna"] = {{17315, 50},{12171, 50},{13783, 75}},
["Jynx"] = {{11454, 6},{12201, 50},{11452, 6},{12168, 20},{13785, 75},{12194, 50}},
["Ivysaur"] = {{12154, 50},{11443, 6},{11441, 6},{12163, 75},{12155, 50},{12153, 50}},
["Starmie"] = {{11442, 6},{12188, 50},{17656, 20},{12161, 75},{17657, 20},{17655, 20},{17336, 50},{11452, 6}},
["Aerodactyl"] = {{11445, 6},{12244, 3},{12196, 50},{12337, 75},{12581, 1}},
["Goldeen"] = {{12178, 50},{12161, 75},{17335, 50}},
["Seadra"] = {{12170, 50},{11442, 6},{17656, 20},{12161, 75},{17657, 20},{17301, 35},{17655, 20}},
["Gloom"] = {{11443, 6},{11441, 6},{12163, 75},{13889, 50},{12153, 50}},
["Kangaskhan"] = {{11453, 6},{12178, 50},{17334, 35},{2147, 75}},
["Tentacruel"] = {{12170, 50},{11443, 6},{11442, 6},{12188, 50},{17656, 20},{12161, 75},{17657, 20},{17341, 35},{17655, 20}},
["Hypno"] = {{11452, 6},{17357, 35},{13785, 75},{12194, 50}},
["Gengar"] = {{11443, 6},{11450, 6},{17350, 75},{12204, 35}},
["Rhydon"] = {{11445, 6},{12178, 50},{12196, 50},{11451, 6},{17333, 35}},
["Lickitung"] = {{11453, 6},{2147, 75}},
["Diglett"] = {{17322, 50}},
["Hitmonchan"] = {{2345, 35},{11446, 6},{12191, 50}},
["Marowak"] = {{12177, 50},{12208, 50},{11451, 6}},
["Kabuto"] = {{12579, 6},{12196, 50},{12337, 75}},
["Exeggcute"] = {{12155, 50},{13785, 75},{17332, 50}},
["Voltorb"] = {{12176, 50},{12164, 75}},
["Tangela"] = {{11441, 6},{12163, 75},{12341, 50}},
["Chansey"] = {{2147, 75}},
["Slowpoke"] = {{12170, 50},{12161, 75},{12197, 35}},
["Shellder"] = {{12170, 50},{12161, 75},{12201, 50},{12203, 50}},
["Mankey"] = {{12181, 50}},
["Gastly"] = {{17350, 75},{12204, 35}},
["Magnemite"] = {{12198, 50},{12176, 50},{12164, 75}},
["Nidoran Male"] = {{12165, 75}},
["Grimer"] = {{12202, 50},{12165, 75}},
["Muk"] = {{12202, 50},{11443, 6},{12165, 75},{17330, 50}},
["Cloyster"] = {{12170, 50},{11442, 6},{11454, 6},{12161, 75},{13900, 50},{12201, 50}},
["Pidgey"] = {{2694, 75},{12200, 50},{17316, 35}},
["Ponyta"] = {{12152, 50},{12162, 75},{17327, 50}},
["Geodude"] = {{12196, 50},{13867, 35}},
["Tentacool"] = {{12170, 50},{12188, 50},{12161, 75},{17341, 35}},
["Bellsprout"] = {{12163, 75},{12155, 50},{13897, 50}},
["Victreebel"] = {{11443, 6},{11441, 6},{12163, 75},{12155, 50},{13897, 50}},
["Pidgeot"] = {{2694, 75},{11453, 6},{19694, 6},{12200, 50},{17316, 35},{12172, 50}},
["Primeape"] = {{11446, 6},{12181, 50},{12192, 50}},
["Weepinbell"] = {{11443, 6},{11441, 6},{12163, 75},{12155, 50},{13897, 50}},
["Clefable"] = {{12179, 50},{11453, 6},{2147, 75},{13901, 50}},
["Poliwag"] = {{12170, 50},{12161, 75},{17276, 50}},
["Wigglytuff"] = {{12179, 50},{11453, 6},{2147, 75},{19665, 50}},
["Blastoise"] = {{12170, 50},{11442, 6},{12161, 75},{12158, 50}},
["Growlithe"] = {{12152, 50},{12157, 50},{12181, 50},{12162, 75},{17323, 35}},
["Rattata"] = {{12173, 50},{2147, 75},{12174, 50}},
["Golem"] = {{11445, 6},{12196, 50},{11451, 6},{13867, 35}},
["Venonat"] = {{12184, 50},{12175, 50},{13783, 75},{12153, 50}},
["Beedrill"] = {{11448, 6},{11443, 6},{17315, 50},{12171, 50},{13783, 75},{12153, 50}},
["Paras"] = {{12171, 50},{12183, 50},{13783, 75},{12153, 50}},
["Oddish"] = {{12163, 75},{12155, 50},{13889, 50},{12153, 50}},
["Jigglypuff"] = {{12179, 50},{11453, 6},{2147, 75},{19665, 50}},
["Vulpix"] = {{12179, 50},{12181, 50},{12162, 75},{12180, 20}},
["Nidoking"] = {{12177, 50},{11443, 6},{12178, 50},{12157, 50},{11451, 6},{12165, 75},{17319, 50}},

["Pupitar"] = {{12177, 50},{17310, 35},{11445, 6},{12244, 3},{12196, 50},{12337, 75}},
["Wobbuffet"] = {{11452, 6},{13785, 75},{17280, 35},{12194, 50}},
["Croconaw"] = {{12170, 50},{11442, 6},{12161, 75},{12157, 50},{17262, 50}},
["Chikorita"] = {{12163, 75},{12155, 50},{12153, 50},{17260, 50}},
["Togetic"] = {{17270, 20},{11453, 6},{12200, 50},{2147, 75},{19696, 3}},
["Blissey"] = {{2147, 75}},
["Feraligatr"] = {{12170, 50},{11442, 6},{12161, 75},{12157, 50},{17262, 50}},
["Crobat"] = {{17267, 35},{11443, 6},{12244, 3},{12165, 75}},
["Typhlosion"] = {{11447, 6},{12152, 50},{12181, 50},{12162, 75},{17261, 50}},
["Sunkern"] = {{12163, 75},{12155, 50},{17279, 50}},
["Cleffa"] = {{12179, 50},{2147, 75},{13901, 50}},
["Swinub"] = {{12181, 50},{2111, 75},{12201, 50},{19650, 35}},
["Natu"] = {{12200, 50},{19648, 35},{13785, 75}},
["Tyrogue"] = {{17346, 75}},
["Granbull"] = {{17285, 50},{11453, 6},{2147, 75}},
["Totodile"] = {{12170, 50},{12161, 75},{12157, 50},{17262, 50}},
["Lugia"] = {{13785, 75}},
["Mantine"] = {{12170, 50},{11442, 6},{17656, 20},{12161, 75},{17657, 20},{17655, 20},{17298, 35}},
["Yanma"] = {{11448, 6},{12171, 50},{13783, 75},{17342, 50}},
["Pichu"] = {{17269, 50},{12176, 50},{12164, 75}},
["Quagsire"] = {{12170, 50},{17343, 50},{12177, 50},{11442, 6},{12161, 75},{11451, 6}},
["Slowking"] = {{12170, 50},{12244, 3},{12161, 75},{12197, 35},{12194, 50}},
["Igglybuff"] = {{12179, 50},{2147, 75},{19665, 50}},
["Remoraid"] = {{12170, 50},{12161, 75},{13866, 35}},
["Bayleef"] = {{11441, 6},{12163, 75},{12155, 50},{12153, 50},{17260, 50}},
["Girafarig"] = {{2147, 75}},
["Misdreavus"] = {{11450, 6},{17350, 75},{19669, 35},{12194, 50}},
["Chinchou"] = {{12170, 50},{12161, 75},{12176, 50},{13887, 50}},
["Ledyba"] = {{17265, 50},{12171, 50},{13783, 75}},
["Celebi"] = {{13785, 75}},
["Shuckle"] = {{12171, 50},{17289, 50},{13783, 75}},
["Sneasel"] = {{17291, 50},{17348, 75},{11450, 6},{11454, 6},{12187, 50},{12201, 50}},
["Furret"] = {{11453, 6},{12181, 50},{2147, 75},{17263, 50}},
["Skarmory"] = {{12232, 3},{19694, 6},{13868, 35},{17347, 75}},
["Ampharos"] = {{11444, 6},{12176, 50},{12164, 75},{17272, 50}},
["Espeon"] = {{11452, 6},{13785, 75}},
["Gligar"] = {{12177, 50},{12175, 50},{13875, 50}},
["Mareep"] = {{12176, 50},{12164, 75}},
["Delibird"] = {{2111, 75},{17297, 50},{12201, 50}},
["Aipom"] = {{12173, 50},{2147, 75},{17278, 50}},
["Kingdra"] = {{12170, 50},{11449, 3},{11442, 6},{17656, 20},{12161, 75},{17657, 20},{17301, 35},{17655, 20}},
["Jumpluff"] = {{11441, 6},{12163, 75},{12153, 50},{17277, 50}},
["Houndoom"] = {{17348, 75},{11447, 6},{11450, 6},{12152, 50},{17300, 35}},
["Entei"] = {{12162, 75}},
["Tyranitar"] = {{12177, 50},{17310, 35},{11445, 6},{12244, 3},{12196, 50},{12337, 75}},
["Cyndaquil"] = {{12152, 50},{12181, 50},{12162, 75},{17261, 50}},
["Larvitar"] = {{12177, 50},{17310, 35},{12196, 50},{12337, 75}},
["Lanturn"] = {{12170, 50},{11442, 6},{11444, 6},{17656, 20},{12161, 75},{17657, 20},{12176, 50},{17655, 20},{13887, 50}},
["Togepi"] = {{17270, 20},{12200, 50},{2147, 75}},
["Magcargo"] = {{11447, 6},{17293, 50},{11445, 6},{12152, 50},{12162, 75}},
["Raikou"] = {{12164, 75}},
["Marill"] = {{12170, 50},{12161, 75},{17274, 50}},
["Miltank"] = {{11453, 6},{2147, 75},{17306, 35}},
["Magby"] = {{12152, 50},{12162, 75},{17337, 20}},
["Azumarill"] = {{12170, 50},{11442, 6},{12161, 75},{17274, 50}},
["Elekid"] = {{12176, 50},{12169, 20},{12164, 75}},
["Smeargle"] = {{2147, 75},{17304, 50}},
["Smoochum"] = {{2111, 75},{12201, 50},{12168, 20}},
["Flaaffy"] = {{11444, 6},{12176, 50},{12164, 75},{17272, 50}},
["Hoothoot"] = {{12200, 50},{2147, 75},{17264, 50}},
["Hitmontop"] = {{2345, 35},{11446, 6},{17305, 50},{17346, 75}},
["Politoed"] = {{12170, 50},{11442, 6},{12161, 75},{17276, 50}},
["Sudowoodo"] = {{17275, 35},{11445, 6},{12196, 50},{12337, 75}},
["Phanpy"] = {{12177, 50},{17302, 35}},
["Pineco"] = {{12171, 50},{13783, 75},{17282, 50}},
["Stantler"] = {{11453, 6},{2147, 75},{17303, 50}},
["Meganium"] = {{11441, 6},{12163, 75},{12155, 50},{12153, 50},{17260, 50}},
["Porygon2"] = {{2147, 75}},
["Hoppip"] = {{12163, 75},{12153, 50},{17277, 50}},
["Snubbull"] = {{17285, 50},{2147, 75}},
["Donphan"] = {{12177, 50},{11451, 6},{17302, 35}},
["Xatu"] = {{19694, 6},{12200, 50},{11452, 6},{19648, 35},{13785, 75}},
["Spinarak"] = {{12171, 50},{17266, 50},{13783, 75}},
["Skiploom"] = {{12163, 75},{12153, 50},{17277, 50}},
["Ho-oh"] = {{12162, 75}},
["Sentret"] = {{12181, 50},{2147, 75},{17263, 50}},
["Octillery"] = {{12170, 50},{11442, 6},{17656, 20},{12161, 75},{17657, 20},{17655, 20},{13866, 35}},
["Corsola"] = {{12170, 50},{11442, 6},{11445, 6},{17656, 20},{12161, 75},{17657, 20},{17295, 50},{17655, 20}},
["Quilava"] = {{11447, 6},{12152, 50},{12181, 50},{12162, 75},{17261, 50}},
["Forretress"] = {{11448, 6},{12171, 50},{13783, 75},{17282, 50}},
["Piloswine"] = {{11454, 6},{11451, 6},{12181, 50},{2111, 75},{12201, 50},{19650, 35}},
["Suicune"] = {{12161, 75}},
["Unown"] = {{13785, 75}},
["Scizor"] = {{11448, 6},{12232, 3},{12171, 50},{17287, 12},{13783, 75}},
["Ursaring"] = {{11453, 6},{12181, 50},{2147, 75}},
["Sunflora"] = {{11441, 6},{12163, 75},{12155, 50},{17279, 50}},
["Heracross"] = {{11448, 6},{11446, 6},{17290, 35},{12171, 50},{13783, 75}},
["Slugma"] = {{17293, 50},{12152, 50},{12162, 75}},
["Dunsparce"] = {{2147, 75},{17283, 50}},
["Qwilfish"] = {{12170, 50},{13872, 50},{11443, 6},{11442, 6},{17656, 20},{12161, 75},{17657, 20},{17655, 20}},
["Steelix"] = {{12177, 50},{12232, 3},{11451, 6},{17288, 12},{17347, 75}},
["Noctowl"] = {{11453, 6},{19694, 6},{12200, 50},{2147, 75},{17264, 50}},
["Murkrow"] = {{17348, 75},{11450, 6},{12200, 50},{17344, 50}},
["Umbreon"] = {{17348, 75},{11450, 6}},
["Wooper"] = {{12170, 50},{17343, 50},{12177, 50},{12161, 75}},
["Teddiursa"] = {{12181, 50},{17292, 35},{2147, 75}},
["Bellossom"] = {{11441, 6},{12163, 75},{12155, 50},{13889, 50}},
["Ledian"] = {{11448, 6},{17265, 50},{12171, 50},{13783, 75}},
["Ariados"] = {{11448, 6},{12171, 50},{17266, 50},{13783, 75}},
["Houndour"] = {{17348, 75},{12152, 50},{17300, 35}},

}






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
								setPlayerStorageValue(wild, 19850, 1)
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




local function bool_to_number(value)
  if value then
       return 1
  end
 return 0
end





local lootList = {
["Bulb"] = {12154, 132, {"Bulbasaur", "Ivysaur", "Venusaur"}}, 
["Squirtle Hull"] = {12158, 132, {"Squirtle", "Wartortle", "Blastoise"}}, 
["Colored Feather"] = {17316, 168, {"Pidgey", "Pidgeotto", "Pidgeot"}}, 
["Rat Tail"] = {12174, 54, {"Rattata", "Raticate"} }, 
["Electric Rat Tail"] = {17269, 132, {"Pichu", "Pikachu", "Raichu", "Plusle", "Minun"} }, 
["Armadillo Claw"] = {17321, 147, {"Sandshrew", "Sandslash"} }, 
["Topknot"] = {13901, 147, {"Cleffa", "Clefairy", "Clefable"}}, 
["Bat Wing"] = {12182, 78, {"Zubat", "Golbat"} }, 
["Mushroom"] = {12183, 114, {"Paras", "Parasect"} }, 
["Piece Of Diglett"] = {17322, 78, {"Diglett", "Dugtrio"} }, 
["Luck Medallion"] = {17356, 1000, {"Meowth", "Alolan Meowth"} }, 
["Psyduck Mug"] = {12189, 129, {"Psyduck"}}, 
["Giant Piece Of Fur"] = {17323, 180, {"Growlithe", "Arcanine"} }, 
["Belt Of Champion"] = {12195, 1000, {"Machop", "Machoke", "Machamp", "Champion Primeape"}}, 
["Slow Tail"] = {12197, 225, {"Slowpoke", "Slowbro", "Slowking"}}, 
["Farfetch'd Stick"] = {12199, 300, {"Farfetch'd"}}, 
["Gosme"] = {12202, 78, {"Grimer", "Muk"}}, 
["Locksmith Of Shell"] = {12203, 24, {"Shellder"}},  
["Onix Tail"] = {12205, 371, {"Onix"}}, 
["Crab Claw"] = {12207, 90, {"Krabby", "Kingler"}}, 
["Spin Machine"] = {17305, 135, {"Hitmontop"}}, 
["Venom Flute"] = {12210, 78, {"Koffing", "Weezing"}}, 
--["Solid Rock Paw"] = { viktor, 100000, {"Rhyperior"}}, 
["Blue Vines"] = {12341, 123, {"Tangela", "Tangrowth"}}, 
["Seahorse Tail"] = {17301, 204, {"Horsea", "Seadra", "Kingdra"}}, 
["Gem Star"] = {17336, 78, {"Staryu", "Starmie"}}, 
["Scythe"] = {12167, 1000, {"Scyther"}}, 
["Magma Foot"] = {17337, 1000, {"Magby", "Magmar"}}, 
["Bull Tail"] = {17338, 102, {"Tauros"}}, 
["Gyarados Tail"] = {12148, 800, {"Gyarados"}}, 
["Dome Fossil"] = {12579, 8000, {"Kabuto", "Kabutops"}}, 
["Dragon Tail"] = {17340, 450, {"Dratini", "Dragonair", "Dragonite"}}, 
["Red Scale"] = {17262, 132, {"Totodile", "Croconaw", "Feraligatr"}}, 
["Ladybug Wing"] = {17265, 78, {"Ledyba", "Ledian"}}, 
["Eggshell"] = {17270, 1000, {"Togepi", "Togetic", "Togekiss"}}, 
["Blue Ball"] = {17274, 147, {"Marill", "Azumarill"}}, 
["Monkey Paw"] = {17278, 90, {"Aipom"}}, 
["Wooper Horn"] = {17343, 147, {"Wooper", "Quagsire"}}, 
["Strange Tail"] = {17280, 180, {"Wobbuffet"}}, 
["Small Wing"] = {17283, 69, {"Dunsparce"}}, 
["Small Tail"] = {13872, 123, {"Qwilfish"}}, 
["Insect Claw"] = {17290, 180, {"Heracross"}}, 
["Fire Ear"] = {17293, 135, {"Slugma", "Magcargo"}}, 
["Piece Of Coral"] = {17295, 114, {"Corsola"}}, 
["Gift Bag"] = {17297, 90, {"Delibird"}}, 
["Strange Bone"] = {17300, 180, {"Houndour", "Houndoom"}}, 
["Brush"] = {17304, 90, {"Smeargle"}}, 
["Greens"] = {19641, 132, {"Treecko", "Grovyle", "Sceptile"}}, 
["Black Fin"] = {19629, 132, {"Mudkip", "Marshtomp", "Swampert"}}, 
["Sharp Leaves"] = {19630, 120, {"Shiftry"}}, 
["Cure Flower"] = {19631, 150, {"Ralts", "Kirlia", "Gardevoir", "Sylveon"}}, 
["Cute Ball"] = {19632, 50, {"Whismur", "Loudred"}}, 
["Big Hands"] = {19633, 200, {"Hariyama"}}, 
["Metal Jaw"] = {19634, 232, {"Mawlile"}}, 
["Mediling"] = {19635, 112, {"Meditite", "Medicham"}}, 
["Black Hull"] = {19636, 100, {"Torkoal"}}, 
["Sand Tail"] = {19637, 132, {"Vibrava", "Flygon"}}, 
["Poisonous Tail"] = {19638, 132, {"Seviper"}}, 
["Claw Fossil"] = {19639, 8000, {"Anorith", "Armaldo"}}, 
["Ghost Skull"] = {19640, 100, {"Duskull", "Dusclops"}}, 
["Palm Leaves"] = {19641, 802, {"Tropius"}}, 
["Tech Ball"] = {19643, 5020, {"Beldum", "Metang", "Metagross", "Bronzor", "Bronzong"}}, 
["Zap"] = {19644, 1000, {"Rotom", "Rotom Ice", "Rotom Fly", "Rotom Grass", "Rotom Fire", "Rotom Water"}}, 
["Butterfly Wing"] = {17314, 66, {"Caterpie", "Metapod", "Butterfree"}}, 
["Red Wing"] = {13874, 114, {"Spearow", "Fearow"}}, 
["Female Ear"] = {17320, 147, {"Nidoranfe", "Nidorina", "Nidoqueen"}}, 
["Fox Tail"] = {12180, 1000, {"Vulpix", "Ninetales"}}, 
["Giant Bat Wing"] = {17267, 180, {"Crobat"}}, 
["Bug Antenna"] = {12184, 96, {"Venonat"}}, 
["Wool Ball"] = {12187, 69, {"Meowth", "Persian", "Sneasel", "Weavile", "Zangoose"}}, 
["Karate Duck"]	 = {12190, 123, {"Golduck"}}, 
["Strange Thing"] = {17276, 147, {"Poliwag", "Poliwhirl", "Poliwrath", "Politoed"}}, 
["Plant Tail"] = {13897, 114, {"Bellsprout", "Weepinbell", "Victreebel"}}, 
["Strange Rock"] = {13867, 159, {"Geodude", "Graveler", "Golem"}}, 
["Magnet"] = {12198, 90, {"Magnemite", "Magneton", "Magnezone"}}, 
["Dodrio Feather"] = {17328, 102, {"Doduo", "Dodrio"}}, 
["Strange Spike"] = {13900, 135, {"Cloyster"}}, 
["Steelix Tail"] = {17288, 2000, {"Steelix"}}, 
["Plant Foot"] = {17332, 123, {"Exeggcute", "Exeggutor"}}, 
["Kick Machine"] = {19645, 135, {"Hitmonlee"}}, 
["Martial Arts Scroll"] = {2345, 185, {"Hitmonlee", "Hitmonchan", "Hitmontop"}}, 
["Massive Vines"] = {19646, 100000, {"Tangrowth"}}, 
["Fish Fin"] = {17335, 78, {"Goldeen", "Seaking"}}, 
["Scizor Claw"]	 = {17287, 2000, {"Scizor"}}, 
["Electric Tail"] = {12169, 1000, {"Elekid", "Electabuzz", "Electivire"}}, 
["Blaze Topknot"] = {19647, 100000, {"Magmortar"}}, 
["Magikarp Fin"] = {12334, 3, {"Magikarp"}}, 
["Giant Fin"] = {17339, 180, {"Lapras"}}, 
["Old Amber"] = {12581, 1000000, {"Aerodactyl"}}, 
["Great Petal"] = {17260, 132, {"Chikorita", "Bayleef", "Meganium"}}, 
["Squirrel Tail"] = {17263, 78, {"Sentret", "Furret"}}, 
["Spider Leg"] = {17266, 78, {"Spinarak", "Ariados"}}, 
["Strange Wing"] = {19648, 168, {"Natu", "Xatu"}}, 
["Branch of Stone"] = {17275, 180, {"Sudowoodo"}}, 
["Helicopter Leave"] = {17279, 69, {"Sunkern", "Sunflora"}}, 
["Dark Beak"] = {17344, 123, {"Murkrow"}}, 
["Strange Antenna"] = {19649, 180, {"Girafaring"}}, 
["Gligar Claw"] = {13875, 90, {"Gligar", "Gliscor"}}, 
["Cat Ear"] = {17291, 123, {"Sneasel", "Weavile", "Zangoose"}}, 
["Tusk"] = {19650, 180, {"Swinub", "Piloswine"}}, 
["Streak Tail"] = {17298, 180, {"Mantine"}}, 
["Elephant Foot"] = {17302, 180, {"Phanpy", "Donphan"}}, 
["Cow Tail"] = {17306, 180, {"Miltank"}}, 
["Water Plant"] = {19651, 120, {"Lotad", "Lombre", "Ludicolo"}}, 
["Crimson Feather"] = {19652, 120, {"Taillow", "Swellow"}}, 
["Fur Ball"] = {19653, 100, {"Slakoth", "Vigoroth", "Slaking"}}, 
["Eruption Ears"] = {19654, 100, {"Loudred", "Exploud"}}, 
["Shock Topknot"] = {19655, 132, {"Electrike", "Manectric"}}, 
["Nu Ball"] = {19656, 100, {"Numel", "Camerupt"}}, 
["Springs"] = {19657, 100, {"Spoink", "Grumpig"}}, 
["Cloud"] = {19658, 132, {"Swablu", "Altaria"}}, 
["Lobster Claw"] = {19659, 150, {"Corphish", "Crawdaunt"}}, 
["Beautiful Scales"] = {19660, 10000, {"Milotic"}}, 
["Creepy Eye"] = {19661, 1000, {"Dusclops"}}, 
["Dark Moon"] = {19662, 1200, {"Absol"}}, 
["Seal Mustache"] = {19663, 132, {"Spheal", "Sealeo", "Walrein", "Abomasnow"}}, 
["Armor Fossil"] = {19664, 60000, {"Shieldon", "Bastiodon"}}, 
["Fire Tail"] = {13892, 132, {"Charmander", "Charmeleon", "Charizard"}}, 
["Bee Sting"] = {17315, 54, {"Weedle", "Kakuna", "Beedrill"}}, 
["Snake Tail"] = {17326, 78, {"Ekans", "Arbok"}}, 
["Male Ear"] = {17319, 147, {"Nidoranma", "Nidorino", "Nidoking"}}, 
["Microphone"] = {19665, 147, {"Igglybuff", "Jigglypuff", "Wigglytuff"}}, 
["Strange Flower"] = {13889, 114, {"Oddish", "Gloom", "Vileplume", "Bellossom"}}, 
["Bug Venom"] = {12185, 371, {"Venomoth"}}, 
["Iron Bracelet"] = {12192, 114, {"mankey", "Primeape"}}, 
["Psychic Spoon"] = {12193, 180, {"Abra", "Kadabra", "Alakazam"}}, 
["Giant Ruby"] = {17341, 200, {"Tentacool", "Tentacruel"}}, 
["Fire Horse Foot"] = {17327, 114, {"Ponyta", "Rapidash"}}, 
["Titanium Imam"] = {19666, 10000, {"Magnezone"}}, 
["Seal Tail"] = {17329, 147, {"Seel", "Dewgong"}}, 
["Sticky Hand"] = {17330, 120, {"Muk"}}, 
["Traces Of Ghost"] = {12204, 180, {"Gastly", "Haunter", "Gengar"}}, 
["Linearly Guided Hypnosis"] = {17357, 410, {"Drowzee", "Hypno"}}, 
["Bone"] = {12208, 123, {"Cubone", "Marowak"}}, 
["Punch Machine"] = {12191, 135, {"Hitmonchan"}}, 
["Horn Drill"] = {17333, 168, {"Rhyhorn", "Rhydon"}}, 
["Kanga Ear"] = {17334, 180, {"Kangaskhan"}}, 
["Mimic Clothes"] = {12166, 450, {"Mr.Mime"}}, 
["Ice Bra"] = {12168, 1000, {"Smoochum", "Jynx", "Santa Jynx"}}, 
["Max Volt Paw"] = {19667, 100000, {"Electivire"}}, 
["Pinsir Horn"] = {12141, 102, {"Pinsir"}}, 
["Helix Fossil"] = {12580, 8000, {"Omanyte", "Omastar"}}, 
["Big Eater Fur"] = {19668, 1000, {"Munchlax"}}, 
["Hot Fur"] = {17261, 132, {"Cyndaquil", "Quilava", "Typhlosion"}}, 
["Owl Feather"] = {17264, 147, {"Hoothoot", "Noctowl"}}, 
["Point of Light"] = {13887, 114, {"Chinchou", "Lanturn"}}, 
["Sheep Wool"] = {17272, 132, {"Marrep", "Flaaffy", "Ampharos"}}, 
["Yellow Flower"] = {17277, 114, {"Hoppip", "Skiploom", "Jumpluff"}}, 
["Insect Tail"] = {17342, 114, {"Yanma"}}, 
["Miss Trace"] = {19669, 310, {"Misdreavus"}}, 
["Piece Of Shell"] = {17282, 147, {"Pineco", "Forretress"}}, 
["Dog Ear"] = {17285, 147, {"Snubbull", "Granbull"}}, 
["Small Shell"] = {17289, 69, {"Shuckle"}}, 
["Bear Paw"] = {17292, 204, {"Teddiursa"}}, 
["Tentacle"] = {13866, 159, {"Remoraid", "Octillery"}}, 
["Steel Wing"] = {13868, 192, {"Skarmory"}}, 
["Reindeer Horn"] = {17303, 123, {"Stantler"}}, 
["Lizard Tail"] = {17310, 450, {"Larvitar", "Pupitar", "Tyranitar"}}, 
["Fire Feather"] = {15082, 132, {"Torchic", "Combusken", "Blaziken"}}, 
["Big Seed"] = {19670, 120, {"Seedot", "Nuzleaf"}}, 
["Bug Legs"] = {19671, 100, {"Nincada", "Ninjask", "Shedinja"}}, 
["Samurai Hair"] = {19672, 100, {"Makuhita", "Hariyama"}}, 
["Big Crystal"] = {19673, 1000, {"Sableye"}},
["Metal Hull"] = {19674, 232, {"Aron", "Lairon", "Aggron"}}, 
["Mini Volcano"] = {19675, 1000, {"Camerupt"}}, 
["Strange Ball"] = {19676, 52, {"Trapinch"}}, 
["Tribe Mark"] = {19677, 112, {"Zangoose"}}, 
["Pawn"] = {19678, 100, {"Baltoy", "Claydol"}}, 
["Doll Star"] = {19679, 100, {"Shuppet", "Banette"}}, 
["Scary Smile"] = {19680, 100000, {"Dusknoir"}}, 
["Ice Blocks"] = {19681, 100, {"Snorunt", "Glalie", "Froslass"}}, 
["Mini Wings"] = {19682, 3200, {"Bagon", "Shelgon", "Salamence"}}, 
["Bone Shield"] = {19683, 30000, {"Bastiodon"}}, 
["Rabbit Eyebrows"] = {19684, 265, {"Buneary", "Lopunny"}}, 





--comum 
["Band Aid"] = {17346, 0.5, {"FIGHTING"}}, 
["Bug Gosme"] = {13783, 0.5, {"BUG"}}, 
["Bottle of Poison"] = {12165, 0.5, {"POISON"}},
["Dark Gem"] = {17348, 0.5, {"DARK"}}, 
["Dragon Scale"] = {12417, 0.5, {"DRAGON"}}, 
["Earth Ball"] = {17352, 0.5, {"EARTH"}}, 
["Enchanted Gem"] = {13785, 0.5, {"PSYCHIC"}},  
["Essence of Fire"] = {12162, 0.5, {"FIRE"}}, 
["Ghost Essence"] = {17350, 0.5, {"GHOST"}}, 
["Piece of Steel"] = {17347, 0.5, {"STEEL"}}, 
["Rubber Ball"]	= {2147, 0.5, {"NORMAL"}}, 
["Seed"] = {12163, 0.5, {"GRASS"}}, 
["Screw"] = {12164, 0.5, {"ELECTRIC"}},
["Small Stone"] = {12337, 0.5, {"ROCK"}},
["Snowball"] = {2111, 0.5, {"ICE"}},
["Water Gem"] = {12161, 0.5, {"WATER"}},
["Straw"] = {2694, 0.5, {"FLYING"}},


["Bag of Pollen"] = {12153, 40, {"Bulbasaur", "Ivysaur", "Venusaur", "Butterfree", "Beedrill", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect",  "Venonat", "Venomoth", "Chikorita", "Bayleef", "Meganium", "Hoppip", "Skiploom", "Jumpluff", "Burmy"}},
["Bird Beak"] = {12172, 30, {"Pidgeot", "Fearow", "Doduo", "Dodrio", "Taillow", "Swellow", "Tropius"}},
["Bitten Apple"] = {12173, 6.5, {"Rattata", "Raticate", "Munchlax", "Snorlax", "Aipom", "Kecleon"}},
["Comb"] = {12179, 100, {"Cleffa", "Clefairy", "Clefable", "Vulpix", "Ninetales", "Igglybuff", "Jigglypuff", "Wigglytuff", "Ralts", "Kirlia", "Gardevoir"}},
["Dragon Tooth"] = {12159, 610, {"Charizard", "Dratini", "Dragonair", "Dragonite", "Salamence"}},
["Electric Box"] = {12176, 20, {"Pichu", "Pikachu", "Raichu", "Magnemite", "Magneton", "Voltorb", "Electrode", "Elekid", "Electabuzz", "Jolteon", "Chinchou", "Lanturn", "Mareep", "Flaaffy", "Ampharos", "Electrike", "Manectric", "Plusle", "Minun", "Pachirisu", "Rotom"}},
["Feather"] = {12200, 7.5, {"Pidgey", "Pidgeotto", "Pidgeot", "Spearow", "Fearow", "Farfetch'D", "Hoothoot", "Noctowl", "Togepi", "Togetic", "Togekiss", "Natu", "Xatu", "Murkrow", "Taillow", "Swellow", "Ninjask", "Swablu", "Altaria", "Tropius"}},
["Fur"] = {12181, 13, {"Vulpix", "Ninetales", "Mankey", "Primeape", "Growlithe", "Arcanine", "Eevee", "Cyndaquil", "Quilava", "Typhlosion", "Sentret", "Furret", "Teddiursa", "Ursaring", "Swinub", "Piloswine", "Slakoth", "Vigoroth", "Munchlax", "Mamoswine"}},
["Future Orb"] = {12194, 15.5, {"Abra", "Kadabra", "Alakazam", "Drowzee", "Hypno", "Mr.Mime", "Jynx", "Slowking", "Misdreavus", "Wobbuffet", "Girafaring", "Ralts", "Kirlia", "Gardevoir", "Meditite", "Medicham", "Spoink", "Grumpig", "Baltoy", "Claydol"}},
["Horn"] = {12178, 25, {"Nidoking", "Rhyhorn", "Rhydon", "Kangaskhan", "Goldeen", "Seaking", "Tauros"}},
["Ice Orb"] = {12201, 32.5, {"Seel", "Dewgong", "Shellder", "Cloyster", "Smoochum", "Jynx", "Lapras", "Sneasel", "Swinub", "Piloswine", "Delibird", "Castform", "Snorunt", "Glalie", "Spheal", "Sealeo", "Walrein", "Snover", "Abomasnow", "Glaceon", "Froslass"}},
["Leaves"] = {12155, 8.5, {"Bulbasaur", "Ivysaur", "Venusaur", "Oddish", "Vileplume", "Bellsprout", "Weepinbell", "Victreebel", "Exeggcute", "Exeggutor", "Chikorita", "Bayleef", "Meganium", "Bellossom", "Sunkern", "Sunflora", "Treecko", "Grovyle", "Sceptile", "Lotad", "Lombre", "Ludicolo", "Seedot", "Nuzleaf", "Shiftry", "Snover", "Abomasnow"}},
["Nail"] = {12157, 10, {"Nidoking", "Meowth", "Persian", "Growlithe", "Arcanine", "Totodile", "Croconaw", "Feraligatr", "Whismur", "Loudred", "Exploud", "Spheal", "Sealeo", "Walrein"}},
["Pot of Lava"] = {12152, 18, {"Charmander", "Charmeleon", "Charizard", "Growlithe", "Arcanine", "Ponyta", "Rapidash", "Magby", "Magmar", "Flareon", "Cyndaquil", "Quilava", "Typhlosion", "Slugma", "Magcargo", "Houndour", "Houndoom", "Torchic", "Combusken", "Blaziken", "Numel", "Camerupt", "Torkoal", "Castform"}},
["Pot of Moss Bug"] = {12171, 7.5, {"Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Paras", "Parasect", "Scyther", "Pinsir", "Ledyba", "Ledian", "Spinarak", "Ariados", "Yanma", "Pineco", "Forretress", "Scizor", "Shuckle", "Heracross", "Nincada", "Ninjask", "Shedinja", "Anorith", "Armaldo"}},
["Ruby"] = {12188, 100, {"Tentacool", "Tentacruel", "Staryu", "Starmie", "Sableye"}},
["Sandbag"] = {12177, 15, {"Sandshrew", "Sandslash", "Nidoranfe", "Nidorina", "Nidoqueen", "Nidoranma", "Nidorino", "Nidoking", "Digglet", "Dugtrio", "Cubone", "Marowak", "Wooper", "Quagsire", "Gligar", "Gliscor", "Steelix", "Phanpy", "Donphan", "Larvitar", "Pupitar", "Tyranitar", "Marshtomp", "Swampert", "Nincada", "Numel", "Camerupt", "Trapinch", "Vibrava", "Flygon", "Baltoy", "Claydol"}},
["Stone Orb"] = {12196, 16.5, {"Geodude", "Graveler", "Golem", "Onix", "Rhyhorn", "Rhydon", "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl", "Sudowoodo", "Larvitar", "Pupitar", "Tyranitar", "Aron", "Lairon", "Aggron", "Anorith", "Armaldo", "Shieldon", "Bastiodon"}},
["Tooth"] = {12175, 8, {"Ekans", "Arbok", "Zubat", "Golbat", "Venonat", "Venomoth", "Gligar", "Gliscor", "Seviper"}},
["Water Pendant"] = {12170, 10, {"Squirtle", "Wartortle", "Blastoise", "Psyduck", "Golduck", "Poliwag", "Poliwhirl", "Poliwrath", "Tentacool", "Tentacruel", "Slowpoke", "Slowbro", "Slowking", "Seel", "Dewgong", "Shellder", "Cloyster", "Krabby", "Kingler", "Horsea", "Seadra", "Gyarados", "Lapras", "Vaporeon", "Dratini", "Dragonair", "Totodile", "Croconaw", "Feraligatr", "Chinchou", "Lanturn", "Marill", "Azumarill", "Politoed", "Wooper", "Quagsire", "Qwilfish", "Corsola", "Remoraid", "Octillery", "Mantine", "Kingdra", "Mudkip", "Marshtomp", "Swampert", "Lotad",  "Lombre", "Ludicolo", "Barboach", "Whiscash", "Corphish", "Crawdaunt", "Feebas", "Castform", "Spheal", "Sealeo", "Walrein"}},
["Air Tank"] = {17655, 1000, {"Golduck", "Tentacruel", "Seadra", "Seaking", "Starmie", "Gyarados", "Lanturn", "Qwilfish", "Corsola", "Octillery", "Mantine", "Kingdra"}},
["Diving Mask"] = {17656, 1000, {"Golduck", "Tentacruel", "Seadra", "Seaking", "Starmie", "Gyarados", "Lanturn", "Qwilfish", "Corsola", "Octillery", "Mantine", "Kingdra"}},
["Fins"] = {17657, 1000, {"Golduck", "Tentacruel", "Seadra", "Seaking", "Starmie", "Gyarados", "Lanturn", "Qwilfish", "Corsola", "Octillery", "Mantine", "Kingdra"}},


["Ancient Stone"] = {12244, 50000, {"Aerodactyl", "Crobat", "Slowking", "Pupitar", "Tyranitar", "Ninjask", "Hariyama", "Torkoal", "Tropius", "Absol"}},
["Cocoon Stone"] = {11448, 5000, {"Butterfree", "Beedrill", "Parasect", "Venomoth", "Scyther", "Pinsir", "Ledian", "Ariados", "Yanma", "Forretress", "Scizor", "Heracross", "Ninjask", "Shedinja", "Armaldo"}},
["Crystal Stone"] = {11449, 50000, {"Arcanine", "Gyarados", "Omastar", "Kabutops", "Dragonair", "Dragonite", "Kingdra", "Gardevoir", "Flygon", "Altaria", "Walrein", "Shelgon"}},
["Darkness Stone"] = {11450, 5000, {"Haunter", "Gengar", "Umbreon", "Murkrow", "Misdreavus", "Sneasel", "Houndoom", "Nuzleaf", "Shiftry", "Shedinja", "Sableye", "Crawdaunt", "Banette", "Dusclops", "Absol"}},
["Earth Stone"] = {11451, 5000, {"Sandslash", "Nidoqueen", "Nidoking", "Digglet", "Dugtrio", "Graveler", "Golem", "Onix", "Marowak", "Rhydon", "Quagsire", "Steelix", "Piloswine", "Donphan", "Marshtomp", "Swampert", "Camerupt", "Vibrava", "Flygon", "Claydol"}},
["Enigma Stone"] = {11452, 5000, {"Kadabra", "Alakazam", "Hypno", "Starmie", "Mr.Mime", "Jynx", "Xatu", "Espeon", "Wobbuffet", "Girafaring", "Kirlia", "Gardevoir", "Medicham", "Grumpig", "Claydol", "Metang"}},
["Feather Stone"] = {19694, 5000, {"Charizard", "Pidgeotto", "Pidgeot", "Fearow", "Farfetch'D", "Dodrio", "Scyther", "Noctowl", "Xatu", "Skarmory", "Swellow", "Altaria", "Tropius"}},
["Fire Stone"] = {11447, 5000, {"Charmeleon", "Charizard", "Ninetales", "Rapidash", "Magmar", "Flareon", "Quilava", "Typhlosion", "Magcargo", "Houndoom", "Combusken", "Blaziken", "Camerupt", "Torkoal", "Castform"}},
["Heart Stone"] = {11453, 5000, {"Pidgeotto", "Pidgeot", "Raticate", "Fearow", "Clefairy", "Clefable", "Jigglypuff", "Wigglytuff", "Persian", "Dodrio", "Lickitung", "Kangaskhan", "Tauros", "Snorlax", "Furret", "Noctowl", "Togetic", "Girafaring", "Granbull", "Ursaring", "Stantler", "Miltank", "Swellow", "Vigoroth", "Loudred", "Exploud", "Zangoose", "Kecleon", "Lopunny"}},
["Ice Stone"] = {11454, 5000, {"Dewgong", "Cloyster", "Jynx", "Lapras", "Sneasel", "Piloswine", "Castform", "Glalie", "Sealeo", "Walrein"}},
["Leaf Stone"] = {11441, 5000, {"Ivysaur", "Venusaur", "Gloom", "Vileplume", "Parasect", "Weepinbell", "Victreebel", "Exeggutor", "Tangela", "Bayleef", "Meganium", "Bellossom", "Jumpluff", "Sunflora", "Grovyle", "Sceptile", "Lombre", "Ludicolo", "Nuzleaf", "Shiftry", "Tropius"}},
["Metal Stone"] = {12232, 50000, {"Steelix", "Scizor", "Skarmory", "Mawile", "Aggron", "Metang", "Magnezone"}},
["Punch Stone"] = {11446, 5000, {"Primeape", "Poliwrath", "Machoke", "Machamp", "Hitmonlee", "Hitmonchan", "Hitmontop", "Heracross", "Combusken", "Blaziken", "Hariyama", "Medicham"}},
["Rock Stone"] = {11445, 5000, {"Graveler", "Golem", "Onix", "Rhydon", "Aerodactyl", "Sudowoodo", "Magcargo", "Corsola", "Pupitar", "Tyranitar", "Lairon", "Aggron", "Armaldo", "Cranidos", "Rampardos"}},
["Thunder Stone"] = {11444, 5000, {"Pikachu", "Raichu", "Magneton", "Magnezone", "Electrode", "Electabuzz", "Jolteon", "Jolteon", "Lanturn", "Flaaffy", "Ampharos", "Manectric"}},
["Venom Stone"] = {11443, 5000, {"Ivysaur", "Venusaur", "Beedrill", "Arbok", "Nidorina", "Nidoqueen", "Nidorino", "Nidoking", "Golbat", "Crobat", "Gloom", "Vileplume", "Venomoth", "Weepinbell", "Victreebel", "Tentacruel", "Muk", "Haunter", "Gengar", "Weezing", "Qwilfish", "Seviper"}},
["Water Stone"] = {11442, 5000, {"Wartortle", "Blastoise", "Golduck", "Poliwhirl", "Poliwrath", "Tentacruel", "Slowbro", "Dewgong", "Cloyster", "Kingler", "Seadra", "Seaking", "Starmie", "Gyarados", "Lapras", "Vaporeon", "Omastar", "Kabutops", "Croconaw", "Feraligatr", "Lanturn", "Azumarill", "Politoed", "Quagsire", "Qwilfish", "Corsola", "Octillery", "Mantine", "Kingdra", "Marshtomp", "Swampert", "Lombre", "Ludicolo", "Carvanha", "Sharpedo", "Barboach", "Whiscash", "Crawdaunt", "Castform", "Sealeo"}},
["Dawn Stone"] = {19695, 55000, {"Froslass"}},
["Shiny Stone"] = {19696, 100000, {"Togetic", "Togekiss"}}, 

["Data Ufo"] = {19684, 0, {"Magnezone"}},
["Bloody Wing"] = {19685, 0, {"Salamence"}},
["Electirizer"] = {19687, 0, {"Electivire"}},
["Gaia Tentacle"] = {19688, 0, {"Tangrowth"}},
["Magmarizer"] = {19689, 0, {"Magmortar"}},
["Metal Coat"] = {19690, 0, {"Metagross"}},
["Power Banana"] = {19691, 0, {"Slaking"}},
["Prism Scale"] = {19692, 0, {"Milotic"}},
["Protector"] = {19693, 0, {"Protector"}},
["Reaper Cloth"] = {19694, 0, {"Dusknoir"}},
	
--mega stones
["Beedrillite"] = {19621, 0, {"Mega Beedrill"}},
["Houndoominite"] = {19622, 0, {"Mega Houndoom"}},
["Gardevoirite"] = {15785, 0, {"Mega Gardevoir"}},
--["Banettite"] = { {"Mega Banette"}},
["Lucarionite"] = {15788, 0, {"Mega Lucario"}},
["Pidgeotite"] = {15791, 0, {"Mega Pidgeot"}},
["Sceptilite"] = {15789, 0, {"Mega Sceptile"}},
--["Sablenite"] = { {"Mega Sableye"}},
--["Glalitite"] = { {"Mega Glalie"}},
--["Pinsirite"] = { {"Mega Pinsir"}},
["Blazikenite"] = {15792, 0, {"Mega Blaziken"}},
--["Manectite"] = { {"Mega Manectric"},
["Aggronite"] = {15780, 0, {"Mega Aggron"}},
["Scizorite"] = {15784, 0, {"Mega Scizor"}},
["Swampertite"] = {15790, 0, {"Mega Swampert"}},
--["Cameruptite"] = { {"Mega Camerupt"}},
--["Lopunnite"] = { {"Mega Lopunny"}},

}

local lootListEasy = {

["Band Aid"] = {17346, 0.5, {"FIGHTING"}}, 
["Bug Gosme"] = {13783, 0.5, {"BUG"}}, 
["Bottle of Poison"] = {12165, 0.5, {"POISON"}},
["Dark Gem"] = {17348, 0.5, {"DARK"}}, 
["Dragon Scale"] = {12417, 0.5, {"DRAGON"}}, 
["Earth Ball"] = {17352, 0.5, {"EARTH"}}, 
["Enchanted Gem"] = {13785, 0.5, {"PSYCHIC"}}, 
["Essence of Fire"] = {12162, 0.5, {"FIRE"}}, 
["Ghost Essence"] = {17350, 0.5, {"GHOST"}}, 
["Piece of Steel"] = {17347, 0.5, {"STEEL"}}, 
["Rubber Ball"]	= {2147, 0.5, {"NORMAL"}}, 
["Seed"] = {12163, 0.5, {"GRASS"}}, 
["Screw"] = {12164, 0.5, {"ELECTRIC"}},
["Small Stone"] = {12337, 0.5, {"ROCK"}},
["Snowball"] = {2111, 0.5, {"ICE"}},
["Water Gem"] = {12161, 0.5, {"WATER"}},
["Straw"] = {2694, 0.5, {"FLYING"}},

["Bag of Pollen"] = {12153, 40, {"Bulbasaur", "Ivysaur", "Venusaur", "Butterfree", "Beedrill", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect",  "Venonat", "Venomoth", "Chikorita", "Bayleef", "Meganium", "Hoppip", "Skiploom", "Jumpluff", "Burmy"}},
["Bird Beak"] = {12172, 30, {"Pidgeot", "Fearow", "Doduo", "Dodrio", "Taillow", "Swellow", "Tropius"}},
["Bitten Apple"] = {12173, 6.5, {"Rattata", "Raticate", "Munchlax", "Snorlax", "Aipom", "Kecleon"}},
["Comb"] = {12179, 100, {"Cleffa", "Clefairy", "Clefable", "Vulpix", "Ninetales", "Igglybuff", "Jigglypuff", "Wigglytuff", "Ralts", "Kirlia", "Gardevoir"}},
["Dragon Tooth"] = {12159, 610, {"Charizard", "Dratini", "Dragonair", "Dragonite", "Salamence"}},
["Electric Box"] = {12176, 20, {"Pichu", "Pikachu", "Raichu", "Magnemite", "Magneton", "Voltorb", "Electrode", "Elekid", "Electabuzz", "Jolteon", "Chinchou", "Lanturn", "Mareep", "Flaaffy", "Ampharos", "Electrike", "Manectric", "Plusle", "Minun", "Pachirisu", "Rotom"}},
["Feather"] = {12200, 7.5, {"Pidgey", "Pidgeotto", "Pidgeot", "Spearow", "Fearow", "Farfetch'D", "Hoothoot", "Noctowl", "Togepi", "Togetic", "Togekiss", "Natu", "Xatu", "Murkrow", "Taillow", "Swellow", "Ninjask", "Swablu", "Altaria", "Tropius"}},
["Fur"] = {12181, 13, {"Vulpix", "Ninetales", "Mankey", "Primeape", "Growlithe", "Arcanine", "Eevee", "Cyndaquil", "Quilava", "Typhlosion", "Sentret", "Furret", "Teddiursa", "Ursaring", "Swinub", "Piloswine", "Slakoth", "Vigoroth", "Munchlax", "Mamoswine"}},
["Future Orb"] = {12194, 15.5, {"Abra", "Kadabra", "Alakazam", "Drowzee", "Hypno", "Mr.Mime", "Jynx", "Slowking", "Misdreavus", "Wobbuffet", "Girafaring", "Ralts", "Kirlia", "Gardevoir", "Meditite", "Medicham", "Spoink", "Grumpig", "Baltoy", "Claydol"}},
["Horn"] = {12178, 25, {"Nidoking", "Rhyhorn", "Rhydon", "Kangaskhan", "Goldeen", "Seaking", "Tauros"}},
["Ice Orb"] = {12201, 32.5, {"Seel", "Dewgong", "Shellder", "Cloyster", "Smoochum", "Jynx", "Lapras", "Sneasel", "Swinub", "Piloswine", "Delibird", "Castform", "Snorunt", "Glalie", "Spheal", "Sealeo", "Walrein", "Snover", "Abomasnow", "Glaceon", "Froslass"}},
["Leaves"] = {12155, 8.5, {"Bulbasaur", "Ivysaur", "Venusaur", "Oddish", "Vileplume", "Bellsprout", "Weepinbell", "Victreebel", "Exeggcute", "Exeggutor", "Chikorita", "Bayleef", "Meganium", "Bellossom", "Sunkern", "Sunflora", "Treecko", "Grovyle", "Sceptile", "Lotad", "Lombre", "Ludicolo", "Seedot", "Nuzleaf", "Shiftry", "Snover", "Abomasnow"}},
["Nail"] = {12157, 10, {"Nidoking", "Meowth", "Persian", "Growlithe", "Arcanine", "Totodile", "Croconaw", "Feraligatr", "Whismur", "Loudred", "Exploud", "Spheal", "Sealeo", "Walrein"}},
["Pot of Lava"] = {12152, 18, {"Charmander", "Charmeleon", "Charizard", "Growlithe", "Arcanine", "Ponyta", "Rapidash", "Magby", "Magmar", "Flareon", "Cyndaquil", "Quilava", "Typhlosion", "Slugma", "Magcargo", "Houndour", "Houndoom", "Torchic", "Combusken", "Blaziken", "Numel", "Camerupt", "Torkoal", "Castform"}},
["Pot of Moss Bug"] = {12171, 7.5, {"Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Paras", "Parasect", "Scyther", "Pinsir", "Ledyba", "Ledian", "Spinarak", "Ariados", "Yanma", "Pineco", "Forretress", "Scizor", "Shuckle", "Heracross", "Nincada", "Ninjask", "Shedinja", "Anorith", "Armaldo"}},
["Ruby"] = {12188, 100, {"Tentacool", "Tentacruel", "Staryu", "Starmie", "Sableye"}},
["Sandbag"] = {12177, 15, {"Sandshrew", "Sandslash", "Nidoranfe", "Nidorina", "Nidoqueen", "Nidoranma", "Nidorino", "Nidoking", "Digglet", "Dugtrio", "Cubone", "Marowak", "Wooper", "Quagsire", "Gligar", "Gliscor", "Steelix", "Phanpy", "Donphan", "Larvitar", "Pupitar", "Tyranitar", "Marshtomp", "Swampert", "Nincada", "Numel", "Camerupt", "Trapinch", "Vibrava", "Flygon", "Baltoy", "Claydol"}},
["Stone Orb"] = {12196, 16.5, {"Geodude", "Graveler", "Golem", "Onix", "Rhyhorn", "Rhydon", "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl", "Sudowoodo", "Larvitar", "Pupitar", "Tyranitar", "Aron", "Lairon", "Aggron", "Anorith", "Armaldo", "Shieldon", "Bastiodon"}},
["Tooth"] = {12175, 8, {"Ekans", "Arbok", "Zubat", "Golbat", "Venonat", "Venomoth", "Gligar", "Gliscor", "Seviper"}},
["Water Pendant"] = {12170, 10, {"Squirtle", "Wartortle", "Blastoise", "Psyduck", "Golduck", "Poliwag", "Poliwhirl", "Poliwrath", "Tentacool", "Tentacruel", "Slowpoke", "Slowbro", "Slowking", "Seel", "Dewgong", "Shellder", "Cloyster", "Krabby", "Kingler", "Horsea", "Seadra", "Gyarados", "Lapras", "Vaporeon", "Dratini", "Dragonair", "Totodile", "Croconaw", "Feraligatr", "Chinchou", "Lanturn", "Marill", "Azumarill", "Politoed", "Wooper", "Quagsire", "Qwilfish", "Corsola", "Remoraid", "Octillery", "Mantine", "Kingdra", "Mudkip", "Marshtomp", "Swampert", "Lotad",  "Lombre", "Ludicolo", "Barboach", "Whiscash", "Corphish", "Crawdaunt", "Feebas", "Castform", "Spheal", "Sealeo", "Walrein"}},

}

local lootListStone = {
["Ancient Stone"] = {12244, 50000, {"Aerodactyl", "Crobat", "Slowking", "Pupitar", "Tyranitar", "Ninjask", "Hariyama", "Torkoal", "Tropius", "Absol"}},
["Cocoon Stone"] = {11448, 5000, {"Butterfree", "Beedrill", "Parasect", "Venomoth", "Scyther", "Pinsir", "Ledian", "Ariados", "Yanma", "Forretress", "Scizor", "Heracross", "Ninjask", "Shedinja", "Armaldo"}},
["Crystal Stone"] = {11449, 50000, {"Arcanine", "Gyarados", "Omastar", "Kabutops", "Dragonair", "Dragonite", "Kingdra", "Gardevoir", "Flygon", "Altaria", "Walrein", "Shelgon"}},
["Darkness Stone"] = {11450, 5000, {"Haunter", "Gengar", "Umbreon", "Murkrow", "Misdreavus", "Sneasel", "Houndoom", "Nuzleaf", "Shiftry", "Shedinja", "Sableye", "Crawdaunt", "Banette", "Dusclops", "Absol"}},
["Earth Stone"] = {11451, 5000, {"Sandslash", "Nidoqueen", "Nidoking", "Digglet", "Dugtrio", "Graveler", "Golem", "Onix", "Marowak", "Rhydon", "Quagsire", "Steelix", "Piloswine", "Donphan", "Marshtomp", "Swampert", "Camerupt", "Vibrava", "Flygon", "Claydol"}},
["Enigma Stone"] = {11452, 5000, {"Kadabra", "Alakazam", "Hypno", "Starmie", "Mr.Mime", "Jynx", "Xatu", "Espeon", "Wobbuffet", "Girafaring", "Kirlia", "Gardevoir", "Medicham", "Grumpig", "Claydol", "Metang"}},
["Feather Stone"] = {19694, 5000, {"Charizard", "Pidgeotto", "Pidgeot", "Fearow", "Farfetch'D", "Dodrio", "Scyther", "Noctowl", "Xatu", "Skarmory", "Swellow", "Altaria", "Tropius"}},
["Fire Stone"] = {11447, 5000, {"Charmeleon", "Charizard", "Ninetales", "Rapidash", "Magmar", "Flareon", "Quilava", "Typhlosion", "Magcargo", "Houndoom", "Combusken", "Blaziken", "Camerupt", "Torkoal", "Castform"}},
["Heart Stone"] = {11453, 5000, {"Pidgeotto", "Pidgeot", "Raticate", "Fearow", "Clefairy", "Clefable", "Jigglypuff", "Wigglytuff", "Persian", "Dodrio", "Lickitung", "Kangaskhan", "Tauros", "Snorlax", "Furret", "Noctowl", "Togetic", "Girafaring", "Granbull", "Ursaring", "Stantler", "Miltank", "Swellow", "Vigoroth", "Loudred", "Exploud", "Zangoose", "Kecleon", "Lopunny"}},
["Ice Stone"] = {11454, 5000, {"Dewgong", "Cloyster", "Jynx", "Lapras", "Sneasel", "Piloswine", "Castform", "Glalie", "Sealeo", "Walrein"}},
["Leaf Stone"] = {11441, 5000, {"Ivysaur", "Venusaur", "Gloom", "Vileplume", "Parasect", "Weepinbell", "Victreebel", "Exeggutor", "Tangela", "Bayleef", "Meganium", "Bellossom", "Jumpluff", "Sunflora", "Grovyle", "Sceptile", "Lombre", "Ludicolo", "Nuzleaf", "Shiftry", "Tropius"}},
["Metal Stone"] = {12232, 50000, {"Steelix", "Scizor", "Skarmory", "Mawile", "Aggron", "Metang", "Magnezone"}},
["Punch Stone"] = {11446, 5000, {"Primeape", "Poliwrath", "Machoke", "Machamp", "Hitmonlee", "Hitmonchan", "Hitmontop", "Heracross", "Combusken", "Blaziken", "Hariyama", "Medicham"}},
["Rock Stone"] = {11445, 5000, {"Graveler", "Golem", "Onix", "Rhydon", "Aerodactyl", "Sudowoodo", "Magcargo", "Corsola", "Pupitar", "Tyranitar", "Lairon", "Aggron", "Armaldo", "Cranidos", "Rampardos"}},
["Thunder Stone"] = {11444, 5000, {"Pikachu", "Raichu", "Magneton", "Magnezone", "Electrode", "Electabuzz", "Jolteon", "Jolteon", "Lanturn", "Flaaffy", "Ampharos", "Manectric"}},
["Venom Stone"] = {11443, 5000, {"Ivysaur", "Venusaur", "Beedrill", "Arbok", "Nidorina", "Nidoqueen", "Nidorino", "Nidoking", "Golbat", "Crobat", "Gloom", "Vileplume", "Venomoth", "Weepinbell", "Victreebel", "Tentacruel", "Muk", "Haunter", "Gengar", "Weezing", "Qwilfish", "Seviper"}},
["Water Stone"] = {11442, 5000, {"Wartortle", "Blastoise", "Golduck", "Poliwhirl", "Poliwrath", "Tentacruel", "Slowbro", "Dewgong", "Cloyster", "Kingler", "Seadra", "Seaking", "Starmie", "Gyarados", "Lapras", "Vaporeon", "Omastar", "Kabutops", "Croconaw", "Feraligatr", "Lanturn", "Azumarill", "Politoed", "Quagsire", "Qwilfish", "Corsola", "Octillery", "Mantine", "Kingdra", "Marshtomp", "Swampert", "Lombre", "Ludicolo", "Carvanha", "Sharpedo", "Barboach", "Whiscash", "Crawdaunt", "Castform", "Sealeo"}},
["Dawn Stone"] = {19695, 55000, {"Froslass"}},
["Shiny Stone"] = {19696, 100000, {"Togetic", "Togekiss"}}, 

["Data Ufo"] = {19684, 0, {"Magnezone"}},
["Bloody Wing"] = {19685, 0, {"Salamence"}},
["Electirizer"] = {19687, 0, {"Electivire"}},
["Gaia Tentacle"] = {19688, 0, {"Tangrowth"}},
["Magmarizer"] = {19689, 0, {"Magmortar"}},
["Metal Coat"] = {19690, 0, {"Metagross"}},
["Power Banana"] = {19691, 0, {"Slaking"}},
["Prism Scale"] = {19692, 0, {"Milotic"}},
["Protector"] = {19693, 0, {"Protector"}},
["Reaper Cloth"] = {19694, 0, {"Dusknoir"}},
}

local lootListRaro = {
["Bulb"] = {12154, 132, {"Bulbasaur", "Ivysaur", "Venusaur"}}, 
["Squirtle Hull"] = {12158, 132, {"Squirtle", "Wartortle", "Blastoise"}}, 
["Colored Feather"] = {17316, 168, {"Pidgey", "Pidgeotto", "Pidgeot"}}, 
["Rat Tail"] = {12174, 54, {"Rattata", "Raticate"} }, 
["Electric Rat Tail"] = {17269, 132, {"Pichu", "Pikachu", "Raichu", "Plusle", "Minun"} }, 
["Armadillo Claw"] = {17321, 147, {"Sandshrew", "Sandslash"} }, 
["Topknot"] = {13901, 147, {"Cleffa", "Clefairy", "Clefable"}}, 
["Bat Wing"] = {12182, 78, {"Zubat", "Golbat"} }, 
["Mushroom"] = {12183, 114, {"Paras", "Parasect"} }, 
["Piece Of Diglett"] = {17322, 78, {"Diglett", "Dugtrio"} }, 
["Luck Medallion"] = {17356, 1000, {"Meowth", "Alolan Meowth"} }, 
["Psyduck Mug"] = {12189, 129, {"Psyduck"}}, 
["Giant Piece Of Fur"] = {17323, 180, {"Growlithe", "Arcanine"} }, 
["Belt Of Champion"] = {12195, 1000, {"Machop", "Machoke", "Machamp", "Champion Primeape"}}, 
["Slow Tail"] = {12197, 225, {"Slowpoke", "Slowbro", "Slowking"}}, 
["Farfetch'd Stick"] = {12199, 300, {"Farfetch'd"}}, 
["Gosme"] = {12202, 78, {"Grimer", "Muk"}}, 
["Locksmith Of Shell"] = {12203, 24, {"Shellder"}},  
["Onix Tail"] = {12205, 371, {"Onix"}}, 
["Crab Claw"] = {12207, 90, {"Krabby", "Kingler"}}, 
["Spin Machine"] = {17305, 135, {"Hitmontop"}}, 
["Venom Flute"] = {12210, 78, {"Koffing", "Weezing"}}, 
["Solid Rock Paw"] = {19697, 100000, {"Rhyperior"}}, 
["Blue Vines"] = {12341, 123, {"Tangela", "Tangrowth"}}, 
["Seahorse Tail"] = {17301, 204, {"Horsea", "Seadra", "Kingdra"}}, 
["Gem Star"] = {17336, 78, {"Staryu", "Starmie"}}, 
["Scythe"] = {12167, 1000, {"Scyther"}}, 
["Magma Foot"] = {17337, 1000, {"Magby", "Magmar"}}, 
["Bull Tail"] = {17338, 102, {"Tauros"}}, 
["Gyarados Tail"] = {12148, 800, {"Gyarados"}}, 
["Dome Fossil"] = {12579, 8000, {"Kabuto", "Kabutops"}}, 
["Dragon Tail"] = {17340, 450, {"Dratini", "Dragonair", "Dragonite"}}, 
["Red Scale"] = {17262, 132, {"Totodile", "Croconaw", "Feraligatr"}}, 
["Ladybug Wing"] = {17265, 78, {"Ledyba", "Ledian"}}, 
["Eggshell"] = {17270, 1000, {"Togepi", "Togetic", "Togekiss"}}, 
["Blue Ball"] = {17274, 147, {"Marill", "Azumarill"}}, 
["Monkey Paw"] = {17278, 90, {"Aipom"}}, 
["Wooper Horn"] = {17343, 147, {"Wooper", "Quagsire"}}, 
["Strange Tail"] = {17280, 180, {"Wobbuffet"}}, 
["Small Wing"] = {17283, 69, {"Dunsparce"}}, 
["Small Tail"] = {13872, 123, {"Qwilfish"}}, 
["Insect Claw"] = {17290, 180, {"Heracross"}}, 
["Fire Ear"] = {17293, 135, {"Slugma", "Magcargo"}}, 
["Piece Of Coral"] = {17295, 114, {"Corsola"}}, 
["Gift Bag"] = {17297, 90, {"Delibird"}}, 
["Strange Bone"] = {17300, 180, {"Houndour", "Houndoom"}}, 
["Brush"] = {17304, 90, {"Smeargle"}}, 
["Greens"] = {19641, 132, {"Treecko", "Grovyle", "Sceptile"}}, 
["Black Fin"] = {19629, 132, {"Mudkip", "Marshtomp", "Swampert"}}, 
["Sharp Leaves"] = {19630, 120, {"Shiftry"}}, 
["Cure Flower"] = {19631, 150, {"Ralts", "Kirlia", "Gardevoir", "Sylveon"}}, 
["Cute Ball"] = {19632, 50, {"Whismur", "Loudred"}}, 
["Big Hands"] = {19633, 200, {"Hariyama"}}, 
["Metal Jaw"] = {19634, 232, {"Mawlile"}}, 
["Mediling"] = {19635, 112, {"Meditite", "Medicham"}}, 
["Black Hull"] = {19636, 100, {"Torkoal"}}, 
["Sand Tail"] = {19637, 132, {"Vibrava", "Flygon"}}, 
["Poisonous Tail"] = {19638, 132, {"Seviper"}}, 
["Claw Fossil"] = {19639, 8000, {"Anorith", "Armaldo"}}, 
["Ghost Skull"] = {19640, 100, {"Duskull", "Dusclops"}}, 
["Palm Leaves"] = {19641, 802, {"Tropius"}}, 
["Tech Ball"] = {19643, 5020, {"Beldum", "Metang", "Metagross", "Bronzor", "Bronzong"}}, 
["Zap"] = {19644, 1000, {"Rotom", "Rotom Ice", "Rotom Fly", "Rotom Grass", "Rotom Fire", "Rotom Water"}}, 
["Butterfly Wing"] = {17314, 66, {"Caterpie", "Metapod", "Butterfree"}}, 
["Red Wing"] = {13874, 114, {"Spearow", "Fearow"}}, 
["Female Ear"] = {17320, 147, {"Nidoranfe", "Nidorina", "Nidoqueen"}}, 
["Fox Tail"] = {12180, 1000, {"Vulpix", "Ninetales"}}, 
["Giant Bat Wing"] = {17267, 180, {"Crobat"}}, 
["Bug Antenna"] = {12184, 96, {"Venonat"}}, 
["Wool Ball"] = {12187, 69, {"Meowth", "Persian", "Sneasel", "Weavile", "Zangoose"}}, 
["Karate Duck"]	 = {12190, 123, {"Golduck"}}, 
["Strange Thing"] = {17276, 147, {"Poliwag", "Poliwhirl", "Poliwrath", "Politoed"}}, 
["Plant Tail"] = {13897, 114, {"Bellsprout", "Weepinbell", "Victreebel"}}, 
["Strange Rock"] = {13867, 159, {"Geodude", "Graveler", "Golem"}}, 
["Magnet"] = {12198, 90, {"Magnemite", "Magneton", "Magnezone"}}, 
["Dodrio Feather"] = {17328, 102, {"Doduo", "Dodrio"}}, 
["Strange Spike"] = {13900, 135, {"Cloyster"}}, 
["Steelix Tail"] = {17288, 2000, {"Steelix"}}, 
["Plant Foot"] = {17332, 123, {"Exeggcute", "Exeggutor"}}, 
["Kick Machine"] = {19645, 135, {"Hitmonlee"}}, 
["Martial Arts Scroll"] = {2345, 185, {"Hitmonlee", "Hitmonchan", "Hitmontop"}}, 
["Massive Vines"] = {19646, 100000, {"Tangrowth"}}, 
["Fish Fin"] = {17335, 78, {"Goldeen", "Seaking"}}, 
["Scizor Claw"]	 = {17287, 2000, {"Scizor"}}, 
["Electric Tail"] = {12169, 1000, {"Elekid", "Electabuzz", "Electivire"}}, 
["Blaze Topknot"] = {19647, 100000, {"Magmortar"}}, 
["Magikarp Fin"] = {12334, 3, {"Magikarp"}}, 
["Giant Fin"] = {17339, 180, {"Lapras"}}, 
["Old Amber"] = {12581, 1000000, {"Aerodactyl"}}, 
["Great Petal"] = {17260, 132, {"Chikorita", "Bayleef", "Meganium"}}, 
["Squirrel Tail"] = {17263, 78, {"Sentret", "Furret"}}, 
["Spider Leg"] = {17266, 78, {"Spinarak", "Ariados"}}, 
["Strange Wing"] = {19648, 168, {"Natu", "Xatu"}}, 
["Branch of Stone"] = {17275, 180, {"Sudowoodo"}}, 
["Helicopter Leave"] = {17279, 69, {"Sunkern", "Sunflora"}}, 
["Dark Beak"] = {17344, 123, {"Murkrow"}}, 
["Strange Antenna"] = {19649, 180, {"Girafaring"}}, 
["Gligar Claw"] = {13875, 90, {"Gligar", "Gliscor"}}, 
["Cat Ear"] = {17291, 123, {"Sneasel", "Weavile", "Zangoose"}}, 
["Tusk"] = {19650, 180, {"Swinub", "Piloswine"}}, 
["Streak Tail"] = {17298, 180, {"Mantine"}}, 
["Elephant Foot"] = {17302, 180, {"Phanpy", "Donphan"}}, 
["Cow Tail"] = {17306, 180, {"Miltank"}}, 
["Water Plant"] = {19651, 120, {"Lotad", "Lombre", "Ludicolo"}}, 
["Crimson Feather"] = {19652, 120, {"Taillow", "Swellow"}}, 
["Fur Ball"] = {19653, 100, {"Slakoth", "Vigoroth", "Slaking"}}, 
["Eruption Ears"] = {19654, 100, {"Loudred", "Exploud"}}, 
["Shock Topknot"] = {19655, 132, {"Electrike", "Manectric"}}, 
["Nu Ball"] = {19656, 100, {"Numel", "Camerupt"}}, 
["Springs"] = {19657, 100, {"Spoink", "Grumpig"}}, 
["Cloud"] = {19658, 132, {"Swablu", "Altaria"}}, 
["Lobster Claw"] = {19659, 150, {"Corphish", "Crawdaunt"}}, 
["Beautiful Scales"] = {19660, 10000, {"Milotic"}}, 
["Creepy Eye"] = {19661, 1000, {"Dusclops"}}, 
["Dark Moon"] = {19662, 1200, {"Absol"}}, 
["Seal Mustache"] = {19663, 132, {"Spheal", "Sealeo", "Walrein", "Abomasnow"}}, 
["Armor Fossil"] = {19664, 60000, {"Shieldon", "Bastiodon"}}, 
["Fire Tail"] = {13892, 132, {"Charmander", "Charmeleon", "Charizard"}}, 
["Bee Sting"] = {17315, 54, {"Weedle", "Kakuna", "Beedrill"}}, 
["Snake Tail"] = {17326, 78, {"Ekans", "Arbok"}}, 
["Male Ear"] = {17319, 147, {"Nidoranma", "Nidorino", "Nidoking"}}, 
["Microphone"] = {19665, 147, {"Igglybuff", "Jigglypuff", "Wigglytuff"}}, 
["Strange Flower"] = {13889, 114, {"Oddish", "Gloom", "Vileplume", "Bellossom"}}, 
["Bug Venom"] = {12185, 371, {"Venomoth"}}, 
["Iron Bracelet"] = {12192, 114, {"mankey", "Primeape"}}, 
["Psychic Spoon"] = {12193, 180, {"Abra", "Kadabra", "Alakazam"}}, 
["Giant Ruby"] = {17341, 200, {"Tentacool", "Tentacruel"}}, 
["Fire Horse Foot"] = {17327, 114, {"Ponyta", "Rapidash"}}, 
["Titanium Imam"] = {19666, 10000, {"Magnezone"}}, 
["Seal Tail"] = {17329, 147, {"Seel", "Dewgong"}}, 
["Sticky Hand"] = {17330, 120, {"Muk"}}, 
["Traces Of Ghost"] = {12204, 180, {"Gastly", "Haunter", "Gengar"}}, 
["Linearly Guided Hypnosis"] = {17357, 410, {"Drowzee", "Hypno"}}, 
["Bone"] = {12208, 123, {"Cubone", "Marowak"}}, 
["Punch Machine"] = {12191, 135, {"Hitmonchan"}}, 
["Horn Drill"] = {17333, 168, {"Rhyhorn", "Rhydon"}}, 
["Kanga Ear"] = {17334, 180, {"Kangaskhan"}}, 
["Mimic Clothes"] = {12166, 450, {"Mr.Mime"}}, 
["Ice Bra"] = {12168, 1000, {"Smoochum", "Jynx", "Santa Jynx"}}, 
["Max Volt Paw"] = {19667, 100000, {"Electivire"}}, 
["Pinsir Horn"] = {12141, 102, {"Pinsir"}}, 
["Helix Fossil"] = {12580, 8000, {"Omanyte", "Omastar"}}, 
["Big Eater Fur"] = {19668, 1000, {"Munchlax"}}, 
["Hot Fur"] = {17261, 132, {"Cyndaquil", "Quilava", "Typhlosion"}}, 
["Owl Feather"] = {17264, 147, {"Hoothoot", "Noctowl"}}, 
["Point of Light"] = {13887, 114, {"Chinchou", "Lanturn"}}, 
["Sheep Wool"] = {17272, 132, {"Marrep", "Flaaffy", "Ampharos"}}, 
["Yellow Flower"] = {17277, 114, {"Hoppip", "Skiploom", "Jumpluff"}}, 
["Insect Tail"] = {17342, 114, {"Yanma"}}, 
["Miss Trace"] = {19669, 310, {"Misdreavus"}}, 
["Piece Of Shell"] = {17282, 147, {"Pineco", "Forretress"}}, 
["Dog Ear"] = {17285, 147, {"Snubbull", "Granbull"}}, 
["Small Shell"] = {17289, 69, {"Shuckle"}}, 
["Bear Paw"] = {17292, 204, {"Teddiursa"}}, 
["Tentacle"] = {13866, 159, {"Remoraid", "Octillery"}}, 
["Steel Wing"] = {13868, 192, {"Skarmory"}}, 
["Reindeer Horn"] = {17303, 123, {"Stantler"}}, 
["Lizard Tail"] = {17310, 450, {"Larvitar", "Pupitar", "Tyranitar"}}, 
["Fire Feather"] = {15082, 132, {"Torchic", "Combusken", "Blaziken"}}, 
["Big Seed"] = {19670, 120, {"Seedot", "Nuzleaf"}}, 
["Bug Legs"] = {19671, 100, {"Nincada", "Ninjask", "Shedinja"}}, 
["Samurai Hair"] = {19672, 100, {"Makuhita", "Hariyama"}}, 
["Big Crystal"] = {19673, 1000, {"Sableye"}},
["Metal Hull"] = {19674, 232, {"Aron", "Lairon", "Aggron"}}, 
["Mini Volcano"] = {19675, 1000, {"Camerupt"}}, 
["Strange Ball"] = {19676, 52, {"Trapinch"}}, 
["Tribe Mark"] = {19677, 112, {"Zangoose"}}, 
["Pawn"] = {19678, 100, {"Baltoy", "Claydol"}}, 
["Doll Star"] = {19679, 100, {"Shuppet", "Banette"}}, 
["Scary Smile"] = {19680, 100000, {"Dusknoir"}}, 
["Ice Blocks"] = {19681, 100, {"Snorunt", "Glalie", "Froslass"}}, 
["Mini Wings"] = {19682, 3200, {"Bagon", "Shelgon", "Salamence"}}, 
["Bone Shield"] = {19683, 30000, {"Bastiodon"}}, 
["Rabbit Eyebrows"] = {19684, 265, {"Buneary", "Lopunny"}}, 
}

function generateXml()
    local inicio = '<?xml version="1.0" encoding="UTF-8"?>\n  <monster '
    local final = '</monster>'
	for pokeName, pokeTable in pairs(geracao1) do --Tabele pokes
	    for itemName, tabPoke in pairs(lootList) do --lista do loost
		    local tablePoke = tabPoke[3]
	     	for i = 1, #tablePoke do
		 	    if tablePoke[i] == pokeName then
				    local lootXmlStr = {}
				    pokeOutfit = getOutfitPoke(pokeName)
					pokeCorpse = getMonsterInfo(pokeName)
					pokeXML = getMonsterInfo(pokeName)
					if not pokeCorpse then
					    pokeCorpse = 0
					else
					    pokeCorpse = pokeCorpse.lookCorpse
					end
					

				if pokeXML then	
        	        table.insert(lootXmlStr, inicio)
        	        table.insert(lootXmlStr, 'name="'..pokeName..'" '..'nameDescription="a '..pokeName..'" '..'race="'..pokeTable.type..'" '..'experience="'..pokeTable.exp..'" speed="'..pokeTable.agility..'" manacost="0">\n')
	    	        table.insert(lootXmlStr, '    <health now="30" max="30"/>\n')
	    	        table.insert(lootXmlStr, '    <look type="'..pokeOutfit..'" head="0" body="0" legs="0" feet="0" corpse="'..pokeCorpse..'"/>\n')
        	        table.insert(lootXmlStr, '    <targetchange interval="2000" chance="0"/>\n')
        	        table.insert(lootXmlStr, '    <strategy attack="100" defense="0"/>\n')
	    	        table.insert(lootXmlStr, '    <flags>\n')
	    	        table.insert(lootXmlStr, '        <flag summonable="'.. bool_to_number(pokeXML.summonable) ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag attackable="'.. bool_to_number(pokeXML.attackable)  ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag hostile="'.. bool_to_number(pokeXML.hostile)  ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag illusionable="'.. bool_to_number(pokeXML.illusionable)  ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag convinceable="'.. bool_to_number(pokeXML.convinceable) ..'"/>\n')
					
	    	        table.insert(lootXmlStr, '        <flag pushable="'.. bool_to_number(pokeXML.pushable)  ..'"/>\n')
		            table.insert(lootXmlStr, '        <flag canpushitems="'.. bool_to_number(pokeXML.canpushitems) ..'"/>\n')
		            table.insert(lootXmlStr, '        <flag canpushcreatures="'.. bool_to_number(pokeXML.canpushcreatures)  ..'"/>\n')
		            table.insert(lootXmlStr, '        <flag targetdistance="'.. pokeXML.targetdistance ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag staticattack="'.. pokeXML.staticattack ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag runonhealth="'.. pokeXML.runonhealth ..'"/>\n')
					if pokeXML.passive then
					    table.insert(lootXmlStr, '        <flag passive="'.. bool_to_number(pokeXML.passive) ..'"/>\n')
					end
	    	        table.insert(lootXmlStr, '    </flags>\n')
	    	        table.insert(lootXmlStr, '    <attacks>\n') 
					table.insert(lootXmlStr, '        <attack name="melee" interval="2000" chance="100" range="1" min="-50" max="-100"/>\n')
					local Pokemoves = movestable[pokeName]
					if Pokemoves then
						for m = 1, 12 do
						 
						    local movePoke = nil
						    if m == 1 and Pokemoves.move1 then
						        movePoke = Pokemoves.move1
							elseif m == 2 and Pokemoves.move2 then
							    movePoke = Pokemoves.move2
							elseif m == 3 and Pokemoves.move3 then
							    movePoke = Pokemoves.move3
							elseif m == 4 and Pokemoves.move4 then
							    movePoke = Pokemoves.move4
							elseif m == 5 and Pokemoves.move5 then
							    movePoke = Pokemoves.move5
							elseif m == 6 and Pokemoves.move6 then
							    movePoke = Pokemoves.move6
							elseif m == 7 and Pokemoves.move7 then
							    movePoke = Pokemoves.move7
							elseif m == 8 and Pokemoves.move8 then
							    movePoke = Pokemoves.move8
							elseif m == 9 and Pokemoves.move9 then
							    movePoke = Pokemoves.move9
							elseif m == 10 and Pokemoves.move10 then
							    movePoke = Pokemoves.move10
							elseif m == 11 and Pokemoves.move11 then
							    movePoke = Pokemoves.move11
							elseif m == 12 and Pokemoves.move12 then
							    movePoke = Pokemoves.move12
							end
							
							if movePoke ~= nil and movePoke then
							    table.insert(lootXmlStr, '        <attack name="'..movePoke.name..'" interval="'..movePoke.cd*100 ..'" chance="'.. movePoke.cd ..'" range="'..movePoke.dist ..'"/>\n')
						    end
						end
					end
	    	        table.insert(lootXmlStr, '    </attacks>\n')
	    	        table.insert(lootXmlStr, '    <defenses armor="0" defense="0"/>\n')
	    	        table.insert(lootXmlStr, '    <voices interval="5000" chance="10">\n')
		            table.insert(lootXmlStr, '        <voice sentence="'..pokeName..'!"/>\n')
	    	        table.insert(lootXmlStr, '    </voices>\n')
	    	        table.insert(lootXmlStr, '    <loot>\n')
					
					for l = 1, #lootItems[pokeName] do
					    lootXml = lootItems[pokeName]
						lootXml = lootXml[l]
						lootID = lootXml[1]
						lootChance = lootXml[2]  
						--lootPrice = lootXml[2] 
						if getItemInfo(lootID) and getItemInfo(lootID).stackable and lootChance >= 75 then 
	    	            	table.insert(lootXmlStr, '        <item id="'.. lootID ..'" chance="'.. math.ceil(lootChance*(1+pokeTable.level*2/1000))*50 ..'" countmax="'..math.min(100, pokeTable.level)..'"/>\n')
						else
					    	table.insert(lootXmlStr, '        <item id="'.. lootID ..'" chance="'.. math.ceil(lootChance*(1+pokeTable.level*2/1000))*10 ..'" countmax="1"/>\n')
						end
					end
					
	    	        table.insert(lootXmlStr, '    </loot>\n')
	    	        table.insert(lootXmlStr, '    <script>\n')
	    	        table.insert(lootXmlStr, '        <event name="Spawn"/>\n')
	    	        table.insert(lootXmlStr, '    </script>\n')  
	    	        table.insert(lootXmlStr, final)
					
					local dir = "data/monster/pokes/geracao 1/"..pokeName..".xml"
					local arq = io.open(dir, "a+")
					arq:close()
					local arq = io.open(dir, "w")
					arq:write(table.concat(lootXmlStr))
    				arq:close()
				end
			end
			end
		end
	end
end

function generateShinyXml()
    local inicio = '<?xml version="1.0" encoding="UTF-8"?>\n  <monster '
    local final = '</monster>'
	for pokeName, pokeTable in pairs(geracao2) do --Tabele pokes
	    for itemName, tabPoke in pairs(lootList) do --lista do loost
		    local tablePoke = tabPoke[3]
	     	for i = 1, #tablePoke do
			    local pokeNameShiny = "Shiny "..pokeName
		 	    if "Shiny "..tablePoke[i] == pokeNameShiny then
				    local lootXmlStr = {}
				    pokeOutfit = getOutfitPoke(pokeNameShiny)
					pokeCorpse = getMonsterInfo(pokeNameShiny)
					pokeXML = getMonsterInfo(pokeNameShiny)
					if not pokeCorpse then
					    pokeCorpse = 0
					else
					    pokeCorpse = pokeCorpse.lookCorpse
					end
					

				if pokeXML then	
        	        table.insert(lootXmlStr, inicio)
        	        table.insert(lootXmlStr, 'name="'..pokeNameShiny..'" '..'nameDescription="a '..pokeNameShiny..'" '..'race="'..pokeTable.type..'" '..'experience="'..pokeTable.exp..'" speed="'..pokeTable.agility..'" manacost="0">\n')
	    	        table.insert(lootXmlStr, '    <health now="30" max="30"/>\n')
	    	        table.insert(lootXmlStr, '    <look type="'..pokeOutfit..'" head="0" body="0" legs="0" feet="0" corpse="'..pokeCorpse..'"/>\n')
        	        table.insert(lootXmlStr, '    <targetchange interval="2000" chance="0"/>\n')
        	        table.insert(lootXmlStr, '    <strategy attack="100" defense="0"/>\n')
	    	        table.insert(lootXmlStr, '    <flags>\n')
	    	        table.insert(lootXmlStr, '        <flag summonable="'.. bool_to_number(pokeXML.summonable) ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag attackable="'.. bool_to_number(pokeXML.attackable)  ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag hostile="'.. bool_to_number(pokeXML.hostile)  ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag illusionable="'.. bool_to_number(pokeXML.illusionable)  ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag convinceable="'.. bool_to_number(pokeXML.convinceable) ..'"/>\n')
					
	    	        table.insert(lootXmlStr, '        <flag pushable="'.. bool_to_number(pokeXML.pushable)  ..'"/>\n')
		            table.insert(lootXmlStr, '        <flag canpushitems="'.. bool_to_number(pokeXML.canpushitems) ..'"/>\n')
		            table.insert(lootXmlStr, '        <flag canpushcreatures="'.. bool_to_number(pokeXML.canpushcreatures)  ..'"/>\n')
		            table.insert(lootXmlStr, '        <flag targetdistance="'.. pokeXML.targetdistance ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag staticattack="'.. pokeXML.staticattack ..'"/>\n')
	    	        table.insert(lootXmlStr, '        <flag runonhealth="'.. pokeXML.runonhealth ..'"/>\n')
					if pokeXML.passive then
					    table.insert(lootXmlStr, '        <flag passive="'.. bool_to_number(pokeXML.passive) ..'"/>\n')
					end
	    	        table.insert(lootXmlStr, '    </flags>\n')
	    	        table.insert(lootXmlStr, '    <attacks>\n') 
					table.insert(lootXmlStr, '        <attack name="melee" interval="2000" chance="100" range="1" min="-50" max="-100"/>\n')
					local Pokemoves = movestable[pokeNameShiny]
					if Pokemoves then
						for m = 1, 12 do
						 
						    local movePoke = nil
						    if m == 1 and Pokemoves.move1 then
						        movePoke = Pokemoves.move1
							elseif m == 2 and Pokemoves.move2 then
							    movePoke = Pokemoves.move2
							elseif m == 3 and Pokemoves.move3 then
							    movePoke = Pokemoves.move3
							elseif m == 4 and Pokemoves.move4 then
							    movePoke = Pokemoves.move4
							elseif m == 5 and Pokemoves.move5 then
							    movePoke = Pokemoves.move5
							elseif m == 6 and Pokemoves.move6 then
							    movePoke = Pokemoves.move6
							elseif m == 7 and Pokemoves.move7 then
							    movePoke = Pokemoves.move7
							elseif m == 8 and Pokemoves.move8 then
							    movePoke = Pokemoves.move8
							elseif m == 9 and Pokemoves.move9 then
							    movePoke = Pokemoves.move9
							elseif m == 10 and Pokemoves.move10 then
							    movePoke = Pokemoves.move10
							elseif m == 11 and Pokemoves.move11 then
							    movePoke = Pokemoves.move11
							elseif m == 12 and Pokemoves.move12 then
							    movePoke = Pokemoves.move12
							end
							
							if movePoke ~= nil and movePoke then
							    table.insert(lootXmlStr, '        <attack name="'..movePoke.name..'" interval="'..movePoke.cd*100 ..'" chance="'.. movePoke.cd ..'" range="'..movePoke.dist ..'"/>\n')
						    end
						end
					end
	    	        table.insert(lootXmlStr, '    </attacks>\n')
	    	        table.insert(lootXmlStr, '    <defenses armor="0" defense="0"/>\n')
	    	        table.insert(lootXmlStr, '    <voices interval="5000" chance="10">\n')
		            table.insert(lootXmlStr, '        <voice sentence="'..pokeNameShiny..'!"/>\n')
	    	        table.insert(lootXmlStr, '    </voices>\n')
	    	        table.insert(lootXmlStr, '    <loot>\n')
					
					for l = 1, #lootItems[pokeName] do
					    lootXml = lootItems[pokeName]
						lootXml = lootXml[l]
						lootID = lootXml[1]
						lootChance = lootXml[2]  
						--lootPrice = lootXml[2] 
						if getItemInfo(lootID) and getItemInfo(lootID).stackable and lootChance >= 75 then 
	    	            	table.insert(lootXmlStr, '        <item id="'.. lootID ..'" chance="'.. math.ceil(lootChance*(1+pokeTable.level*2/1000))*50 ..'" countmax="'..math.min(100, pokeTable.level)..'"/>\n')
						else
					    	table.insert(lootXmlStr, '        <item id="'.. lootID ..'" chance="'.. math.ceil(lootChance*(1+pokeTable.level*2/1000))*10 ..'" countmax="1"/>\n')
						end
					end
					
	    	        table.insert(lootXmlStr, '    </loot>\n')
	    	        table.insert(lootXmlStr, '    <script>\n')
	    	        table.insert(lootXmlStr, '        <event name="Spawn"/>\n')
	    	        table.insert(lootXmlStr, '    </script>\n')  
	    	        table.insert(lootXmlStr, final)
					
					local dir = "data/monster/pokes/Shiny/"..pokeNameShiny..".xml"
					local arq = io.open(dir, "a+")
					arq:close()
					local arq = io.open(dir, "w")
					arq:write(table.concat(lootXmlStr))
    				arq:close()
				end
			end
			end
		end
	end
end
 
function lootXmlListFunc()
	local lootXmlList = {}
   	local lootXmlListEmpty = {}
    for pokeName, pokeTable in pairs(geracao2) do -- lista de pokemon do configurtion
		local lootXmlStr = {}
       	for itemName, tabPoke in pairs(lootList) do --lista do loost
		 	local tablePoke = tabPoke[3]
	     	for i = 1, #tablePoke do
		 	    if tablePoke[i] == pokeName or doCorrectString(tablePoke[i]) == doCorrectString(pokeTable.type) then
					str = "" 
					if #lootXmlStr > 0 then
						str = ","
					end
					local chance = lootList[itemName][2]
					if chance < 1 then --comum
					    chance = 75 
					elseif chance <= 150 then --menos comun
					    chance = 50
					elseif chance <= 500 then --incomum
					    chance = 35 
					elseif chance <= 1000 then --raro
					    chance = 20
					elseif chance <= 4999 then --+raro
					    chance = 12
					elseif chance <= 10000 then --+raro
					    chance = 6 
					elseif chance <= 100000 then --+raro
					    chance = 3
					else
					    chance = 1
					end 
					
			    	table.insert(lootXmlStr, str.."{"..lootList[itemName][1]..", "..chance.."}")
					
			    end
		    end
		end 
		
		if #lootXmlStr < 1 then
			table.insert(lootXmlListEmpty, '["'..pokeName..'"] = {'..table.concat(lootXmlStr)..'},\n')
		else
			table.insert(lootXmlList, '["'..pokeName..'"] = {'..table.concat(lootXmlStr)..'},\n')
		end
	end
		
	local dir = "data/LootList.txt"

	local arq = io.open(dir, "a+")
	arq:close()
	local arq = io.open(dir, "w")
	arq:write(table.concat(lootXmlList))
    arq:close()
	
	dir = "data/LootListEmpty.txt"

	arq = io.open(dir, "a+")
	arq:close()
	arq = io.open(dir, "w")
	arq:write(table.concat(lootXmlListEmpty))
    arq:close()
end

function itemXmlListFunc()
    local lootXmlList = {} --aquifica os pokemons salvos com seus respectivos loots
   	local lootXmlListEmpty = {}
	local lootXmlStr = {} 
    for itemName, tabPoke in pairs(lootList) do --lista do loost
		table.insert(lootXmlStr, '<item id="'..lootList[itemName][1]..'" article="a" name="'..itemName..'" plural="'..itemName..'s">\n')
		table.insert(lootXmlStr, '    <attribute key="priceitem" value="'..lootList[itemName][2]..'" />\n')
		table.insert(lootXmlStr, '</item>\n\n')
	end
		
	local dir = "data/LootlList.txt"

	local arq = io.open(dir, "a+")
	arq:close()
	local arq = io.open(dir, "w") 
	arq:write(table.concat(lootXmlStr))
    arq:close()  
end

function itemNpcList(list)
	local lootNpcStr = {} 
	table.insert(lootNpcStr, '"')
    for itemName, tabPoke in pairs(list) do --lista do loost
	    if list[itemName][2] > 0 then
			table.insert(lootNpcStr, itemName..","..list[itemName][1]..","..list[itemName][2] * 100 ..";\n")	
	    end
	end
	table.insert(lootNpcStr, '"')
	local dir = "data/lootNpcList.txt"

	local arq = io.open(dir, "a+")
	arq:close()
	local arq = io.open(dir, "w") 
	arq:write(table.concat(lootNpcStr))
    arq:close() 
end


function rewardLevel(cid)
local premio = {
{level = 15, reward = {2394, 2391, 12344, 12347, 12349}, count = {100, 30, 6, 40, 15}, str = 65001},--pokeball greatball revive potion medicine
{level = 30, reward = {11638, 2152, 2392, 12344, 12348}, count = {1, 30, 50, 15, 30}, str = 65002},--box1 money ultraball revive greatpotion 
{level = 40, reward = {11447, 11441, 11442}, count = {1, 1, 1}, str = 65007},
{level = 50, reward = {11639, 2152}, count = {1, 50}, str = 65003},--box2 5k
----------------------------------------------------------
--[80] = {reward = {boostexp, 2152}, count = {1, 100}, str = }, --doubleexp 10k
{level = 100, reward = {11641}, count = {1}, str = 65004}, --box4
{level = 120, reward = {12618}, count = {1}, str = 65005},--booststone
{level = 150, reward = {12401}, count = {1}, str = 65006},--shiny stone
--[180] = {reward = {box2, 2152}, count = {1, 50}, str = },--
--[200] = {reward = {boxheld, 2152}, count = {1}, str = }--box held

}


    local msg = NetworkMessage.create()
	msg:addU8(#premio)
	for i = 1, #premio do 
	    local prize = premio[i]
	    msg:addString(tostring("Lv."..prize.level))
		if getPlayerLevel(cid) >= prize.level then
		    msg:addU8(1)
		else
		    msg:addU8(0) 
		end
        msg:addU8(#prize.reward)
		for p = 1, #prize.reward do 
			msg:addU16(getItemInfo(prize.reward[p]).clientId)
			msg:addU8(prize.count[p])
			msg:addString(getItemInfo(prize.reward[p]).name)
		end
	end 
	doSendPlayerExtendedOpcode(cid, 185, msg:getBuffer())
end	

function pvpArena(cid)
    local msg = NetworkMessage.create()
	msg:addU32(1000)
	msg:addU32(100) 
	msg:addU8(100)
	for i = 1, 100 do
        msg:addU8(i)
	    msg:addString("Testinho"..i)
		msg:addU32(i*50)
		msg:addU32(i*10)
	end 
	doSendPlayerExtendedOpcode(cid, 175, msg:getBuffer())
end



function pvpArenaPicks(cid)
    local msg = NetworkMessage.create()
    msg:addU32(100)
	go = 0
    for i, x in pairs(fotos) do
	    if go == 100 then
	        break
	    end
	    go = go+1
	   --doCreatureSay(cid, doCorrectString(i), TALKTYPE_SAY)
	    msg:addString(doCorrectString(i))
		--if getItemInfo(fotos[i]) then
			msg:addU16(getItemInfo(fotos[i]).clientId)
		--end
	end
	doSendPlayerExtendedOpcode(cid, 177, msg:getBuffer())
end

local arenasList = {
{fromPos = {x=443, y=233, z = 12}, toPos = {x=446, y=235, z = 12}},
{fromPos = {x=445, y=238, z = 12}, toPos = {x=451, y=242, z = 12}},
} 

function getArenaPvpLivre()
    for i = 1, #arenasList do
        fromPos = arenasList[i].fromPos
	    toPos = arenasList[i].toPos
		local livre = true
	    for X = fromPos.x, toPos.x do
	        for Y = fromPos.y, toPos.y do
		        newPos = {x=X, y=Y, z=fromPos.z}
			    local cid = getTopCreature(newPos).uid
                if cid ~= 1 and isPlayer(cid) then
				    doSendMagicEffect(newPos, 33)
					livre = false
                end
		    end
	    end
		
		if livre then
			return arenasList[i]
		end
    end
	return nil
end

function pvpArenaDuel(cid)
    --check se tem gente na lista
	local arenaPvp = getArenaPvpLivre()
	if arenaPvp ~= nil then
	    doTeleportThing(cid, arenaPvp.toPos, false)
	end
end



function getTopRankPvp(cid)
    local msg = NetworkMessage.create()
	local win = 0
	local lost = 0
	local query = db.getResult("SELECT * FROM `players` WHERE `id` = "..getPlayerGUID(cid))
	if query:getID() ~= -1 then
        win = query:getDataInt("winPvp")
	    lost = query:getDataInt("lostPvp")
		msg:addU32(win)
	    msg:addU32(lost) 
		query:free()
    end

	query = db.getResult("SELECT * FROM `players` WHERE `winPvp` > 0 ORDER BY winPvp DESC LIMIT 100")
	if query:getID() == -1 then
	    msg:addU8(0)
        return
    end

	local i = 1	
	msg:addU8(query:getRows())
	repeat
        msg:addU8(i)
	    msg:addString(query:getDataString("name"))
		msg:addU32(query:getDataInt("winPvp"))
		msg:addU32(query:getDataInt("lostPvp"))
		i = i+1
    until not query:next()
	doSendPlayerExtendedOpcode(cid, 175, msg:getBuffer())
	query:free()
end
function onSay(cid, words, param, channel) 
    local liberar = {"Tungs"}
    if isInArray(liberar, getCreatureName(cid)) then
	    --doPlayerSendTextMessage(cid, 27, generateSerial())    
			--lootXmlListFunc()
			--generateXml()
			--generateShinyXml()
			--itemNpcList(lootListRaro)
			--rewardLevel(cid)
			--doSendAnimatedText(getThingPos(cid), "REFLECT", 3) 
			--pvpArena(cid) 
			--pvpArenaDuel(cid) 
		--[[	if param == "suko" then
				pvpArenaPicks(cid)
			elseif pokes[param] then
			    pvpArenaBans(cid, param)
			else
				pvpArenaBans(cid)
			end ]]
			if param == "new" then  
			   -- ArenaPvpClass[cid] = ArenaPvp:new({}) 
			    --local pvp = ArenaPvpClass[cid] 
				local pvp = ArenaPvp:new(cid) 
				pvp:setName(getCreatureName(cid))
			elseif param == "get" then
			    --local pvpNew = {}
			    --local pvp = getmetatable(pvpNew)
				local pvp = ArenaPvp:new(cid)
			    -- print(pvp:getName())  
			elseif param == "arena" then
			     getTopRankPvp(cid)
			elseif param == "vk" then	  
				setPlayerStorageValue(cid, 84929, 1)
			elseif words == "!dungeons" then
			    local strBuffer = string.explode(param, ',') 
			    dungeon_type = strBuffer[1]--"Beginner"
				dungeon_id = strBuffer[2]--"Charizard_Beginner" 
				-- print(param)
				dungeon_id = param
				local idPos = goDungeon(cid, dungeon_type, dungeon_id)
			    if idPos ~= nil then 
				    createPokeInDungeon(dungeon_type, dungeon_id, idPos) 
                end		
				
				dungeon_id = param
				goDungeon(cid, dungeon_id)			
			end
			print("words: "..words)
			--[[elseif param == "dungeons" then
			    dungeon_type = "Beginner"
				dungeon_id = "Charizard_Beginner" 
				local idPos = goDungeon(cid, dungeon_type, dungeon_id)
			    if idPos ~= nil then 
				    createPokeInDungeon(dungeon_type, dungeon_id, idPos) 
                end				
			end]]
			
				
			
	    return true  
	end 
	
	
	if not isInArray(liberar, getCreatureName(cid)) then
	    return true   
	end
	for i = 0, 4 do
	    local times = i < 1 and 1 or (i*5)*60*1000
        --addEvent(gay, times, 1)
	   -- addEvent(gay, times, 2) 
	   -- addEvent(gay, times, 3)
	end
	
	return true
end
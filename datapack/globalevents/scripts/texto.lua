 local config = {

    positions = {
        ["Charmander"] = {x = 1055, y = 1917, z = 6},
        ["Squirtle"] = {x = 1055, y = 1919, z = 6},
        ["Bulbasaur"] = {x = 1055, y = 1921, z = 6},
        ["Torchic"] = {x = 1056, y = 1923, z = 6},
        ["Mudkip"] = {x = 1058, y = 1923, z = 6},
        ["Treecko"] = {x = 1060, y = 1923, z = 6},
        ["Chikorita"] = {x = 1061, y = 1921, z = 6},
        ["Totodile"] = {x = 1061, y = 1919, z = 6},
        ["Cyndaquil"] = {x = 1061, y = 1917, z = 6},
        ["Open Beta"] = {x = 1040, y = 1027, z = 7},
		["Bem Vindo ao Poke Impire"] = {x = 1037, y = 1032, z = 7},
		["Bem Vindo A Saffron"] = {x = 1040, y = 1040, z = 7},
   
   }
}
 
function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  
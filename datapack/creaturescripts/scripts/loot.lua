local monsters = {

["Rocket Machine"] = {itemid = 14215, count = 1, chance = 100},

}


function onKill(cid, target, lastHit)

        local tab = monsters[getCreatureName(target)]

        if tab then

                if math.random(100) < tab.chance then

                        doPlayerAddItem(cid, tab.itemid, tab.count)

                        doBroadcastMessage("O Player "..getCreatureName(cid).." conseguiu "..tab.count.." "..getItemNameById(tab.itemid).." ao matar "..getCreatureName(target)..".")

                end

        end

        return true

end
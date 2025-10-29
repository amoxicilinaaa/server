function onMoveItem(cid, item, count, toContainer, fromContainer, fromPos, toPos)
    if isPokeball(item.itemid) then
		addEvent(doUpdatePokemonsBarNew, 100, cid, true)
    end
    return true
end
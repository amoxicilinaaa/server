function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "My Wish")
		doRemoveItem(getPlayerSlotItem(cid, 8).uid, 1)

return true
end
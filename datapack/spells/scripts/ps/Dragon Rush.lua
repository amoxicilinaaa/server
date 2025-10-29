function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Dragon Rush")

return true
end
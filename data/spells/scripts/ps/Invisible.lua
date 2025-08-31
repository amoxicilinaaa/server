

	doDisapear(cid)
	doSendMagicEffect(getThingPosWithDebug(cid), 134)
	if isMonster(cid) then
	local pos = getThingPosWithDebug(cid)                           --alterei!
	doTeleportThing(cid, {x=4, y=3, z=10}, false)
	doTeleportThing(cid, pos, false)
	end
	addEvent(doAppear, 4000, cid)
        
return true
end









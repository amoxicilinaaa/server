function onUse(cid, item, fromPosition, itemEx, toPosition)

local config = {
	premium = sim,
	pos = {x = 1088, y = 2420, z = 8},
}

if config.premium == sim then
if isPremium(cid) then
doTeleportThing(cid, config.pos)
end
end

if config.premium == nao then
doTeleportThing(cid, config.pos)
end
end
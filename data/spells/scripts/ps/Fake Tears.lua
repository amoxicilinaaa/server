dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    local pos = getPosfromArea(cid, wish)
    local master = getCreatureMaster(cid)
    local n = 0

    doRaiseStatus(cid, 0, 20, 300, 10)

    while n < #pos do
        n = n + 1
        local thing = {x = pos[n].x, y = pos[n].y, z = pos[n].z, stackpos = 253}
        local pid = getThingFromPosWithProtect(thing)

        doSendMagicEffect(getThingPos(cid), 987)
        doSendMagicEffect(getThingPos(master), 987)

        if isCreature(pid) then
            if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                if canAttackOther(cid, pid) == "Cant" then
                    doRaiseStatus(pid, 0, 20, 300, 10)
                end
            elseif ehMonstro(cid) and ehMonstro(pid) then
                doRaiseStatus(pid, 0, 20, 300, 10)
            end
        end
    end

    return true
end
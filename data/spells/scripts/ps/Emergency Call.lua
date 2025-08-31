dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell

    local eff = spell == "Aromateraphy" and 14 or 13

    doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), bombWee3, 0, 0, eff)

    if isSummon(cid) then
        doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
    end

    doCureStatus(cid, "all")

    local uid = checkAreaUid(getThingPosWithDebug(cid), confusion, 1, 1)
    for _, pid in pairs(uid) do
        if isCreature(pid) and pid ~= cid then
            if ehMonstro(cid) and ehMonstro(pid) then
                doCureStatus(pid, "all")
            elseif isSummon(cid) and ((isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and not canAttackOther(cid, pid) == "Can")) then
                if isSummon(pid) then
                    doCureBallStatus(getPlayerSlotItem(getCreatureMaster(pid), 8).uid, "all")
                end
                doCureStatus(pid, "all")
            end
        end
    end

    return true
end
function onCombat(cid, target)
    if isMonster(target) then
        if not isInArray(passivepokemons, getCreatureName(target)) then
            doCreatureSetStorage(target, "hostile", 1)
        end
        doMonsterSetTarget(target, cid)
    end
    return true
end
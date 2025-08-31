function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local storage = getPlayerStorageValue(cid, 5000004)
    local posCid  = getThingPosWithDebug(cid)
    local posTgt  = getThingPosWithDebug(target)

    if storage >= 1 and storage <= 3 then
        -- Disparo visual
        doSendDistanceShoot(posCid, posTgt, 39)

        -- Dano escalonado conforme storage
        local factor = storage
        doDanoInTargetWithDelay(cid, target, STEELDAMAGE, -min * factor, -max * factor, 77)

        -- Reset storage e aplica outfit metálico
        setPlayerStorageValue(cid, 5000004, 0)
        doSetCreatureOutfit(cid, {lookType = 1735}, -1)
    end

    return true
end

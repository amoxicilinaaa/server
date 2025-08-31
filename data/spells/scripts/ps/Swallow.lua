function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local newlife = getCreatureMaxHealth(cid)
    local stage   = getPlayerStorageValue(cid, 5000004)
    local pos     = getThingPosWithDebug(cid)
    local heal    = 0

    if stage == 1 then
        heal = newlife / 2.5
    elseif stage == 2 then
        heal = newlife / 2
    elseif stage == 3 then
        heal = newlife
    else
        return true
    end

    -- Aplica cura
    doCreatureAddHealth(cid, heal)

    -- Reset storage e aplica outfit de recuperação
    setPlayerStorageValue(cid, 5000004, 0)
    doSetCreatureOutfit(cid, {lookType = 1735}, -1)

    -- Exibe texto animado com valor curado
    doSendAnimatedText(pos, "+" .. heal, 32)

    return true
end

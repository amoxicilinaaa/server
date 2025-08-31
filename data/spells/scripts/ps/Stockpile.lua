function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local stage = getPlayerStorageValue(cid, 5000004)

    if stage <= 0 then
        setPlayerStorageValue(cid, 5000004, 1)
        doSetCreatureOutfit(cid, {lookType = 1837}, 1000000)

    elseif stage == 1 then
        setPlayerStorageValue(cid, 5000004, 2)
        doSetCreatureOutfit(cid, {lookType = 1838}, 1000000)

    elseif stage == 2 then
        setPlayerStorageValue(cid, 5000004, 3)
        doSetCreatureOutfit(cid, {lookType = 1839}, 1000000)

    elseif stage == 3 then
        doSendAnimatedText(getThingPosWithDebug(cid), "MAXIMUM!", 144)
        -- Aqui você pode adicionar efeitos extras ou buffs se quiser
    end

    return true
end

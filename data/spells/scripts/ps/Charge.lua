dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local pos = getThingPosWithDebug(cid)

    if spell == "Charge" then
        doSendAnimatedText(pos, "CHARGE", 168)
        doSendMagicEffect(pos, 177)

    elseif spell == "Swords Dance" then
        doSendMagicEffect(pos, 408) -- pode ser ajustado para 132 se preferir

    elseif spell == "Bulk Up" then
        doSendMagicEffect(pos, 91)

    else
        doSendAnimatedText(pos, "FOCUS", 144)
        doSendMagicEffect(pos, 132)
    end

    -- Ativa storage para controle de estado
    setPlayerStorageValue(cid, 253, 1)

    return true
end
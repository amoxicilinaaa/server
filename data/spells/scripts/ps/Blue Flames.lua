dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local pos = spellData.posC or getThingPosWithDebug(cid)
    pos.x = pos.x + 1
    pos.y = pos.y + 1

    -- Efeito visual inicial
    doSendMagicEffect(pos, 390)

    -- Aplica transformação visual por 10 segundos
    addEvent(doSetCreatureOutfit, 20, cid, {lookType = 2347}, 10000)

    -- Marca storage de transformação
    setPlayerStorageValue(cid, 90177, 1)
    addEvent(setPlayerStorageValue, 9995, cid, 90177, -1)

    return true
end
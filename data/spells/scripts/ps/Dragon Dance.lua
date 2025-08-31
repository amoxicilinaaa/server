dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target

    local posC1 = getThingPosWithDebug(cid)

    -- Verifica se o alvo é Kingdra e aplica outfit especial
    if getSubName(cid, target) == "Kingdra" then
        doSetCreatureOutfit(cid, {lookType = 2334}, 4000)
    end

    -- Ativa armazenamento temporário
    setPlayerStorageValue(cid, 253, 1)
    setPlayerStorageValue(cid, 5000001, 1)
    addEvent(setPlayerStorageValue, 4000, cid, 5000001, -1)

    -- Efeito visual
    doSendMagicEffect(posC1, 852)

    return true
end
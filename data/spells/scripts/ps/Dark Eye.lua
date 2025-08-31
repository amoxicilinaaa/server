dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local pos = getThingPosWithDebug(cid)

    -- Efeito visual condicional
    local eff = (spell == "Dark Eye" or spell == "Dark Accurate") and 725 or 47
    doSendMagicEffect(pos, eff)

    -- Ativa storage de controle
    setPlayerStorageValue(cid, 999457, 1)

    return true
end
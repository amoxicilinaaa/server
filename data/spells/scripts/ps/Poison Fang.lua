
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Efeito visual na posição do alvo
    doSendMagicEffect(getThingPosWithDebug(target), 244)

    -- Dano tipo POISON com efeito visual 114 e delay
    doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 114)

    return true
end
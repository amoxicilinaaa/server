function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Aplica dano tipo NORMAL diretamente na posição do alvo, sem efeito visual
    doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, 0, 0, 0)

    -- Ativa storage temporária no alvo (ID 5000002)
    setPlayerStorageValue(target, 5000002, 1)

    -- Remove storage após 60 segundos
    addEvent(setPlayerStorageValue, 60 * 1000, target, 5000002, -1)

    return true
end
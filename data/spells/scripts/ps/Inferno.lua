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

    local pos = getThingPosWithDebug(cid)

    -- Tabela de ataques com efeito visual e tipo de dano
    local atk = {
        ["Inferno"] = {391, FIREDAMAGE},
        ["Fissure"] = {102, GROUNDDAMAGE}
    }

    -- Aplica efeito visual e dano inicial em área
    doMoveInArea2(cid, atk[spell][1], inferno1, atk[spell][2], 0, 0, spell)

    -- Aplica dano secundário com delay e sem efeito visual
    addEvent(doDanoWithProtect, math.random(100, 400), cid, atk[spell][2], pos, inferno2, -min, -max, 0)

    return true
end
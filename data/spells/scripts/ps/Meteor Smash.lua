function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posT = spellData.posT

    -- Ajuste de posição visual
    local pos = getThingPos(cid)
    pos.x = pos.x + 1
    pos.y = pos.y + 1

    -- Efeito de carregamento do ataque
    doSendMagicEffect(posT, 848)

    -- Dano direto no alvo
    doDanoInTargetWithDelay(cid, target, STEELDAMAGE, min, max, 0)

    -- Sequência de impactos com efeito visual 849
    addEvent(doDanoWithProtect, 60, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash1, -min, -max, 849)
    addEvent(doDanoWithProtect, 100, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash2, -min, -max, 849)
    addEvent(doDanoWithProtect, 200, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash3, -min, -max, 849)
    addEvent(doDanoWithProtect, 265, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash4, -min, -max, 849)

    return true
end
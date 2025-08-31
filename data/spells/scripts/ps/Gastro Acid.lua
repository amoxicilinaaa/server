function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Aplica múltiplos efeitos visuais e dano em área
    -- Parâmetros: cid, efeito de distância, efeito de dano, área visual, área de dano, tipo de dano, min, max
    doMoveInAreaMulti(cid, 107, 993, bullet, bulletDano, POISONDAMAGE, min, max)

    --[[ ☠️ Sugestão opcional: bônus contra tipo Fairy ou Grass
    local target = spellData.target
    if isCreature(target) and (isPokeType(target, "Fairy") or isPokeType(target, "Grass")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInAreaMulti, 400, cid, 107, 993, bullet, bulletDano, POISONDAMAGE, bonusMin, bonusMax)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
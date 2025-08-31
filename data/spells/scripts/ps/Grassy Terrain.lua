function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Aplica dano tipo GRASS em área ao redor do caster
    -- Parâmetros: cid, tipo de dano, posição, área, min, max, efeito visual
    doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(cid), selfArea2, min, max, 412)

    --[[ 🌿 Sugestão opcional: bônus contra tipo Water ou Rock
    local target = spellData.target
    if isCreature(target) and (isPokeType(target, "Water") or isPokeType(target, "Rock")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoWithProtect, 300, cid, GRASSDAMAGE, getThingPosWithDebug(cid), selfArea2, bonusMin, bonusMax, 412)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
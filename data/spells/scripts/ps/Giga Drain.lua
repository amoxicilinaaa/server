function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Captura a vida atual do alvo antes do dano
    local life = getCreatureHealth(target) or 0

    -- Aplica dano tipo GRASS com efeito visual 258
    doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 258)

    -- Calcula quanto de vida foi retirada
    local newlife = life - (getCreatureHealth(target) or 0)

    -- Efeito visual de cura no caster
    doSendMagicEffect(getThingPosWithDebug(cid), 14)

    -- Se houve dano, cura o caster com a mesma quantidade
    if newlife >= 1 then
        doCreatureAddHealth(cid, newlife)
        doSendAnimatedText(getThingPosWithDebug(cid), "+" .. newlife, 32)
    end

    --[[ 🌿 Sugestão opcional: bônus contra tipo Water ou Rock
    if isCreature(target) and (isPokeType(target, "Water") or isPokeType(target, "Rock")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoWithProtect, 300, cid, GRASSDAMAGE, getThingPosWithDebug(target), 0, -bonusMin, -bonusMax, 258)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
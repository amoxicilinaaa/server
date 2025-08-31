function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Posição base do caster
    local flamepos = getThingPosWithDebug(cid)
    local effect = 255 -- efeito padrão (fallback)

    -- Direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Ajusta posição e efeito visual com base na direção
    if a == 0 then -- Norte
        flamepos.x = flamepos.x + 1
        flamepos.y = flamepos.y - 1
        effect = 425
    elseif a == 1 then -- Leste
        flamepos.x = flamepos.x + 3
        flamepos.y = flamepos.y + 1
        effect = 426
    elseif a == 2 then -- Sul
        flamepos.x = flamepos.x + 1
        flamepos.y = flamepos.y + 3
        effect = 427
    elseif a == 3 then -- Oeste
        flamepos.x = flamepos.x - 1
        flamepos.y = flamepos.y + 1
        effect = 428
    end

    -- Aplica dano em área com tipo ICE
    doMoveInArea2(cid, 17, flamek, ICEDAMAGE, min, max, spell)

    -- Aplica efeito visual na posição ajustada
    doSendMagicEffect(flamepos, effect)

    --[[ ❄️ Sugestão opcional: bônus contra tipo Dragon ou Flying
    if isCreature(target) and (isPokeType(target, "Dragon") or isPokeType(target, "Flying")) then
        local bonusMin = math.floor(min * 0.2)
        local bonusMax = math.floor(max * 0.2)
        addEvent(doMoveInArea2, 300, cid, 17, flamek, ICEDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
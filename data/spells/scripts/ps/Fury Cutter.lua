function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Posição base do caster
    local effectpos = getThingPosWithDebug(cid)
    local effect = 255 -- fallback visual
    local dano = BUGDAMAGE

    -- Define tipo de dano por spell
    if spell == "Cutting Sheet" then
        dano = GRASSDAMAGE
    else
        dano = BUGDAMAGE
    end

    -- Direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Ajusta posição e efeito visual com base na direção e spell
    if a == 0 then -- Norte
        effectpos.x = effectpos.x + 1
        effectpos.y = effectpos.y - 1
        effect = spell == "Steel Wing" and 251 or spell == "Fury Cutter" and 527 or 470

    elseif a == 1 then -- Leste
        effectpos.x = effectpos.x + 2
        effectpos.y = effectpos.y + 1
        effect = spell == "Steel Wing" and 253 or spell == "Fury Cutter" and 528 or 468

    elseif a == 2 then -- Sul
        effectpos.x = effectpos.x + 1
        effectpos.y = effectpos.y + 2
        effect = spell == "Steel Wing" and 252 or spell == "Fury Cutter" and 530 or 469

    elseif a == 3 then -- Oeste
        effectpos.x = effectpos.x - 1
        effectpos.y = effectpos.y + 1
        effect = spell == "Steel Wing" and 254 or spell == "Fury Cutter" and 529 or 467
    end

    -- Função que aplica efeito visual e dano em área
    local function doFury(cid, effect)
        if not isCreature(cid) then return true end
        doSendMagicEffect(effectpos, effect)
        doMoveInArea2(cid, 0, wingatk, dano, min, max, spell)
    end

    -- Executa dois ataques com delay
    addEvent(doFury, 0, cid, effect)
    addEvent(doFury, 350, cid, effect)

    --[[ 💡 Sugestão opcional: bônus contra tipo Grass ou Psychic
    if isCreature(target) and (isPokeType(target, "Grass") or isPokeType(target, "Psychic")) then
        local bonusMin = math.floor(min * 0.2)
        local bonusMax = math.floor(max * 0.2)
        addEvent(doMoveInArea2, 500, cid, 0, wingatk, dano, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Posição base do caster
    local p = getThingPosWithDebug(cid)
    local eff = 64 -- efeito padrão

    -- Ajusta posição e efeito visual com base na direção
    if a == 0 then -- Norte
        doSendMagicEffect({x = p.x + 1, y = p.y - 1, z = p.z}, 299)
        eff = 64
    elseif a == 1 then -- Leste
        doSendMagicEffect({x = p.x + 5, y = p.y + 1, z = p.z}, 296)
        eff = 65
    elseif a == 2 then -- Sul
        doSendMagicEffect({x = p.x + 1, y = p.y + 5, z = p.z}, 298)
        eff = 66
    elseif a == 3 then -- Oeste
        doSendMagicEffect({x = p.x - 1, y = p.y + 1, z = p.z}, 297)
        eff = 67
    end

    -- Aplica dano em área com tipo WATER
    doMoveInArea2(cid, 0, triplo6, WATERDAMAGE, min, max, spell)

    --[[ 💧 Sugestão opcional: bônus contra tipo Fire ou Rock
    if isCreature(target) and (isPokeType(target, "Fire") or isPokeType(target, "Rock")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 400, cid, 0, triplo6, WATERDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
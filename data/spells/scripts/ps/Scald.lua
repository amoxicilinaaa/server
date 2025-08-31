function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local flamepos = getThingPosWithDebug(cid)
    local effect = 255

    -- Determina direção do caster em relação ao alvo
    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Ajusta posição e efeito visual conforme direção
    if dir == 0 then -- norte
        flamepos.x = flamepos.x + 1
        flamepos.y = flamepos.y - 1
        effect = 292
    elseif dir == 1 then -- leste
        flamepos.x = flamepos.x + 3
        flamepos.y = flamepos.y + 1
        effect = 295
    elseif dir == 2 then -- sul
        flamepos.x = flamepos.x + 1
        flamepos.y = flamepos.y + 3
        effect = 293
    elseif dir == 3 then -- oeste
        flamepos.x = flamepos.x - 1
        flamepos.y = flamepos.y + 1
        effect = 294
    end

    -- Aplica dano em área tipo água com efeito de vapor
    doMoveInArea2(cid, 396, flamek, WATERDAMAGE, min, max, spell)

    -- Efeito visual direcional
    doSendMagicEffect(flamepos, effect)

    -- Aplica burn no alvo
    doBurnPoke(cid, target)

    return true
end

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    local effectpos = getThingPosWithDebug(cid)
    local effect    = 255

    -- Define direção do efeito
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    if a == 0 then
        effect = (spell == "Wing Blade") and 251 or 128
        effectpos.x = effectpos.x + 1
        effectpos.y = effectpos.y - 1
    elseif a == 1 then
        effect = (spell == "Wing Blade") and 253 or 129
        effectpos.x = effectpos.x + 2
        effectpos.y = effectpos.y + 1
    elseif a == 2 then
        effect = (spell == "Wing Blade") and 252 or 131
        effectpos.x = effectpos.x + 1
        effectpos.y = effectpos.y + 2
    elseif a == 3 then
        effect = (spell == "Wing Blade") and 254 or 130
        effectpos.x = effectpos.x - 1
        effectpos.y = effectpos.y + 1
    end

    -- Efeito visual direcional
    doSendMagicEffect(effectpos, effect)

    -- Dano em área tipo Flying
    doMoveInArea2(cid, 0, wingatk, FLYINGDAMAGE, min, max, spell)

    return true
end

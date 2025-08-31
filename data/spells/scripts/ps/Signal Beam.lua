function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    local p = getThingPosWithDebug(cid)
    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Tabela de efeitos visuais por direção
    local t = {
        [0] = {455, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- norte
        [1] = {456, {x = p.x + 5, y = p.y + 1, z = p.z}}, -- leste
        [2] = {457, {x = p.x + 1, y = p.y + 5, z = p.z}}, -- sul
        [3] = {458, {x = p.x - 1, y = p.y + 1, z = p.z}}  -- oeste
    }

    -- Aplica dano tipo Bug em área
    doMoveInArea2(cid, 0, triplo6, BUGDAMAGE, min, max, spell)

    -- Efeito visual direcional
    doSendMagicEffect(t[dir][2], t[dir][1])

    return true
end

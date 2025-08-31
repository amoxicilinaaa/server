function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    local p = getThingPosWithDebug(cid)

    -- Posições e efeitos visuais sincronizados
    local t = {
        {462, {x = p.x + 1, y = p.y - 1, z = p.z}},
        {460, {x = p.x + 2, y = p.y + 1, z = p.z}},
        {459, {x = p.x + 1, y = p.y + 2, z = p.z}},
        {461, {x = p.x - 1, y = p.y + 1, z = p.z}},
    }

    -- Dano inicial em área
    doAreaCombatHealth(cid, DARKDAMAGE, p, scyther5, -min, -max, 165)

    -- Efeitos visuais em dois ciclos
    for a = 0, 1 do
        for i = 1, 4 do
            addEvent(doSendMagicEffect, a * 400, t[i][2], t[i][1])
        end
    end

    -- Dano repetido com delay para reforço
    addEvent(doAreaCombatHealth, 400, cid, DARKDAMAGE, p, scyther5, -min, -max, 165)

    return true
end
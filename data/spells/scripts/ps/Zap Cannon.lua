function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Tabelas de efeitos visuais por direção
    local t
    if isInArray({"Shiny Magneton"}, getSubName(cid, target)) then
        t = {
            [0] = {981, {x = p.x,     y = p.y - 1, z = p.z}},
            [1] = {982, {x = p.x + 6, y = p.y,     z = p.z}},
            [2] = {983, {x = p.x,     y = p.y + 6, z = p.z}},
            [3] = {984, {x = p.x - 1, y = p.y,     z = p.z}},
        }

        -- Dano em área e efeito especial para Shiny Magneton
        doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)
        doMoveInArea2(cid, 208, reto6, ELECTRICDAMAGE, 0, 0, "Zap Cannon Eff")
        doSendMagicEffect(t[a][2], t[a][1])
    else
        t = {
            [0] = {73, {x = p.x,     y = p.y - 1, z = p.z}},
            [1] = {74, {x = p.x + 6, y = p.y,     z = p.z}},
            [2] = {75, {x = p.x,     y = p.y + 6, z = p.z}},
            [3] = {76, {x = p.x - 1, y = p.y,     z = p.z}},
        }

        -- Dano em área e efeito padrão
        doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)
        doMoveInArea2(cid, 177, reto6, ELECTRICDAMAGE, 0, 0, "Zap Cannon Eff")
        doSendMagicEffect(t[a][2], t[a][1])
    end

    return true
end
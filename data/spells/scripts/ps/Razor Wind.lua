function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Áreas de dano e efeito visual
    local areaDano = {DanoSL1, DanoSL2, DanoSL3, DanoSL4}
    local areaEff = (d == 0 or d == 3) and {EffSL1, EffSL2, EffSL3, EffSL4} or {Eff2SL1, Eff2SL2, Eff2SL3, Eff2SL4}

    -- Posições e efeitos visuais por direção
    local t = {
        [0] = {466, {x = p.x + 1, y = p.y - 0, z = p.z}}, -- norte
        [1] = {464, {x = p.x + 2, y = p.y + 1, z = p.z}}, -- leste
        [2] = {463, {x = p.x + 1, y = p.y + 2, z = p.z}}, -- sul
        [3] = {465, {x = p.x - 0, y = p.y + 2, z = p.z}}  -- oeste
    }

    -- Execução sequencial dos cortes
    for i = 0, 3 do
        local delay = i * 300

        -- Atualiza posição para cada corte
        local pos = {
            [0] = {466, {x = p.x + 1, y = p.y - i, z = p.z}},
            [1] = {464, {x = p.x + (i + 2), y = p.y + 1, z = p.z}},
            [2] = {463, {x = p.x + 1, y = p.y + (i + 2), z = p.z}},
            [3] = {465, {x = p.x - i, y = p.y + 2, z = p.z}}
        }

        -- Efeito visual
        addEvent(doMoveInArea2, delay, cid, pos[d][1], areaEff[i + 1], NORMALDAMAGE, 0, 0, spell)

        -- Dano real
        addEvent(doMoveInArea2, delay, cid, 0, areaDano[i + 1], NORMALDAMAGE, min, max, spell)
    end

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max
    local mydir  = getCreatureLookDir(cid)
    local a      = getThingPosWithDebug(cid)

    -- Tabela de posições e efeitos por direção
    local X = {
        {{x = a.x + 1, y = a.y,     z = a.z}, 437, 663}, -- norte
        {{x = a.x + 2, y = a.y + 1, z = a.z}, 438, 664}, -- leste
        {{x = a.x + 1, y = a.y + 2, z = a.z}, 436, 662}, -- sul
        {{x = a.x,     y = a.y + 1, z = a.z}, 435, 661}, -- oeste
    }

    local pos = X[mydir + 1]

    -- Efeitos visuais em sequência
    for b = 1, 3 do
        local effect = (spell == "X-Scissor") and pos[2] or pos[3]
        addEvent(doSendMagicEffect, b * 70, pos[1], effect)
    end

    -- Dano em área com tipo e ordem adaptados
    if spell == "X-Scissor" then
        doMoveInArea2(cid, 2, xScissor, BUGDAMAGE, min, max, spell)
    else
        doMoveInArea2(cid, 2, xScissor, POISONDAMAGE, max, min, spell)
    end

    return true
end

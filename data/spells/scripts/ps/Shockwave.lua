function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função que aplica dano e efeito visual em área
    local function sendAtk(cid, area, areaEff, eff)
        if not isCreature(cid) then return end
        doAreaCombatHealth(cid, GROUNDDAMAGE, areaEff, 0, 0, 0, eff)
        doAreaCombatHealth(cid, GROUNDDAMAGE, area, whirl3, -min, -max, 255)
    end

    -- Tabela de posições e efeitos por direção
    for a = 0, 5 do
        local t = {
            [0] = {126, {x = p.x,       y = p.y - (a + 1), z = p.z}, {x = p.x + 1, y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {124, {x = p.x + (a + 1), y = p.y,       z = p.z}, {x = p.x + (a + 1), y = p.y + 1, z = p.z}}, -- leste
            [2] = {125, {x = p.x,       y = p.y + (a + 1), z = p.z}, {x = p.x + 1, y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {123, {x = p.x - (a + 1), y = p.y,       z = p.z}, {x = p.x - (a + 1), y = p.y + 1, z = p.z}}  -- oeste
        }

        addEvent(sendAtk, 325 * a, cid, t[d][2], t[d][3], t[d][1])
    end

    return true
end

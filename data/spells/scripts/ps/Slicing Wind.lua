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
    local function sendAtk(cid, area, eff)
        if not isCreature(cid) then return end
        doAreaCombatHealth(cid, psyDmg, area, 0, 0, 0, eff)
        doAreaCombatHealth(cid, psyDmg, area, Crunch3, -min, -max, 255)
    end

    -- Tabela de posições por direção
    for a = 0, 4 do
        local t = {
            [0] = {307, {x = p.x + 1,     y = p.y - a,     z = p.z}}, -- norte
            [1] = {307, {x = p.x + a + 2, y = p.y + 1,     z = p.z}}, -- leste
            [2] = {307, {x = p.x + 1,     y = p.y + a + 2, z = p.z}}, -- sul
            [3] = {307, {x = p.x - a,     y = p.y + 1,     z = p.z}}  -- oeste
        }

        addEvent(sendAtk, 370 * a, cid, t[d][2], t[d][1])
    end

    return true
end

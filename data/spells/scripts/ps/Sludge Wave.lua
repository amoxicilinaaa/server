function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    -- Parâmetros da condição "Miss"
    local ret = {
        id    = 0,
        cd    = 9,
        eff   = 731,
        check = 0,
        spell = spell,
        cond  = "Miss"
    }

    -- Função que aplica dano e efeito visual em área
    local function sendAtk(cid, area, eff)
        if not isCreature(cid) then return end
        doAreaCombatHealth(cid, POISONDAMAGE, area, 0, 0, 0, eff)
        doAreaCombatHealth(cid, POISONDAMAGE, area, whirl3, -min, -max, 845)
    end

    -- Tabela de posições por direção
    for a = 0, 4 do
        local t = {
            [0] = {114, {x = p.x,       y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {114, {x = p.x + (a + 1), y = p.y,       z = p.z}}, -- leste
            [2] = {114, {x = p.x,       y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {114, {x = p.x - (a + 1), y = p.y,       z = p.z}}  -- oeste
        }

        addEvent(sendAtk, 300 * a, cid, t[d][2], t[d][1])
    end

    return true
end

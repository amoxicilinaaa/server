function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função auxiliar para aplicar dano e efeitos visuais
    local function sendAtk(cid, area, eff)
        if not isCreature(cid) then return end
        if not isSightClear(p, area, false) then return true end

        -- Efeito visual puro
        doAreaCombatHealth(cid, psyDmg, area, 0, 0, 0, eff)

        -- Dano em área com reforço visual
        doAreaCombatHealth(cid, psyDmg, area, whirl3, -min, -max, 255)
    end

    -- Execução sequencial em linha reta com delay
    for a = 0, 4 do
        local t = {
            [0] = {250, {x = p.x,     y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {250, {x = p.x + (a + 1), y = p.y,     z = p.z}}, -- leste
            [2] = {250, {x = p.x,     y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {250, {x = p.x - (a + 1), y = p.y,     z = p.z}}  -- oeste
        }

        local delay = 370 * a
        addEvent(sendAtk, delay, cid, t[d][2], t[d][1])
    end

    return true
end
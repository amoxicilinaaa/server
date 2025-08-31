function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função auxiliar para aplicar dano em área secundária
    local function sendAtk(cid, area)
        if isCreature(cid) then
            doAreaCombatHealth(cid, ROCKDAMAGE, area, pulse2, -min, -max, 255)
        end
    end

    -- Execução sequencial em linha reta com delay
    for a = 0, 3 do
        local t = {
            [0] = {29, {x = p.x,     y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {29, {x = p.x + (a + 1), y = p.y,     z = p.z}}, -- leste
            [2] = {29, {x = p.x,     y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {29, {x = p.x - (a + 1), y = p.y,     z = p.z}}, -- oeste
        }

        local pos = t[d][2]
        local eff = t[d][1]
        local delay = 400 * a

        -- Dano em área secundária
        addEvent(sendAtk, delay, cid, pos)

        -- Efeitos visuais e reforço de impacto
        addEvent(doAreaCombatHealth, delay, cid, ROCKDAMAGE, pos, pulse1, 0, 0, eff)
        addEvent(doAreaCombatHealth, delay, cid, ROCKDAMAGE, pos, pulse1, 0, 0, 103)
    end
    return true
end
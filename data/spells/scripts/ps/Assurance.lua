dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local p = spellData.posC
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função para aplicar efeito visual e dano
    local function sendAtk(cid, area1, area2, eff)
        if not isCreature(cid) then return end
        doAreaCombatHealth(cid, DARKDAMAGE, area1, 0, 0, 0, eff)
        doAreaCombatHealth(cid, DARKDAMAGE, area2, whirl3, -min, -max, 0)
    end

    -- Dispara 4 cortes em linha com delay crescente
    for a = 0, 3 do
        local t = {
            [0] = {230, {x = p.x + 1, y = p.y - (a + 1), z = p.z}, {x = p.x, y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {226, {x = p.x + (a + 2), y = p.y + 1, z = p.z}, {x = p.x + (a + 1), y = p.y, z = p.z}}, -- leste
            [2] = {235, {x = p.x + 1, y = p.y + (a + 1), z = p.z}, {x = p.x, y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {231, {x = p.x - (a + 1), y = p.y + 1, z = p.z}, {x = p.x - (a + 1), y = p.y, z = p.z}}  -- oeste
        }

        addEvent(function()
            if isCreature(cid) then
                sendAtk(cid, t[d][2], t[d][3], t[d][1])
            end
        end, 300 * a)
    end

    return true
end
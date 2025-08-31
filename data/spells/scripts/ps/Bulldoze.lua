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

    -- Função para aplicar efeito visual e dano em área
    local function sendAtk(cid, area, areaEff, eff)
        if not isCreature(cid) then return end
        doAreaCombatHealth(cid, GROUNDDAMAGE, areaEff, 0, 0, 0, eff) -- efeito visual
        doAreaCombatHealth(cid, GROUNDDAMAGE, area, whirl3, -min, -max, 255) -- dano real
    end

    -- Dispara 6 impactos em linha com delay crescente
    for a = 0, 5 do
        local t = {
            [0] = {126, {x = p.x, y = p.y - (a + 1), z = p.z}, {x = p.x + 1, y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {124, {x = p.x + (a + 1), y = p.y, z = p.z}, {x = p.x + (a + 1), y = p.y + 1, z = p.z}}, -- leste
            [2] = {125, {x = p.x, y = p.y + (a + 1), z = p.z}, {x = p.x + 1, y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {123, {x = p.x - (a + 1), y = p.y, z = p.z}, {x = p.x - (a + 1), y = p.y + 1, z = p.z}}  -- oeste
        }

        addEvent(function()
            sendAtk(cid, t[d][2], t[d][3], t[d][1])
        end, 325 * a)
    end

    return true
end
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

    -- Função para aplicar dano e efeito visual
    local function sendAtk(cid, area, eff)
        if not isCreature(cid) then return end
        doAreaCombatHealth(cid, ROCKDAMAGE, area, 0, 0, 0, eff) -- efeito visual
        doAreaCombatHealth(cid, ROCKDAMAGE, area, whirl3, -min, -max, 18) -- dano real
    end

    -- Dispara 5 cortes em linha na direção do alvo
    for a = 0, 4 do
        local t = {
            [0] = {730, {x = p.x, y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {730, {x = p.x + (a + 1), y = p.y, z = p.z}}, -- leste
            [2] = {730, {x = p.x, y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {730, {x = p.x - (a + 1), y = p.y, z = p.z}}  -- oeste
        }

        addEvent(function()
            if isCreature(cid) then
                sendAtk(cid, t[d][2], 255)
            end
        end, 300 * a)

        addEvent(function()
            if isCreature(cid) then
                doSendMagicEffect(t[d][2], t[d][1])
            end
        end, 328 * a)
    end

    return true
end
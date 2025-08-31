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

    -- Função para aplicar dano e efeitos em uma área
    local function sendAtk(cid, area)
        if not isCreature(cid) then return end

        addEvent(function()
            if isCreature(cid) then
                doAreaCombatHealth(cid, FLYINGDAMAGE, area, whirl3, -min, -max, 966)
            end
        end, 6)

        addEvent(function()
            if isCreature(cid) then
                doAreaCombatHealth(cid, FLYINGDAMAGE, area, whirl3, 0, 0, 931)
            end
        end, 200)

        addEvent(function()
            if isCreature(cid) then
                doAreaCombatHealth(cid, FLYINGDAMAGE, area, whirl3, 0, 0, 931)
            end
        end, 360)
    end

    -- Define posições de corte com base na direção
    for a = 0, 5 do
        local t = {
            [0] = {128, {x = p.x, y = p.y - (a + 1), z = p.z}, {x = p.x + 1, y = p.y - (a + 1), z = p.z}},
            [1] = {129, {x = p.x + (a + 1), y = p.y, z = p.z}, {x = p.x + (a + 2), y = p.y + 1, z = p.z}},
            [2] = {131, {x = p.x, y = p.y + (a + 1), z = p.z}, {x = p.x + 1, y = p.y + (a + 2), z = p.z}},
            [3] = {130, {x = p.x - (a + 1), y = p.y, z = p.z}, {x = p.x - (a + 1), y = p.y + 1, z = p.z}}
        }

        addEvent(function()
            if isCreature(cid) then
                sendAtk(cid, t[d][2])
                -- Se quiser ativar o efeito visual de corte, descomente abaixo:
                -- doSendMagicEffect(t[d][3], t[d][1])
            end
        end, 300 * a)
    end

    return true
end
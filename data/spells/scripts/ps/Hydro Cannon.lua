function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Posição base do caster
    local p = getThingPosWithDebug(cid)

    -- Direção do caster em relação ao alvo
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função que executa o ataque em uma área com efeito visual e dano
    local function sendAtk(cid, area, eff)
        if isCreature(cid) then
            -- doAreaCombatHealth sem dano, apenas efeito visual
            doAreaCombatHealth(cid, WATERDAMAGE, area, 0, 0, 0, eff)
            -- doAreaCombatHealth com dano real usando área whirl3
            doAreaCombatHealth(cid, WATERDAMAGE, area, whirl3, -min, -max, 68)
        end
    end

    -- Executa 5 ataques em sequência com delay progressivo e direção baseada no alvo
    for a = 0, 4 do
        local t = {
            [0] = {64, {x = p.x, y = p.y - (a + 1), z = p.z}}, -- Norte
            [1] = {65, {x = p.x + (a + 1), y = p.y, z = p.z}}, -- Leste
            [2] = {66, {x = p.x, y = p.y + (a + 1), z = p.z}}, -- Sul
            [3] = {67, {x = p.x - (a + 1), y = p.y, z = p.z}}  -- Oeste
        }
        addEvent(sendAtk, 300 * a, cid, t[d][2], t[d][1])
    end

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    local p = getThingPosWithDebug(cid)

    -- Define direção do corte
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função que envia efeito visual e aplica dano em área
    local function sendAtk(cid, area, areaEff, eff)
        if not isCreature(cid) then return end

        -- Efeito visual recolorido (489) na trilha
        doAreaCombatHealth(cid, POISONDAMAGE, areaEff, 0, 0, 0, eff)

        -- Dano em área com efeito 105 e reforço visual 20
        doAreaCombatHealth(cid, POISONDAMAGE, area, whirl3, -min, -max, 105)
        doAreaCombatHealth(cid, POISONDAMAGE, area, whirl3, 0, 0, 20)
    end

    -- Sequência de cortes em linha com delay
    for a = 0, 5 do
        local t = {
            [0] = {489, {x = p.x,     y = p.y - (a + 1), z = p.z}, {x = p.x + 1, y = p.y - (a + 1), z = p.z}}, -- norte
            [1] = {489, {x = p.x + (a + 1), y = p.y,     z = p.z}, {x = p.x + (a + 1), y = p.y + 1, z = p.z}}, -- leste
            [2] = {489, {x = p.x,     y = p.y + (a + 1), z = p.z}, {x = p.x + 1, y = p.y + (a + 1), z = p.z}}, -- sul
            [3] = {489, {x = p.x - (a + 1), y = p.y,     z = p.z}, {x = p.x - (a + 1), y = p.y + 1, z = p.z}}, -- oeste
        }

        addEvent(sendAtk, 325 * a, cid, t[d][2], t[d][3], t[d][1])
    end

    -- Sugestão futura: aplicar outfit especial para Absol com chifre rosa
    -- if getSubName(cid, target) == "Absol" then
    --     doSetCreatureOutfit(cid, {lookType = customAbsolOutfit}, 1000)
    -- end

    return true
end
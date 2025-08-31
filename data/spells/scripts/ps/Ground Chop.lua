function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função que aplica efeito visual e dano em duas áreas
    local function sendAtk(cid, area, area2, eff)
        if not isCreature(cid) then return true end
        -- Aplica efeito visual sem dano
        doAreaCombatHealth(cid, FIGHTINGDAMAGE, area, 0, 0, 0, eff)
        -- Aplica dano real com efeito 255
        doAreaCombatHealth(cid, FIGHTINGDAMAGE, area2, whirl3, -min, -max, 255)
    end

    -- Executa 5 avanços em linha reta com delay progressivo
    for a = 0, 4 do
        local t = {
            [0] = {99, {x = p.x + 1, y = p.y - (a + 1), z = p.z}, {x = p.x, y = p.y - (a + 1), z = p.z}}, -- Norte
            [1] = {99, {x = p.x + (a + 2), y = p.y + 1, z = p.z}, {x = p.x + (a + 1), y = p.y, z = p.z}}, -- Leste
            [2] = {99, {x = p.x + 1, y = p.y + (a + 2), z = p.z}, {x = p.x, y = p.y + (a + 1), z = p.z}}, -- Sul
            [3] = {99, {x = p.x - (a + 1), y = p.y + 1, z = p.z}, {x = p.x - (a + 1), y = p.y, z = p.z}}  -- Oeste
        }

        -- Executa o ataque com delay baseado no avanço
        addEvent(sendAtk, 270 * a, cid, t[d][2], t[d][3], t[d][1])
    end

    --[[ 🥊 Sugestão opcional: bônus contra tipo Normal ou Ice
    if isCreature(target) and (isPokeType(target, "Normal") or isPokeType(target, "Ice")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doAreaCombatHealth, 1500, cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), whirl3, -bonusMin, -bonusMax, 255)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
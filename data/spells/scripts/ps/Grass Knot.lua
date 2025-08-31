function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Função que aplica dano, efeito visual e teleporta o caster
    local function sendAtk(cid, area, eff, area2)
        if not isCreature(cid) then return true end
        if not isWalkable(area) then return true end
        if isInArray(waters, getTileInfo(area).itemid) then return true end

        -- Aplica dano na área
        doAreaCombatHealth(cid, GRASSDAMAGE, area, whirl3, -min, -max, 728)

        -- Efeito visual secundário
        doAreaCombatHealth(cid, GRASSDAMAGE, area, whirl3, 0, 0, 497)

        -- Teleporta o caster para a nova posição
        doTeleportThing(cid, area)
    end

    -- Define posições de avanço com base na direção
    for a = 0, 5 do
        local t = {
            [0] = {0, {x = p.x, y = p.y - (a + 1), z = p.z}, {x = p.x + 1, y = p.y - (a + 1), z = p.z}}, -- Norte
            [1] = {0, {x = p.x + (a + 1), y = p.y, z = p.z}, {x = p.x + (a + 1) + 1, y = p.y + 1, z = p.z}}, -- Leste
            [2] = {0, {x = p.x, y = p.y + (a + 1), z = p.z}, {x = p.x + 1, y = p.y + (a + 1) + 1, z = p.z}}, -- Sul
            [3] = {0, {x = p.x - (a + 1), y = p.y, z = p.z}, {x = p.x - (a + 1), y = p.y + 1, z = p.z}} -- Oeste
        }

        -- Impede movimento durante o avanço
        doCreatureSetNoMove(cid, true)

        -- Executa o ataque com delay progressivo
        addEvent(sendAtk, 120 * a, cid, t[d][2], t[d][1], t[d][3])

        -- Libera movimento após o último avanço
        addEvent(doCreatureSetNoMove, 1000, cid, false)
    end

    --[[ 🌿 Sugestão opcional: bônus contra tipo Water ou Rock
    if isCreature(target) and (isPokeType(target, "Water") or isPokeType(target, "Rock")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doAreaCombatHealth, 800, cid, GRASSDAMAGE, getThingPosWithDebug(target), whirl3, -bonusMin, -bonusMax, 728)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
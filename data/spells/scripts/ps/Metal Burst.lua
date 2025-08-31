function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC

    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Efeito de carregamento do ataque
    doSendMagicEffect(posC, 349)

    -- Função para aplicar efeito visual
    local function sendAtk(cid, area, eff)
        if not isCreature(cid) then return true end
        doAreaCombatHealth(cid, STELLDAMAGE, area, 0, 0, 0, eff)
        doAreaCombatHealth(cid, STELLDAMAGE, area, whirl3, 0, 0, 0)
    end

    -- Função para aplicar dano com efeito adicional
    local function sendAtk2(cid, area, eff)
        if not isCreature(cid) then return true end
        doAreaCombatHealth(cid, STELLDAMAGE, area, 0, 0, 0, eff)
        addEvent(function()
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, STELLDAMAGE, area, sand1, 0, 0, 838)
        end, 210)
        doAreaCombatHealth(cid, STELLDAMAGE, area, sand1, -min, -max, 0)
    end

    -- Função que inicia a sequência de explosões em linha
    local function doStartBurst(cid)
        for a = 0, 4 do
            local t = {
                [0] = {537, {x = p.x + 1, y = p.y - a, z = p.z}},
                [1] = {537, {x = p.x + a + 2, y = p.y + 1, z = p.z}},
                [2] = {537, {x = p.x + 1, y = p.y + a + 2, z = p.z}},
                [3] = {537, {x = p.x - a, y = p.y + 1, z = p.z}},
            }
            local t2 = {
                [0] = {255, {x = p.x, y = p.y - a - 1, z = p.z}},
                [1] = {255, {x = p.x + a + 1, y = p.x, z = p.z}},
                [2] = {255, {x = p.x, y = p.y + a + 1, z = p.z}},
                [3] = {255, {x = p.x - a - 1, y = p.y, z = p.z}},
            }

            addEvent(function()
                if not isCreature(cid) then return true end
                sendAtk(cid, t[d][2], t[d][1])
                sendAtk2(cid, t2[d][2], 0)
            end, 300 * a)
        end
    end

    -- Ajusta direção do caster e paralisa temporariamente
    doCreatureSetLookDir(cid, d)
    stopNow(cid, 860)

    -- Inicia sequência de dano após delay
    addEvent(doStartBurst, 350, cid)

    return true
end
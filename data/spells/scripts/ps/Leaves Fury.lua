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

    local pos = getThingPosWithDebug(cid)

    -- Aplica dano em área tipo GRASS com efeito visual
    addEvent(doCombatAreaHealth, 140, cid, GRASSDAMAGE, pos, grassarea, -min, -max, 0)

    -- Função que envia projétil tipo folha
    local function doSendLeafStorm(cid, pos)
        if not isCreature(cid) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), pos, 8) -- ID 8 = folha
    end

    -- Dispara 100 folhas em posições aleatórias ao redor do caster
    for a = 1, 100 do
        local lugar = {
            x = pos.x + math.random(-6, 6),
            y = pos.y + math.random(-5, 5),
            z = pos.z
        }
        addEvent(doSendLeafStorm, a * 2, cid, lugar)
    end

    return true
end
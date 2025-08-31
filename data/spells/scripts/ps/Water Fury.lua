function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max

    local pos   = getThingPosWithDebug(cid)
    local poss  = {x = pos.x + 1, y = pos.y + 1, z = pos.z}

    -- Função que envia bolhas e aplica dano em área
    local function doSendBubble(cid, pos)
        if not isCreature(cid) then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        -- Efeitos mágicos iniciais
        doSendMagicEffect(poss, 241)
        doSendMagicEffect(pos, 53)
        doSendMagicEffect(pos, 154)
        doSendMagicEffect(pos, 1)
        doSendMagicEffect(pos, 68)

        -- Disparo visual com delay
        addEvent(doSendDistanceShoot, 950, getThingPosWithDebug(cid), pos, 2)

        -- Efeitos mágicos adicionais em sequência
        addEvent(doSendMagicEffect, 1100, pos, 248)
        addEvent(doSendMagicEffect, 1200, pos, 53)
        addEvent(doSendMagicEffect, 1210, pos, 154)
        addEvent(doSendMagicEffect, 1220, pos, 1)

        -- Dano tipo DRAGONDAMAGE em área pequena
        addEvent(doDanoWithProtect, 40, cid, DRAGONDAMAGE, pos, waterarea, -min, -max, 0)
    end

    -- Executa 20 bolhas em posições aleatórias próximas
    for a = 1, 20 do
        local lugar = {
            x = pos.x + math.random(-4, 4),
            y = pos.y + math.random(-3, 3),
            z = pos.z
        }
        addEvent(doSendBubble, a * 25, cid, lugar)
    end

    -- Dano tipo WATERDAMAGE em área principal
    addEvent(doDanoWithProtect, 280, cid, WATERDAMAGE, pos, waterarea, -min, -max, 0)

    return true
end

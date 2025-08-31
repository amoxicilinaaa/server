function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local min    = spellData.min
    local max    = spellData.max

    local p = getThingPosWithDebug(cid)
    p.x = p.x + 1
    p.y = p.y + 1

    -- Efeito visual inicial
    sendEffWithProtect(cid, p, 151)

    -- Função que envia bolhas e aplica dano em área
    local function doDano(cid)
        if not isCreature(cid) then return end
        local pos = getThingPosWithDebug(cid)

        -- Função auxiliar para enviar bolha visual
        local function doSendBubble(cid, pos)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 39)
            doSendMagicEffect(pos, 239)
        end

        -- Dispersão de bolhas aleatórias
        for a = 1, 20 do
            local r1 = math.random(-4, 4)
            local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
            local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
            addEvent(doSendBubble, a * 25, cid, lugar)
        end

        -- Dano tipo ROCK em área waterarea
        addEvent(doDanoWithProtect, 150, cid, ROCKDAMAGE, pos, waterarea, -min, -max, 0)
    end

    -- Executa dano com delay
    addEvent(doDano, 1250, cid)

    return true
end

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Aplica dano em área com tipo FIGHTING (pode ser alterado para GRASS se necessário)
    addEvent(doDanoWithProtect, 150, cid, FIGHTINGDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)

    -- Posição base do caster
    local pos = getThingPosWithDebug(cid)

    -- Função que envia um projétil visual tipo folha
    local function doSendLeafStorm(cid, pos)
        if not isCreature(cid) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), pos, 26) -- efeito de folha
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

    --[[ 🍃 Sugestão opcional: bônus contra tipo Water ou Rock
    local target = spellData.target
    if isCreature(target) and (isPokeType(target, "Water") or isPokeType(target, "Rock")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoWithProtect, 600, cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), grassarea, -bonusMin, -bonusMax, 0)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]
    return true
end
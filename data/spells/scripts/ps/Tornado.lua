function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max
    local pos   = getThingPosWithDebug(cid)

    -- Função que envia um tornado visual e ignora se estiver com medo ou dormindo
    local function doSendTornado(cid, pos)
        if not isCreature(cid) then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        doSendDistanceShoot(getThingPosWithDebug(cid), pos, 36) -- efeito de tornado
        doSendMagicEffect(pos, 967) -- impacto visual
    end

    -- Executa 3 ciclos de 20 tornados em posições aleatórias
    for b = 1, 3 do
        for a = 1, 20 do
            local lugar = {
                x = pos.x + math.random(-4, 4),
                y = pos.y + math.random(-3, 3),
                z = pos.z
            }
            addEvent(doSendTornado, a * 75, cid, lugar)
        end
    end

    -- Aplica dano em área
    doDanoWithProtect(cid, FLYINGDAMAGE, pos, waterarea, -min, -max, 0)

    return true
end

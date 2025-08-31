function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    local pos = getThingPosWithDebug(cid)

    -- Função que envia disparo ácido visual
    local function doSendAcid(cid, pos)
        if not isCreature(cid) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), pos, 14)
        doSendMagicEffect(pos, 114)
    end

    -- Dispersão de ácido em área aleatória (3 ciclos de 20 disparos)
    for b = 1, 3 do
        for a = 1, 20 do
            local lugar = {
                x = pos.x + math.random(-4, 4),
                y = pos.y + math.random(-3, 3),
                z = pos.z
            }
            addEvent(doSendAcid, a * 75, cid, lugar)
        end
    end

    -- Aplica dano tipo POISON na área definida
    doDanoWithProtect(cid, POISONDAMAGE, pos, waterarea, -min, -max, 0)

    return true
end
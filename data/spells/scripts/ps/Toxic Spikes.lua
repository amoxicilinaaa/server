function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min   = spellData.min
    local max   = spellData.max
    local pos   = getThingPosWithDebug(cid)

    -- Aplica dano venenoso em área
    addEvent(doDanoWithProtect, 150, cid, POISONDAMAGE, pos, grassarea, -min, -max, 0)

    -- Função que dispara uma folha visual
    local function doSendLeafStorm(cid, pos)
        if not isCreature(cid) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), pos, 15)
    end

    -- Executa 100 disparos visuais com chance de efeito mágico
    for a = 1, 100 do
        local lugar = {
            x = pos.x + math.random(-6, 6),
            y = pos.y + math.random(-5, 5),
            z = pos.z
        }

        addEvent(doSendLeafStorm, a * 2, cid, lugar)

        if math.random(1, 3) == 1 then
            addEvent(doSendMagicEffect, a * 2, lugar, 114)
        end
    end

    return true
end

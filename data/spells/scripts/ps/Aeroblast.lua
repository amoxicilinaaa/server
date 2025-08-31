dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local pos = spellData.posC

    -- Função para disparar tornados visuais
    local function doSendTornado(cid, pos)
        if not isCreature(cid) then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), pos, 36)
        doSendMagicEffect(pos, 967)
    end

    -- Dispara 60 tornados em posições aleatórias
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

    -- Aplica dano em área após os tornados
    addEvent(function()
        if isCreature(cid) then
            doDanoWithProtect(cid, FLYINGDAMAGE, pos, waterarea, -min, -max, 0)
        end
    end, 1500)
    return true
end
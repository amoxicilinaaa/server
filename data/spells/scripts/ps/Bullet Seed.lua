dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local function doIce(cid, target, min, max)
        if not isCreature(cid) or not isCreature(target) then return false end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 1)
        doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 403)
        return true
    end

    -- Gira entre 2 e 9, com chance reduzida de valores altos
    local Sparks = math.random(2, 9)
    if Sparks >= 7 then
        Sparks = math.random(4, 9)
        if Sparks == 9 then
            Sparks = math.random(8, 9)
        end
    end

    -- Executa os disparos com delay
    for i = 1, Sparks do
        addEvent(doIce, i * 350, cid, target, min, max)
    end

    return true
end
dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local p = getThingPosWithDebug(cid)
    p.x = p.x + 1
    p.y = p.y + 1

    sendEffWithProtect(cid, p, 151)

    local function doDano(cid)
        local pos = getThingPosWithDebug(cid)

        local function doSendBubble(cid, pos)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 39)
            doSendMagicEffect(pos, 239)
        end

        for a = 1, 20 do
            local r1 = math.random(-4, 4)
            local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
            local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
            addEvent(doSendBubble, a * 25, cid, lugar)
        end

        addEvent(doDanoWithProtect, 150, cid, ROCKDAMAGE, pos, waterarea, -min, -max, 0)
    end

    addEvent(doDano, 1250, cid)

    return true
end
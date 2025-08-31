dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local eff = getSubName(cid, target) == "Crystal Onix" and 175 or 754

    local function doQuake(cid)
        if not isCreature(cid) then return false end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        doMoveInArea2(cid, eff, confusion, GROUNDDAMAGE, min, max, spell)
    end

    local times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400, 7900, 8400, 9200, 10000}

    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)

    for i = 1, #times do
        addEvent(doQuake, times[i], cid)
    end

    return true
end
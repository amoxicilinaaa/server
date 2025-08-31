dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local subName = getSubName(cid, target)
    local eff, distEff

    if isInArray({"Shiny Lanturn", "Shiny Magneton"}, subName) then
        eff = 980
        distEff = 172
    else
        eff = 541
        distEff = 117
    end

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), distEff)
    doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, eff)

    return true
end
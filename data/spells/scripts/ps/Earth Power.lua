dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local dano, eff
    local subName = getSubName(cid, target)
    local posC1 = getThingPosWithDebug(cid)

    if spell == "Earthshock" or spell == "Earth Power" then
        dano = GROUNDDAMAGE
        eff = (subName == "Crystal Onix") and 179 or 127
    else
        dano = ICEDAMAGE
        eff = 179
    end

    doAreaCombatHealth(cid, dano, posC1, splash, -min, -max, 255)
    doSendMagicEffect(posC1, eff)

    return true
end
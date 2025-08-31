dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local posT1 = spellData.posT1 or getThingPosWithDebug(target)

    if not isCreature(cid) or not isCreature(target) then return false end

    -- Efeito visual de projétil
    doSendDistanceShoot(getThingPosWithDebug(cid), posT1, 111) -- ou 113

    -- Dano com atraso e efeito visual
    doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 355) -- ou 21

    return true
end
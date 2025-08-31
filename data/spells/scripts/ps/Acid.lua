dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(target) then return false end

    -- Efeito visual: projétil do caster ao alvo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 14) -- 107

    -- Aplica dano com atraso de 20ms
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 20)
        end
    end, 20)

    return true
end
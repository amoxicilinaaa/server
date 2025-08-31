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
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 122) -- 119

    -- Efeito mágico opcional (comentado no original)
    -- addEvent(doSendMagicEffect, 92, spellData.posT1, 694)

    -- Efeito visual ou secundário com dano zero
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, 0, 0, 784, bombWee2)
        end
    end, 92)

    -- Dano real com efeito e área
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 683, bombWee2)
        end
    end, 92)
    return true
end
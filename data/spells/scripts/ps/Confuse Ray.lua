dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    -- Calcula duração da condição
    local rounds = math.random(4, 7) + math.floor(getPokemonLevel(cid) / 35)

    -- Define condição Confusion
    local ret = {
        id = target,
        cd = rounds,
        check = getPlayerStorageValue(target, conds["Confusion"]),
        cond = "Confusion",
        spell = spell
    }

    -- Efeito visual e dano sincronizado
    local posi = getThingPosWithDebug(target)
    posi.y = posi.y + 1

    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
    addEvent(doSendMagicEffect, 100, posi, 222)
    addEvent(doMoveDano2, 100, cid, target, GHOSTDAMAGE, -min, -max, ret, spell)

    return true
end
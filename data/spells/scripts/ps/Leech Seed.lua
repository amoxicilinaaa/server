dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(target) then return false end

    local ret = {
        id = target,
        attacker = cid,
        cd = 5,
        check = getPlayerStorageValue(target, conds["Leech"]),
        damage = isSummon(cid) and getMasterLevel(cid) + getPokemonBoost(cid) or getPokemonLevelD(doCorrectString(getCreatureName(cid))),
        cond = "Leech"
    }

    -- Efeito visual de disparo
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 1)

    -- Aplica dano e condição após 1 segundo
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doMoveDano2(cid, target, GRASSDAMAGE, min, max, ret, spell)
        end
    end, 1000)
    return true
end









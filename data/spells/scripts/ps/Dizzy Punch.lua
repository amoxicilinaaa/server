dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    if not isCreature(cid) or not isCreature(target) then return false end

    local level = getPokemonLevel(cid)
    local rounds = math.floor(level / 12) + 2

    local ret = {
        id = target,
        check = getPlayerStorageValue(target, conds["Confusion"]),
        cd = rounds,
        cond = "Confusion"
    }

    local posC = getThingPosWithDebug(cid)
    local posT = getThingPosWithDebug(target)

    -- Projétil visual
    doSendDistanceShoot(posC, posT, 26)

    -- Dano físico direto
    doDanoWithProtect(cid, FIGHTINGDAMAGE, posT, 0, -min, -max, 112)

    -- Dano secundário com status Confusion
    addEvent(function()
        if isCreature(cid) and isCreature(target) then
            doMoveDano2(cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        end
    end, 50)
    return true
end
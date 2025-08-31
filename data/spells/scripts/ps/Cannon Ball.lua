dofile("data/lib/lib_spells.lua")

local cannonBalls = {
    ["Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
    ["Shiny Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
    ["Metal Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
    ["Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
    ["Milch Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
    ["Shiny Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
    ["Donphan"] = {eup=601, edown=603, eright=602, eleft=596, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
    ["Roll Donphan"] = {eup=601, edown=603, eright=602, eleft=596, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
    ["Forretress"] = {eup=826, edown=826, eright=826, eleft=826, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
    ["Blastoise"] = {eup=736, edown=736, eright=736, eleft=736, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
    ["Shiny Blastoise"] = {eup=736, edown=736, eright=736, eleft=736, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
    ["Starmie"] = {eup=850, edown=850, eright=850, eleft=850, efdmg1=154, efdmg2=154, efdmg3=154, efdmg4=154, damage=WATERDAMAGE},
}

local function doBack(cid)
    if not isCreature(cid) then return true end
    setPlayerStorageValue(cid, 9658783, -1)
    doAppear(cid)
end

local function doStartHit(cid, n, dir, pos, rote, min, max, spell)
    if not isCreature(cid) or n == 9 then return true end

    local name = getCreatureName(cid)
    local config = cannonBalls[name] or cannonBalls["Skarmory"]
    local dmg = config.damage

    local eff, eff2

    if dir == 0 or dir == 2 then
        pos.y = pos.y + (n >= 5 and 1 or -1)
        eff = (n >= 5 and config.edown or config.eup)

        doSendMagicEffect(pos, eff)
        doDanoWithProtect(cid, dmg, {x=pos.x+1, y=pos.y, z=pos.z}, stwing, -min, -max, 0)
        doDanoWithProtect(cid, dmg, {x=pos.x-1, y=pos.y, z=pos.z}, stwing, -min, -max, 0)
        doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)

        eff2 = (rote == 1 and config.efdmg1 or config.efdmg2)
        rote = (rote == 1 and 0 or 1)

        doSendMagicEffect(pos, eff2)
        doSendMagicEffect({x=pos.x+1, y=pos.y, z=pos.z}, eff2)
        doSendMagicEffect({x=pos.x-1, y=pos.y, z=pos.z}, eff2)

    elseif dir == 1 or dir == 3 then
        pos.x = pos.x + (n >= 5 and (dir == 1 and -1 or 1) or (dir == 1 and 1 or -1))
        eff = (n >= 5 and config.eleft or config.eright)

        doSendMagicEffect(pos, eff)
        doDanoWithProtect(cid, dmg, {x=pos.x, y=pos.y+1, z=pos.z}, stwing, -min, -max, 0)
        doDanoWithProtect(cid, dmg, {x=pos.x, y=pos.y-1, z=pos.z}, stwing, -min, -max, 0)
        doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)

        eff2 = (rote == 1 and config.efdmg3 or config.efdmg4)
        rote = (rote == 1 and 0 or 1)

        doSendMagicEffect(pos, eff2)
        doSendMagicEffect({x=pos.x, y=pos.y-1, z=pos.z}, eff2)
        doSendMagicEffect({x=pos.x, y=pos.y+1, z=pos.z}, eff2)
    end

    addEvent(doStartHit, 150, cid, n + 1, dir, pos, rote, min, max, spell)
end

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    doCreatureSetHideHealth(cid, true)
    doSetCreatureOutfit(cid, {lookType = 2}, -1)
    setPlayerStorageValue(cid, 9658783, 1)

    local dir = getCreatureLookDir(cid)
    local pos = getThingPos(cid)

    doStartHit(cid, 0, dir, pos, 1, min, max, spell)
    addEvent(doBack, 1400, cid)

    return true
end
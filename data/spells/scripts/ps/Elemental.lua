dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    if not pokes[getCreatureName(cid)] then return true end

    local Types = {
        ["normal"] = {type = NORMALDAMAGE, eff = 111},
        ["fighting"] = {type = FIGHTINGDAMAGE, eff = 112},
        ["dark"] = {type = DARKDAMAGE, eff = 222},
        ["psychic"] = {type = psyDmg, eff = 134},
        ["ghost"] = {type = ghostDmg, eff = 138},
        ["rock"] = {type = ROCKDAMAGE, eff = 44},
        ["flying"] = {type = FLYINGDAMAGE, eff = 41},
        ["ground"] = {type = GROUNDDAMAGE, eff = 100},
        ["steel"] = {type = STEELDAMAGE, eff = 160},
        ["grass"] = {type = GRASSDAMAGE, eff = 45},
        ["fire"] = {type = FIREDAMAGE, eff = 35},
        ["water"] = {type = WATERDAMAGE, eff = 154},
        ["bug"] = {type = BUGDAMAGE, eff = 105},
        ["ice"] = {type = ICEDAMAGE, eff = 43},
        ["poison"] = {type = POISONDAMAGE, eff = 114},
        ["electric"] = {type = ELECTRICDAMAGE, eff = 48},
        ["dragon"] = {type = DRAGONDAMAGE, eff = 143},
    }

    local elemento = pokes[getCreatureName(cid)].type
    local tipo = Types[elemento]
    if not tipo then return true end

    local function sendFireEff(cid, dir, eff, damage)
        if not isCreature(cid) then return true end
        doAreaCombatHealth(cid, damage, getPosByDir(getThingPosWithDebug(cid), dir), 0, -1000, -1500, eff)
    end

    local function doSpinFire(cid)
        if not isCreature(cid) then return true end
        local t = {
            [1] = SOUTH,
            [2] = SOUTHEAST,
            [3] = EAST,
            [4] = NORTHEAST,
            [5] = NORTH,
            [6] = NORTHWEST,
            [7] = WEST,
            [8] = SOUTHWEST,
        }
        for a = 1, 8 do
            addEvent(sendFireEff, a * 140, cid, t[a], tipo.eff, tipo.type)
        end
    end

    doSpinFire(cid)

    return true
end
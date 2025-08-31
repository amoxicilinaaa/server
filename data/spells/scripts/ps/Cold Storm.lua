dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local target = spellData.target
    local master = getCreatureMaster(cid) or 0

    local ret = {
        id = 0,
        cd = 9,
        eff = 0,
        check = 0,
        spell = spell,
        cond = nil
    }

    local dano, dano2, eff, eff2, eff0

    -- Define dano e efeitos por spell
    if spell == "Psy Impact" then
        dano = psyDmg
        eff = 98
        ret.cond = "Miss"

    elseif spell == "Sky Attack" then
        dano = FLYINGDAMAGE
        eff = 286

    elseif spell == "Discharge" then
        dano = ELECTRICDAMAGE
        eff = isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) and 640 or 409
        ret.cond = "Miss"
        ret.eff = 541

    elseif spell == "Mega Discharge" then
        dano = ELECTRICDAMAGE
        eff = 420
        ret.cond = "Miss"
        ret.eff = 640

    elseif spell == "Flames" then
        dano = FIREDAMAGE
        eff = 505

    elseif spell == "Lava Pool" then
        dano = FIREDAMAGE
        eff = 700

    elseif spell == "Storm Leaves" then
        dano = GRASSDAMAGE
        dano2 = FLYINGDAMAGE
        eff = 694
        eff2 = 643

    elseif spell == "Ground Elevation" then
        dano = GROUNDDAMAGE
        eff = 494

    elseif spell == "Sand Power" then
        dano = GROUNDDAMAGE
        eff = 631

    elseif spell == "Poison Burst" then
        dano = POISONDAMAGE
        eff = 628

    elseif spell == "Fairy Burst" then
        dano = NORMALDAMAGE
        eff = 644

    elseif spell == "Eruption Terrain" then
        dano = FIREDAMAGE
        eff0 = 102
        eff = 699

    elseif spell == "Ice Spikes" then
        dano = ICEDAMAGE
        eff = 521

    elseif spell == "Cold Storm" then
        dano = ICEDAMAGE
        eff = 882

    else
        dano = NORMALDAMAGE
        eff = 417
    end

    -- Efeitos de queda
    for rocks = 1, 20 do
        if spell == "Storm Leaves" then
            addEvent(fall, rocks * 35, cid, master, dano, -1, eff2)
        elseif spell == "Eruption Terrain" then
            addEvent(fall, rocks * 30, cid, master, 0, -1, eff0)
            addEvent(fall, rocks * 40, cid, master, dano, -1, eff)
        end
        addEvent(fall, rocks * 35, cid, master, dano, -1, eff)
    end

    -- Dano em área
    if spell == "Storm Leaves" then
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano2, min, max, spell, ret)
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret)

    elseif spell == "Ground Elevation" then
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret)
        addEvent(doMoveInArea2, 1600, cid, 0, BigArea2, dano, min, max, spell, ret)

    else
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret)
    end

    return true
end
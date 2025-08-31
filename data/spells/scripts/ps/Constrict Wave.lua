dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Define condição Paralyze
    local ret = {
        id = 0,
        cd = 5,
        eff = 104,
        check = 0,
        first = true,
        cond = "Paralyze",
        spell = spell
    }

    -- Define efeito visual por Pokémon
    local subname = getSubName(cid, target)
    if subname == "Tangrowth" then
        ret.eff = 493
        doMoveInArea2(cid, 493, reto5, SEED_BOMBDAMAGE, min, max, spell, ret)
    elseif subname == "Tangela" then
        ret.eff = 518
        doMoveInArea2(cid, 518, reto5, SEED_BOMBDAMAGE, min, max, spell, ret)
    else
        doMoveInArea2(cid, 104, reto5, SEED_BOMBDAMAGE, min, max, spell, ret)
    end

    return true
end
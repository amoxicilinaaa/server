dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Calcula duração da condição
    local rounds = math.random(4, 7) + math.floor(getPokemonLevel(cid) / 35)

    -- Define tipo de dano e efeito visual
    local dano, eff
    if spell == "Confusion" then
        dano = psyDmg
        eff = 430
    else
        dano = ghostDmg
        eff = 136
    end

    -- Define condição Confusion
    local ret = {
        id = 0,
        check = 0,
        cd = rounds,
        cond = "Confusion",
        spell = spell
    }

    -- Aplica dano e condição
    if spell == "Confusion" then
        doMoveInArea2(cid, eff, selfArea1, dano, min, max, spell, ret)
    else
        local PosCid1 = getThingPosWithDebug(cid)
        addEvent(doSendMagicEffect, 1, PosCid1, 395)
        addEvent(doMoveInArea2, 110, cid, eff, selfArea1, dano, min, max, spell, ret)
    end

    return true
end
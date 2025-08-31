dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local subname = getSubName(cid, target)
    local effect = 104 -- padrão

    if subname == "Tangrowth" then
        effect = 493
    elseif subname == "Tangela" then
        effect = 518
    end

    local ret = {
        id = 0,
        check = 0,
        cd = 5,
        eff = effect,
        first = true,
        cond = "Paralyze",
        spell = spell
    }

    -- Três ondas de dano com delay progressivo
    for i = 0, 2 do
        addEvent(doMoveInArea2, i * 1000, cid, effect, selfArea1, SEED_BOMBDAMAGE, min, max, spell, ret)
    end

    return true
end
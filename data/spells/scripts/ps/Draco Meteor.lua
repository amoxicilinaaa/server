dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local effD = 5
    local eff = 248
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    -- Efeito de subida
    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, effD)
    end

    -- Efeito de queda com dano
    local function doFall(cid)
        for rocks = 5, 42 do
            addEvent(fall, rocks * 35, cid, master, DRAGONDAMAGE, effD, eff)
        end
    end

    addEvent(doFall, 450, cid)

    -- Dano final em área
    addEvent(doDanoWithProtect, 1400, cid, DRAGONDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)

    return true
end
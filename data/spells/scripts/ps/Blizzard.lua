dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    local ret = {
        id = 0,
        cd = 9,
        eff = 43,
        check = 0,
        first = true,
        cond = "Slow"
    }

    -- Função para disparar pedras de gelo
    local function doFall(cid)
        if not isCreature(cid) then return end
        for rocks = 1, 42 do
            addEvent(fall, rocks * 35, cid, master, ICEDAMAGE, 28, 387)
        end
    end

    -- Transformação especial do Castform
    if getCreatureName(cid) == "Castform" then
        addEvent(doTransformCastform, 1350, cid, "Ice")
        setPlayerStorageValue(master, 141410, 1)
        addEvent(setPlayerStorageValue, 2200, master, 141410, -1)
    end

    -- Efeitos ascendentes
    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, 28)
    end

    -- Queda de gelo e dano em área
    addEvent(doFall, 450, cid)
    addEvent(function()
        if isCreature(cid) then
            doMoveInArea2(cid, 0, BigArea2, ICEDAMAGE, min, max, spell, ret)
        end
    end, 1400)

    return true
end
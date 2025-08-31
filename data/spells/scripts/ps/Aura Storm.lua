dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    local effD = 57 -- efeito visual ascendente
    local eff = 400 -- efeito visual da queda

    -- Função para disparar os impactos descendentes
    local function doFall(cid)
        if not isCreature(cid) then return end
        for rocks = 5, 42 do
            addEvent(fall, rocks * 35, cid, master, FIGHTHINGDAMAGE, effD, eff)
        end
    end

    -- Efeitos visuais ascendentes
    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, effD)
    end

    -- Inicia a sequência de quedas após 450ms
    addEvent(doFall, 450, cid)

    -- Aplica dano em área após 1400ms
    addEvent(function()
        if isCreature(cid) then
            doDanoWithProtect(cid, FIGHTHINGDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)
        end
    end, 1400)

    return true
end
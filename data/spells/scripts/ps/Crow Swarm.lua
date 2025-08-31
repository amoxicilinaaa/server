dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local master = getCreatureMaster(cid) or 0

    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Define efeitos visuais por direção
    local efeito, efeito2, efeito3
    if dir == 0 then
        efeito = 187
        efeito2 = 586
        efeito3 = 552
    elseif dir == 1 then
        efeito = 187
        efeito2 = 586
        efeito3 = 552
    elseif dir == 2 then
        efeito = 187
        efeito2 = 587
        efeito3 = 553
    elseif dir == 3 then
        efeito = 187
        efeito2 = 587
        efeito3 = 553
    end

    -- Define condição de Stun
    local ret = {
        id = 0,
        cd = 9,
        eff = 0,
        check = 0,
        spell = spell,
        cond = "Stun"
    }

    -- Efeitos de queda em sequência
    local subname = getSubName(cid, target)
    for rocks = 1, 42 do
        local effectToUse = 187 -- default (Stantler)
        if subname == "Tauros" or subname == "Shiny Tauros" then
            effectToUse = efeito2
        elseif subname == "Murkrow" then
            effectToUse = efeito3
        end
        addEvent(fall, rocks * 35, cid, master, NORMALDAMAGE, -1, effectToUse)
    end

    -- Dano em área com condição
    addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret)

    return true
end
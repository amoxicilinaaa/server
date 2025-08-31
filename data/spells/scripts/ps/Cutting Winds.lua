dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Primeiro disparo com efeito 9 e impacto 966
    doMoveInAreaMulti(cid, 9, 966, bulletzin, bulletzinDano, FLYINGDAMAGE, min, max)

    -- Segundo disparo com efeito 98 e impacto 967
    doMoveInAreaMulti(cid, 98, 967, bulletzin, bulletzinDano, FLYINGDAMAGE, min, max)

    return true
end
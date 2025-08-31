dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local posT = spellData.posT

    if not isCreature(target) then return false end

    -- Aplica dano direto com efeito visual 146
    doDanoWithProtect(cid, DARKDAMAGE, posT, 0, -min, -max, 146)

    return true
end
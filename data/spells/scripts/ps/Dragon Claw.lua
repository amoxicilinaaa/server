dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Define a posição ajustada para o efeito visual
    local posT1 = getThingPosWithDebug(target)
    posT1.x = posT1.x + 1
    posT1.y = posT1.y + 1

    -- Aplica o dano na posição original do alvo
    doDanoWithProtect(cid, DRAGONDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)

    -- Aplica o efeito visual na posição deslocada
    doSendMagicEffect(posT1, 365)

    return true
end

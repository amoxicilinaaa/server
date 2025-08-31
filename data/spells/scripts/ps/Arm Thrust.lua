dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local mpos = spellData.posC

    local b = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local effect = 0
    local xvar, yvar = 0, 0

    if b == SOUTH then
        effect = 218
        yvar = 2
    elseif b == NORTH then
        effect = 217
    elseif b == WEST then
        effect = 216
    elseif b == EAST then
        effect = 215
        xvar = 2
    end

    mpos.x = mpos.x + xvar
    mpos.y = mpos.y + yvar

    -- Efeito visual na direção
    doSendMagicEffect(mpos, effect)

    -- Dano em área
    doMoveInArea2(cid, 0, machine, FIGHTINGDAMAGE, min, max, spell)

    return true
end
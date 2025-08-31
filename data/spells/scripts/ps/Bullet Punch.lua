dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local mpos = getThingPosWithDebug(cid)
    local b = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local effect, xvar, yvar = 0, 0, 0
    local subname = getSubName(cid, target)

    if subname == "Lucario" then
        effect = ({[SOUTH]=448, [NORTH]=447, [WEST]=446, [EAST]=445})[b] or 0
        xvar = b == EAST and 2 or 0
        yvar = b == SOUTH and 2 or 0
    elseif subname == "Shiny Lucario" then
        effect = ({[SOUTH]=444, [NORTH]=443, [WEST]=442, [EAST]=441})[b] or 0
        xvar = b == EAST and 2 or 0
        yvar = b == SOUTH and 2 or 0
    else
        if spell == "Bullet Punch" then
            effect = ({[SOUTH]=373, [NORTH]=372, [WEST]=371, [EAST]=370})[b] or 0
        else
            effect = ({[SOUTH]=218, [NORTH]=217, [WEST]=216, [EAST]=215})[b] or 0
        end
        xvar = b == EAST and 2 or 0
        yvar = b == SOUTH and 2 or 0
    end

    mpos.x = mpos.x + xvar
    mpos.y = mpos.y + yvar

    -- Efeito visual direcional
    doSendMagicEffect(mpos, effect)

    -- Dano em área
    doMoveInArea2(cid, 0, machine, FIGHTINGDAMAGE, min, max, spell)

    return true
end
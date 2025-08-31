dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local target = spellData.target

    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    local t = {
        [0] = {73, {x = p.x, y = p.y - 1, z = p.z}},       -- norte
        [1] = {74, {x = p.x + 6, y = p.y, z = p.z}},       -- leste
        [2] = {75, {x = p.x, y = p.y + 6, z = p.z}},       -- sul
        [3] = {76, {x = p.x - 1, y = p.y, z = p.z}}        -- oeste
    }

    -- Dano em área
    doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)

    -- Efeito visual direcional
    doSendMagicEffect(t[dir][2], t[dir][1])

    return true
end
dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    local t = {
        [0] = {544, {x = p.x, y = p.y - 1, z = p.z}}, -- norte
        [1] = {543, {x = p.x + 4, y = p.y, z = p.z}}, -- leste
        [2] = {544, {x = p.x, y = p.y + 4, z = p.z}}, -- sul
        [3] = {543, {x = p.x - 1, y = p.y, z = p.z}}  -- oeste
    }

    local area = reto4
    local posC1 = getThingPosWithDebug(cid) -- Certifica que posC1 está definido

    -- Efeito visual inicial
    doSendMagicEffect(posC1, 685)

    -- Dano em área com efeito sincronizado
    addEvent(function()
        if isCreature(cid) then
            doMoveInArea2(cid, 0, area, DARKDAMAGE, min, max, spell)
            doSendMagicEffect(t[dir][2], t[dir][1])
        end
    end, 70)

    return true
end
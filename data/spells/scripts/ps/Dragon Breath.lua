dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Determina a direção do ataque
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local p = getThingPosWithDebug(cid)

    -- Define os efeitos visuais por direção
    local t = {
        [0] = {605, {x = p.x, y = p.y - 1, z = p.z}}, -- Norte
        [1] = {606, {x = p.x + 5, y = p.y, z = p.z}}, -- Leste
        [2] = {608, {x = p.x, y = p.y + 5, z = p.z}}, -- Sul
        [3] = {607, {x = p.x - 1, y = p.y, z = p.z}}, -- Oeste
    }

    -- Área de dano e efeito visual
    local area = reto4
    doMoveInArea2(cid, 0, area, DRAGONDAMAGE, min, max, spell)
    doSendMagicEffect(t[a][2], t[a][1])

    return true
end
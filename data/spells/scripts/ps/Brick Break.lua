dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local p = spellData.posC
    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Status: Paralyze
    local ret = {
        id = 0,
        cd = 2,
        eff = 88,
        check = 0,
        first = true,
        cond = "Paralyze"
    }

    -- Status: Silence
    local ret2 = {
        id = 0,
        cd = 4,
        eff = 88,
        check = 0,
        first = true,
        cond = "Silence"
    }

    -- Posição do efeito visual por direção
    local t = {
        [0] = {732, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- norte
        [1] = {732, {x = p.x + 2, y = p.y + 1, z = p.z}}, -- leste
        [2] = {732, {x = p.x + 1, y = p.y + 2, z = p.z}}, -- sul
        [3] = {732, {x = p.x - 1, y = p.y + 1, z = p.z}}  -- oeste
    }

    -- Aplica dano com Paralyze
    doMoveInArea2(cid, 0, BrickBeak, FIGHTINGDAMAGE, min, max, spell, ret)

    -- Aplica Silence sem dano
    doMoveInArea2(cid, 0, BrickBeak, FIGHTINGDAMAGE, 0, 0, spell, ret2)

    -- Efeito visual direcional
    doSendMagicEffect(t[dir][2], t[dir][1])

    return true
end
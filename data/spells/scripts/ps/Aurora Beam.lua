dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local p = spellData.posC

    -- Determina direção do caster em relação ao alvo
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Tabela de efeitos visuais por direção
    local t = {
        [0] = {186, {x = p.x + 1, y = p.y - 1, z = p.z}}, -- norte
        [1] = {57,  {x = p.x + 6, y = p.y + 1, z = p.z}}, -- leste
        [2] = {186, {x = p.x + 1, y = p.y + 6, z = p.z}}, -- sul
        [3] = {57,  {x = p.x - 1, y = p.y + 1, z = p.z}}  -- oeste
    }

    -- Define status que será aplicado
    local ret = {
        id = 0,
        cd = 9,
        eff = 43,
        check = 0,
        first = true,
        cond = "Slow",
        spell = spell
    }

    -- Aplica dano em área com status
    doMoveInArea2(cid, 0, triplo6, ICEDAMAGE, min, max, spell, ret)

    -- Efeito visual na direção do alvo
    doSendMagicEffect(t[a][2], t[a][1])

    return true
end
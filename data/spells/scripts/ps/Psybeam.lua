function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max

    -- Define direção do alvo ou do caster
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Efeitos visuais alternados por direção
    local t = {
        [0] = 58, -- norte
        [1] = 56, -- leste
        [2] = 58, -- sul
        [3] = 56  -- oeste
    }

    -- Aplica dano tipo PSY com efeito visual direcional
    doMoveInArea2(cid, t[a], reto4, psyDmg, min, max, spell)

    return true
end
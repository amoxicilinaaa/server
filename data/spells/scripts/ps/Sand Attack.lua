function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target

    -- Determina a direção do caster
    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Tabela de efeitos visuais por direção
    local effectByDir = {
        [0] = 120, -- norte
        [1] = 121, -- leste
        [2] = 122, -- sul
        [3] = 119  -- oeste
    }

    -- Parâmetros da condição "Miss"
    local ret = {
        id = 0,
        cd = 9,
        eff = 34,
        check = 0,
        spell = spell,
        cond = "Miss"
    }

    -- Aplica direção e paralisação temporária
    doCreatureSetLookDir(cid, dir)
    stopNow(cid, 900)

    -- Executa dano em área com efeito visual baseado na direção
    doMoveInArea2(cid, effectByDir[dir], reto5, GROUNDDAMAGE, 0, 0, spell, ret)

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Define efeito visual e parâmetros do buff
    local eff = 144

    local ret = {
        id = cid,
        cd = 8,
        eff = eff,
        check = 0,
        buff = spell,
        first = true
    }

    -- Aplica o buff via sistema de condição
    doCondition2(ret)

    -- Efeito visual cinza no Pokémon por 10 segundos (psoul)
    doSendCreatureEffect(cid, CREATURE_EFFECTS.GRAY, 10 * 1000)

    return true
end
dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local eff

    -- Define efeito visual conforme a spell
    if spell == "Calm Mind" then
        eff = 133
    elseif spell == "Charm" then
        eff = 147 -- pode ser ajustado se descobrir o efeito correto
    else
        eff = 144
    end

    local ret = {
        id = cid,
        cd = 8,
        eff = eff,
        check = 0,
        buff = spell,
        first = true
    }

    -- Aplica o buff
    doCondition2(ret)

    return true
end
dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)

    if not spellData then
        return false
    end
    
    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    
    -- Se precisar das posiÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂµes, elas estÃÂÃÂÃÂÃÂ£o na tabela spellData
    -- local posC = spellData.posC
    -- local posT = spellData.posT
    
    local dmg = isSummon(cid) and getMasterLevel(cid)+getPokemonBoost(cid) or getPokemonLevel(cid)

    local ret = {id = 0, cd = 2, eff = 770, check = 0, spell = spell, cond = "Miss"}
    local function gas(cid)
        doMoveInArea2(cid, 770, confusion, POISONDAMAGE, 0, 0, spell, ret)
        doMoveInArea2(cid, 0, confusion, POISONDAMAGE, min, max, spell)
    end

    local times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400, 7900, 8400}

    for i = 1, #times do
        addEvent(gas, times[i], cid)
    end
    return true
end









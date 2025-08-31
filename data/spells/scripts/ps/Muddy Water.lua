function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = spellData.min
    local max = spellData.max
    local posC = spellData.posC
    local master = getCreatureMaster(cid)

    -- Espécies especiais com efeito de rochas + surf
    if isInArray({"Quagsire", "Swampert", "Whiscash"}, getSubName(cid, target)) then
        local eff = {55, 502}

        -- Disparo de múltiplas rochas com efeito aleatório
        for rocks = 1, 32 do
            addEvent(fall, rocks * 22, cid, master, GROUNDDAMAGE, -1, eff[math.random(1, 2)])
        end

        -- Efeito de onda em área
        doMoveInArea2(cid, 0, doSurf1, GROUNDDAMAGE, 0, 0, spell)

        -- Dano em área com delay aleatório
        addEvent(doDanoWithProtect, math.random(100, 400), cid, GROUNDDAMAGE, posC, doSurf2, -min, -max, 0)

    else
        -- Fallback: aplica condição "Miss" com efeito visual 1041
        local ret = {
            id = 0,
            cd = 6,
            eff = 1041,
            check = 0,
            spell = spell,
            cond = "Miss"
        }

        -- Dano em área com condição
        doMoveInArea2(cid, 844, muddy, GROUNDDAMAGE, min, max, spell, ret)
    end

    return true
end
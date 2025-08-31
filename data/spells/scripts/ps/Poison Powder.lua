dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    if not isCreature(cid) then return false end

    local name = doCorrectString(getCreatureName(cid))
    local lvl = isSummon(cid) and getMasterLevel(cid) or getPokemonLevelD(name)
    local heldPercent = 1
    local baseDano = math.floor((getPokemonLevelD(name) + lvl * 3) / 2)

    -- Verifica se o PokÃÂÃÂÃÂÃÂ©mon estÃÂÃÂÃÂÃÂ¡ com X-Poison equipado
    if isSummon(cid) then
        local heldItem = getPlayerSlotItem(getCreatureMaster(cid), 8)
        if heldItem and heldItem.uid > 0 then
            local heldx = getItemAttribute(heldItem.uid, "xHeldItem")
            if heldx then
                local parts = string.explode(heldx, "|")
                local heldName = parts[1] or ""
                local heldTier = tonumber(parts[2]) or 0
                if heldName == "X-Poison" and heldPoisonBurn[heldTier] then
                    heldPercent = heldPoisonBurn[heldTier]
                end
            end
        end
    end

    local finalDano = baseDano + (heldPercent * baseDano / 100)
    local ret = {
        id = 0,
        cd = math.random(6, 15),
        check = 0,
        damage = finalDano,
        cond = "Poison",
        im = target,
        attacker = cid,
        spell = spell
    }

    -- Aplica a condiÃÂÃÂÃÂÃÂ§ÃÂÃÂÃÂÃÂ£o "Poison" com efeito visual 84
    doMoveInArea2(cid, 84, confusion, NORMALDAMAGE, finalDano, finalDano, spell, ret)
    return true
end









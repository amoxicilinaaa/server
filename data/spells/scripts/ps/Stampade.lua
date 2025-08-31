function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max
    local master  = getCreatureMaster(cid) or cid

    -- Parâmetros da condição "Stun"
    local ret = {
        id    = 0,
        cd    = 9,
        eff   = 0,
        check = 0,
        spell = spell,
        cond  = "Stun"
    }

    -- Define direção do impacto
    local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Efeitos visuais por direção e criatura
    local efeito, efeito2, efeito3 = 187, 586, 552
    if a == 2 or a == 3 then
        efeito2 = 587
        efeito3 = 553
    end

    -- Executa múltiplos impactos com efeito específico
    for rocks = 1, 42 do
        local name = getSubName(cid, target)
        local visual = (name == "Tauros" or name == "Shiny Tauros") and efeito2 or (name == "Murkrow" and efeito3 or efeito)
        addEvent(fall, rocks * 35, cid, master, NORMALDAMAGE, -1, visual)
    end

    -- Aplica dano em área com condição "Stun"
    addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret)

    return true
end

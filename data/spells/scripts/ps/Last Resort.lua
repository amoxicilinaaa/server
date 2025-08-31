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

    local pos = getThingPosWithDebug(cid)

    -- Áreas de impacto sequencial
    local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}

    -- Parâmetros da condição (pode ser expandido futuramente)
    local ret = {
        id = 0,
        cd = 9,
        eff = 0,
        check = 0,
        spell = spell,
        cond = nil
    }

    -- Define tipo de dano e efeito visual conforme a spell
    local dano, eff
    if spell == "Poisonous Progression" then
        dano = POISONDAMAGE
        eff = 479
        -- ret.cond = "Poison" -- pode ser ativado se houver suporte
    elseif spell == "kkk" then
        dano = FLYINGDAMAGE
        eff = 307
    else
        dano = NORMALDAMAGE
        eff = 3 -- efeito padrão para fallback
    end

    -- Executa ataques em área com delay progressivo
    for i = 0, 9 do
        addEvent(doMoveInArea2, i * 400, cid, eff, areas[i + 1], dano, min, max, spell, ret)
        addEvent(doMoveInArea2, i * 410, cid, eff, areas[i + 1], dano, 0, 0, spell, ret)
    end

    return true
end
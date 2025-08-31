function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    local subName = getSubName(cid, target)

    -- Condição extra (se necessário)
    local ret = {
        id    = target,
        cd    = 6,
        check = 0,
        eff   = 48,
        cond  = "Poison",
        spell = spell
    }

    -- Zubat e Golbat: ataque simples em área
    if isInArray({"Zubat", "Shiny Zubat", "Golbat", "Shiny Golbat"}, subName) then
        doMoveInArea2(cid, 784, reto5, POISONDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 10, cid, 114, reto5, POISONDAMAGE, 0, 0, spell)

    -- Crobat: ataque em duas áreas com delay
    elseif isInArray({"Crobat", "Shiny Crobat"}, subName) then
        doMoveInArea2(cid, 784, wish, POISONDAMAGE, min, max, spell, ret)
        doMoveInArea2(cid, 114, wish, POISONDAMAGE, 0, 0, spell, ret)
        addEvent(doMoveInArea2, 200, cid, 784, rock1, POISONDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, 200, cid, 114, rock1, POISONDAMAGE, 0, 0, spell, ret)

    -- Koffing e Weezing: mesmo padrão de Crobat
    elseif isInArray({"Koffing", "Weezing"}, subName) then
        doMoveInArea2(cid, 784, wish, POISONDAMAGE, min, max, spell, ret)
        doMoveInArea2(cid, 114, wish, POISONDAMAGE, 0, 0, spell, ret)
        addEvent(doMoveInArea2, 200, cid, 784, rock1, POISONDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, 200, cid, 114, rock1, POISONDAMAGE, 0, 0, spell, ret)

    -- Outros Pokémon: ataque direcional com efeito visual
    else
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {382, {x = p.x,     y = p.y - 1, z = p.z}}, -- norte
            [1] = {383, {x = p.x + 5, y = p.y + 1, z = p.z}}, -- leste
            [2] = {384, {x = p.x,     y = p.y + 6, z = p.z}}, -- sul
            [3] = {385, {x = p.x - 1, y = p.y,     z = p.z}}, -- oeste
        }

        doMoveInArea2(cid, 0, reto5, POISONDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
    end

    return true
end

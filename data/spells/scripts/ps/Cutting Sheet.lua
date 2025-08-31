dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local effectpos = getThingPosWithDebug(cid)
    local dir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    -- Define tipo de dano
    local dano = spell == "Cutting Sheet" and GRASSDAMAGE or BUGDAMAGE

    -- Define efeito visual e posição ajustada
    local effect
    if dir == 0 then
        effectpos.x = effectpos.x + 1
        effectpos.y = effectpos.y - 1
        effect = spell == "Steel Wing" and 251 or spell == "Fury Cutter" and 527 or 470
    elseif dir == 1 then
        effectpos.x = effectpos.x + 2
        effectpos.y = effectpos.y + 1
        effect = spell == "Steel Wing" and 253 or spell == "Fury Cutter" and 528 or 468
    elseif dir == 2 then
        effectpos.x = effectpos.x + 1
        effectpos.y = effectpos.y + 2
        effect = spell == "Steel Wing" and 252 or spell == "Fury Cutter" and 530 or 469
    elseif dir == 3 then
        effectpos.x = effectpos.x - 1
        effectpos.y = effectpos.y + 1
        effect = spell == "Steel Wing" and 254 or spell == "Fury Cutter" and 529 or 467
    end

    -- Função para aplicar efeito e dano
    local function doFury(cid, effect)
        if not isCreature(cid) then return end
        doSendMagicEffect(effectpos, effect)
        doMoveInArea2(cid, 0, wingatk, dano, min, max, spell)
    end

    -- Executa dois cortes em sequência
    addEvent(doFury, 0, cid, effect)
    addEvent(doFury, 350, cid, effect)

    return true
end
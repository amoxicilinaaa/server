dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    -- Função para remover o status após 5s
    local function retireStatus(cid)
        if isCreature(cid) then
            setPlayerStorageValue(cid, 9658783, -1)
        end
    end

    -- Função para restaurar velocidade e marcar estado
    local function doRemoveEffect(cid)
        if isCreature(cid) then
            doRegainSpeed(cid)
            setPlayerStorageValue(cid, 9658783, 1)
            addEvent(retireStatus, 5000, cid)
        end
    end

    -- Reduz velocidade imediatamente
    doChangeSpeed(cid, -getCreatureSpeed(cid))

    -- Restaura após 1s
    addEvent(doRemoveEffect, 1000, cid)

    -- Efeito visual em posição deslocada
    local pos = getThingPos(cid)
    pos.x = pos.x + 2
    pos.y = pos.y + 2
    doSendMagicEffect(pos, 375)

    return true
end
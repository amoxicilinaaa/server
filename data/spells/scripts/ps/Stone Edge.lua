function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target
    local min    = spellData.min
    local max    = spellData.max

    -- Tabela de efeitos por spell
    local atk = {
        ["Stone Edge"] = {124, 44} -- missile, effect
    }

    local effD = atk[spell][1] or 124
    local eff  = atk[spell][2] or 44

    -- Função que envia o disparo visual
    local function doPulseEffect(cid)
        if not isCreature(cid) then return true end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), effD)
    end

    -- Função que aplica o dano com efeito
    local function doPulseDamage(cid)
        if not isCreature(cid) then return true end
        doDanoInTargetWithDelay(cid, target, ROCKDAMAGE, min, max, eff)
    end

    -- Executa múltiplos disparos visuais
    for i = 0, 3 do
        addEvent(doPulseEffect, i * 91, cid)
    end

    -- Executa dois impactos com delay
    for i = 1, 2 do
        addEvent(doPulseDamage, i * 91, cid)
    end

    return true
end

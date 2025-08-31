function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local posC1 = spellData.posC1 or getThingPosWithDebug(cid)

    -- Light Screen: impede movimento e aplica efeito visual em sequência
    if spell == "Light Screen" then
        stopNow(cid, 2700) -- interrompe ações
        doCreatureSetNoMove(cid, true) -- trava movimento
        setPlayerStorageValue(cid, 32698, 1) -- storage de silêncio
        addEvent(setPlayerStorageValue, 2800, cid, 32698, -1)
        addEvent(doCreatureSetNoMove, 2800, cid, false)

        -- Efeitos visuais em sequência
        doSendMagicEffect(posC1, 773)
        addEvent(doSendMagicEffect, 494, posC1, 773)
        addEvent(doSendMagicEffect, 986, posC1, 773)
        addEvent(doSendMagicEffect, 1480, posC1, 773)
        addEvent(doSendMagicEffect, 1974, posC1, 773)
        addEvent(doSendMagicEffect, 2468, posC1, 773)
        addEvent(doSendMagicEffect, 2963, posC1, 773)
    end

    -- Acid Armor: efeito visual único
    if spell == "Acid Armor" then
        doSendMagicEffect(posC1, 853)
    end

    -- Buffs com duração e efeito visual via doCondition2
    local ret = {}
    ret.id = cid
    ret.check = 0
    ret.buff = spell
    ret.first = true

    if spell == "Protect" then
        ret.cd = 5
        ret.eff = 0 -- visual tratado em sistema externo
    elseif spell == "Magnetic Flux" then
        ret.cd = 20
        ret.eff = 890
    elseif spell == "Light Screen" then
        ret.cd = 3
        ret.eff = 0
    else
        ret.cd = 8
        ret.eff = 0
    end

    doCondition2(ret)

    --[[ 🛡️ Sugestão opcional: aplicar escudo temporário que reduz dano recebido
    if spell == "Protect" then
        setPlayerStorageValue(cid, 99996, os.time() + 5)
        -- Esse storage pode ser verificado na função de dano para aplicar redução
        -- Exemplo: if os.time() <= getPlayerStorageValue(cid, 99996) then reduzir dano em 50%
    end
    --]]

    return true
end
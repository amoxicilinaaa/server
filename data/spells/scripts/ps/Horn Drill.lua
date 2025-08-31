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

    -- Posição do alvo
    local TposT = getThingPosWithDebug(target)

    -- Posições relativas ao caster
    local Cpos0 = getThingPosWithDebug(cid) -- cima
    local Cpos1 = getThingPosWithDebug(cid) -- direita
    local Cpos2 = getThingPosWithDebug(cid) -- baixo
    local Cpos3 = getThingPosWithDebug(cid) -- esquerda
    local Cpos4 = getThingPosWithDebug(cid) -- sudoeste
    local Cpos5 = getThingPosWithDebug(cid) -- sudeste
    local Cpos6 = getThingPosWithDebug(cid) -- noroeste
    local Cpos7 = getThingPosWithDebug(cid) -- nordeste

    -- Ajuste das coordenadas
    Cpos0.y = Cpos0.y - 1
    Cpos1.x = Cpos1.x + 1
    Cpos2.y = Cpos2.y + 1
    Cpos3.x = Cpos3.x - 1
    Cpos4.x = Cpos4.x - 1; Cpos4.y = Cpos4.y + 1
    Cpos5.x = Cpos5.x + 1; Cpos5.y = Cpos5.y + 1
    Cpos6.x = Cpos6.x - 1; Cpos6.y = Cpos6.y - 1
    Cpos7.x = Cpos7.x + 1; Cpos7.y = Cpos7.y - 1

    -- Efeitos visuais baseados na direção do alvo
    if Cpos0.x == TposT.x and Cpos0.y == TposT.y then
        doSendMagicEffect(posT, 791)
        doSendMagicEffect(posT1, 807)
    elseif Cpos1.x == TposT.x and Cpos1.y == TposT.y then
        doSendMagicEffect(posT, 790)
        posT1.x = posT1.x - 1
        doSendMagicEffect(posT1, 808)
    elseif Cpos2.x == TposT.x and Cpos2.y == TposT.y then
        doSendMagicEffect(posT, 789)
        posT1.y = posT1.y - 1
        doSendMagicEffect(posT1, 806)
    elseif Cpos3.x == TposT.x and Cpos3.y == TposT.y then
        doSendMagicEffect(posT, 788)
        doSendMagicEffect(posT1, 809)
    elseif Cpos4.x == TposT.x and Cpos4.y == TposT.y then
        doSendMagicEffect(posT, 910)
    elseif Cpos5.x == TposT.x and Cpos5.y == TposT.y then
        doSendMagicEffect(posT, 909)
    elseif Cpos6.x == TposT.x and Cpos6.y == TposT.y then
        doSendMagicEffect(posT, 908)
    elseif Cpos7.x == TposT.x and Cpos7.y == TposT.y then
        doSendMagicEffect(posT, 907)
    end

    -- Aplica dano tipo NORMAL com delay
    doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 0)

    --[[ 🔥 FUTURO: Bônus contra tipo Ghost ou Flying
    if isCreature(target) and isInArray({"Ghost", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoInTargetWithDelay, 400, cid, target, NORMALDAMAGE, bonusMin, bonusMax, 0)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🌠 FUTURO: Variação de efeito por espécie
    local pokeName = getCreatureName(cid)
    local visual = 791
    if pokeName == "Tauros" then
        visual = 177
    elseif pokeName == "Kangaskhan" then
        visual = 152
    end
    doSendMagicEffect(posT, visual)
    --]]

    return true
end
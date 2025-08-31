function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    local function sendEffect(cid)
        if not isCreature(cid) or not isCreature(target) then return true end

        local pos = getThingPos(target)
        local lado = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

        -- Tabela de efeitos visuais por direção
        local effes = {
            [0] = {effe1 = 261, effe2 = 797}, -- Norte
            [1] = {effe1 = 263, effe2 = 798}, -- Leste
            [2] = {effe1 = 262, effe2 = 796}, -- Sul
            [3] = {effe1 = 260, effe2 = 799}, -- Oeste
        }

        -- Posições diagonais em relação ao caster
        local TposT = getThingPosWithDebug(target)
        local Cpos4 = getThingPosWithDebug(cid) -- sudoeste
        local Cpos5 = getThingPosWithDebug(cid) -- sudeste
        local Cpos6 = getThingPosWithDebug(cid) -- noroeste
        local Cpos7 = getThingPosWithDebug(cid) -- nordeste

        Cpos4.x = Cpos4.x - 1; Cpos4.y = Cpos4.y + 1
        Cpos5.x = Cpos5.x + 1; Cpos5.y = Cpos5.y + 1
        Cpos6.x = Cpos6.x - 1; Cpos6.y = Cpos6.y - 1
        Cpos7.x = Cpos7.x + 1; Cpos7.y = Cpos7.y - 1

        -- Define área de dano com base na posição relativa
        if Cpos4.x == TposT.x and Cpos4.y == TposT.y then
            areaFP = forcePalm4
        elseif Cpos5.x == TposT.x and Cpos5.y == TposT.y then
            areaFP = forcePalm5
        elseif Cpos6.x == TposT.x and Cpos6.y == TposT.y then
            areaFP = forcePalm6
        elseif Cpos7.x == TposT.x and Cpos7.y == TposT.y then
            areaFP = forcePalm7
        else
            areaFP = forcePalm
        end

        -- Ajusta posição do efeito visual secundário
        if lado == 0 then
            pos.x = pos.x + 2
        elseif lado == 1 or lado == 2 then
            pos.x = pos.x + 2
            pos.y = pos.y + 2
        elseif lado == 3 then
            pos.y = pos.y + 2
        end

        -- Efeito visual principal
        doSendMagicEffect(TposT, 786)

        -- Efeito visual secundário com delay
        addEvent(doSendMagicEffect, 160, pos, effes[lado].effe2)

        -- Aplica dano com proteção e área específica
        addEvent(doDanoWithProtectWithDelay, 10, cid, target, FIGHTINGDAMAGE, min, max, 255, areaFP)
    end

    sendEffect(cid)

    --[[ 💡 Sugestão opcional: bônus contra tipo Normal ou Ice
    if isCreature(target) and (isPokeType(target, "Normal") or isPokeType(target, "Ice")) then
        local bonusMin = math.floor(min * 0.2)
        local bonusMax = math.floor(max * 0.2)
        addEvent(doDanoWithProtectWithDelay, 300, cid, target, FIGHTINGDAMAGE, bonusMin, bonusMax, 255, areaFP)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]
    return true
end
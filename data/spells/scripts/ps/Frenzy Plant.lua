function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Define o master (quem controla o summon, ou o próprio caster)
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    -- Função que executa a queda de pedras (42 impactos)
    local function doFall(cid)
        for rocks = 1, 42 do
            addEvent(fall, rocks * 35, cid, master, ELECTRICDAMAGE, 1, 259)
        end
    end

    -- Efeitos visuais ascendentes antes da queda
    for up = 1, 10 do
        addEvent(upEffect, up * 75, cid, 1)
    end

    -- Inicia a queda após os efeitos ascendentes
    addEvent(doFall, 450, cid)

    -- Define os parâmetros da condição Stun
    local ret = {}
    ret.id = 0                  -- ID 0 = área
    ret.cd = 9                  -- duração da condição
    ret.check = 0               -- controle interno
    ret.eff = 220               -- efeito visual do Stun
    ret.spell = spell           -- nome da spell
    ret.cond = "Stun"           -- tipo de condição aplicada

    -- Aplica dano em área com condição após a sequência
    addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, GRASSDAMAGE, min, max, spell, ret)

    --[[ 💡 Sugestão opcional: bônus contra tipo Water ou Flying
    local target = spellData.target
    if isCreature(target) and (isPokeType(target, "Water") or isPokeType(target, "Flying")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 1600, cid, 0, BigArea2, GRASSDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local posC1 = spellData.posC1 or getThingPosWithDebug(cid)

    -- Define o master (quem controla o summon, ou o próprio caster)
    local master = getCreatureMaster(cid) or 0

    -- Parâmetros da condição Stun
    local ret = {
        id = 0,              -- ID 0 = área
        cd = 9,              -- duração da condição
        eff = 147,           -- efeito visual do Stun
        check = 0,           -- controle interno
        spell = spell,       -- nome da spell
        cond = "Stun"        -- tipo de condição aplicada
    }

    -- Executa 62 impactos visuais com delay progressivo
    for rocks = 1, 62 do
        addEvent(fall, rocks * 35, cid, master, NORMALDAMAGE, -1, 147)
    end

    -- Efeito especial no início da animação
    addEvent(doSendMagicEffect, 150, posC1, 633)

    -- Aplica dano em área com condição Stun após a sequência
    addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret)

    --[[ 🪨 Sugestão opcional: bônus contra tipo Flying ou Fire
    local target = spellData.target
    if isCreature(target) and (isPokeType(target, "Flying") or isPokeType(target, "Fire")) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 800, cid, 0, BigArea2, NORMALDAMAGE, bonusMin, bonusMax, spell)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
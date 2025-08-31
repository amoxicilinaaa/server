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

    -- Parâmetros da condição "Stun"
    local ret = {
        id = 0,            -- 0 = área
        cd = 9,            -- duração da condição
        check = 0,         -- controle interno (evita reaplicação)
        eff = 22,          -- efeito visual da condição
        spell = spell,     -- nome da spell
        cond = "Stun"      -- tipo de condição aplicada
    }

    -- Aplica dano tipo NORMAL na área tw1 com efeito visual 22 e condição Stun
    doMoveInArea2(cid, 22, tw1, NORMALDAMAGE, min, max, spell, ret)

    --[[ 💥 FUTURO: Bônus contra tipo Ghost ou Flying
    if isCreature(target) and isInArray({"Ghost", "Flying"}, getPokemonTypeTable(target)) then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doMoveInArea2, 400, cid, 22, tw1, NORMALDAMAGE, bonusMin, bonusMax, spell, ret)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    --[[ 🌀 FUTURO: Variação de área por espécie
    local pokeName = getCreatureName(cid)
    local area = tw1
    if pokeName == "Tauros" then
        area = BigArea1
    elseif pokeName == "Kangaskhan" then
        area = reto5
    end
    doMoveInArea2(cid, 22, area, NORMALDAMAGE, min, max, spell, ret)
    --]]

    --[[ 🧠 FUTURO: Aplicar efeito visual recorrente enquanto estiver Stun
    local function stunLoop(target, duration)
        if isCreature(target) and duration > 0 and getPlayerStorageValue(target, conds["Stun"]) >= 0 then
            doSendMagicEffect(getThingPosWithDebug(target), 22)
            addEvent(stunLoop, 1000, target, duration - 1)
        end
    end
    addEvent(stunLoop, 500, target, ret.cd)
    --]]

    return true
end
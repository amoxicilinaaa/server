function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Troca de outfit temporária se o alvo for Pinsir ou Shiny Pinsir
    if getSubName(cid, target) == "Pinsir" then
        doSetCreatureOutfit(cid, {lookType = 2346}, 400)
    elseif getSubName(cid, target) == "Shiny Pinsir" then
        doSetCreatureOutfit(cid, {lookType = 2345}, 200)
    end

    -- Aplica dano com proteção e efeito visual (ID 146)
    addEvent(doDanoWithProtect, 100, cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 146)

    --[[ 🧪 FUTURO: Aplicar condição de "Stun" se o alvo for Pinsir
    if isCreature(target) and isInArray({"Pinsir", "Shiny Pinsir"}, getSubName(cid, target)) then
        local ret = {
            id = target,
            cd = 4,
            eff = 147,
            check = 0,
            spell = spell,
            cond = "Stun",
            first = true
        }
        addEvent(doCondition2, 200, ret)
    end
    --]]

    --[[ 💥 FUTURO: Bônus contra tipo Bug
    if isCreature(target) and isPokeType(target, "Bug") then
        local bonusMin = math.floor(min * 0.25)
        local bonusMax = math.floor(max * 0.25)
        addEvent(doDanoWithProtect, 400, cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -bonusMin, -bonusMax, 146)
        doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
    end
    --]]

    return true
end
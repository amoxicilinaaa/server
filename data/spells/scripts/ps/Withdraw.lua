function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell  = spellData.spell
    local target = spellData.target

    local subName = getSubName(cid, target)

    -- Troca de outfit conforme o alvo
    if subName == "Shuckle" then
        doSetCreatureOutfit(cid, {lookType = 2324}, 3000)
    elseif subName == "Cloyster" then
        doSetCreatureOutfit(cid, {lookType = 2325}, 3000)
    elseif subName == "Torkoal" then
        doSetCreatureOutfit(cid, {lookType = 2343}, 3000)
    end

    -- Paralisa o caster por 3 segundos
    stopNow(cid, 3000)

    -- Ativa storage para controle de estado
    setPlayerStorageValue(cid, 5000001, 1)
    addEvent(setPlayerStorageValue, 3000, cid, 5000001, -1)

    return true
end

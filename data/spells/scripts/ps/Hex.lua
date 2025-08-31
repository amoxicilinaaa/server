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

    -- Troca de outfit temporária para Dusclops e Dusknoir
    if getCreatureName(cid) == "Dusclops" then
        doSetCreatureOutfit(cid, {lookType = 1845}, 3000)
    elseif getCreatureName(cid) == "Dusknoir" then
        doSetCreatureOutfit(cid, {lookType = 1834}, 3000)
    end

    -- Aumenta status temporariamente (ex: velocidade, defesa, etc.)
    doRaiseStatus(cid, 0, 0, 300, 3)

    -- Ativa storage temporária (ID 5000001)
    setPlayerStorageValue(cid, 5000001, 1)
    addEvent(setPlayerStorageValue, 3000, cid, 5000001, -1)

    -- Aplica dano tipo GHOST na área após delay
    addEvent(doMoveInArea2, 2500, cid, 0, BigArea2, GHOSTDAMAGE, min, max, spell)

    return true
end
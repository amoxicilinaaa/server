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

    -- Define tipo de projétil visual por spell
    local eff = spell == "Razor Leaf" and 8 or 21

    -- Função que lança o projétil e aplica dano
    local function throw(cid, target)
        if not isCreature(cid) or not isCreature(target) then return false end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), eff)
        doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 245)
    end

    -- Executa duas instâncias do ataque com delay
    addEvent(throw, 0, cid, target)
    addEvent(throw, 100, cid, target)

    return true
end
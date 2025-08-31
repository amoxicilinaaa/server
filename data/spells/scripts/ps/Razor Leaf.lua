function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Define efeito visual do projétil
    local eff = spell == "Razor Leaf" and 8 or 21

    -- Função auxiliar para lançar o projétil e aplicar dano
    local function throw(cid, target)
        if not isCreature(cid) or not isCreature(target) then return false end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), eff)
        doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 245)
    end

    -- Executa duas vezes com delay
    addEvent(throw, 0, cid, target)
    addEvent(throw, 100, cid, target)

    return true
end
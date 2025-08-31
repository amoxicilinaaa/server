function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local posC = spellData.posC
    local posT = spellData.posT
    local posC1 = spellData.posC1
    local posT1 = spellData.posT1

    -- Função para curar status do Pokémon e da ball (se for summon)
    local function doCure(cid)
        if not isCreature(cid) then return true end
        if isSummon(cid) then
            local ball = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doCureBallStatus(ball.uid, "all")
        end
        doCureStatus(cid, "all")
    end

    -- Aplica outfit especial temporário para espécies específicas
    local name = getCreatureName(cid)
    if name == "Meditite" or name == "Charizard" or name == "Medicham" then
        doSetCreatureOutfit(cid, {lookType = 2345}, 3000)
    end

    -- Cura total de status
    doCure(cid)

    -- Paralisa o caster por 3 segundos
    stopNow(cid, 3000)

    -- Ativa storage temporário (pode ser usado para bloquear ações ou aplicar efeitos)
    setPlayerStorageValue(cid, 5000001, 1)
    addEvent(setPlayerStorageValue, 3000, cid, 5000001, -1)

    return true
end
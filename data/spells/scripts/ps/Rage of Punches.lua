function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell   = spellData.spell
    local target  = spellData.target
    local min     = spellData.min
    local max     = spellData.max

    -- Função auxiliar para executar cada impacto
    local function doRevenge(cid)
        if not isCreature(cid) then return false end

        -- Cancela se estiver dormindo ou com medo
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end

        local rev = getThingPosWithDebug(cid)
        rev.x = rev.x + 1
        rev.y = rev.y + 1

        -- Efeito visual por forma
        local name = getSubName(cid, target)
        local eff = isInArray({"Shiny Heracross", "Shiny Machamp"}, name) and 90 or 99
        doSendMagicEffect(rev, eff)

        -- Dano tipo FIGHTING em área splash
        doAreaCombatHealth(cid, FIGHTINGDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 255)
    end

    -- Define tempos de execução
    local times = {0, 500, 1000, 1500, 2300}

    -- Ativa storage de estado "Revenge"
    setPlayerStorageValue(cid, 3644587, 1)
    addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)

    -- Executa impactos em sequência
    for i = 1, #times do
        addEvent(doRevenge, times[i], cid)
    end

    return true
end
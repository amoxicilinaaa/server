function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = spellData.min
    local max = spellData.max

    -- Dano em duas áreas com delay (duas vezes)
    addEvent(doMoveInArea2, 2000, cid, 581, selfArea1, DRAGONDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 2000, cid, 248, outRage, DRAGONDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 4000, cid, 581, selfArea1, DRAGONDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 4000, cid, 248, outRage, DRAGONDAMAGE, min, max, spell)

    -- Efeitos visuais em loop (efeito 818)
    for i = 1, 13 do
        addEvent(sendEffWithProtect, i * 300, cid, getThingPos(cid), 818)
    end

    -- Paralisa o caster durante a execução
    stopNow(cid, 4000)

    -- Controle de storage para evitar conflito com Silence
    addEvent(setPlayerStorageValue, 50, cid, 32698, 1)     -- ativa Silence
    addEvent(setPlayerStorageValue, 1950, cid, 32698, -1)  -- desativa antes do 1º dano
    addEvent(setPlayerStorageValue, 2150, cid, 32698, 1)   -- ativa novamente
    addEvent(setPlayerStorageValue, 3950, cid, 32698, -1)  -- desativa antes do 2º dano

    return true
end
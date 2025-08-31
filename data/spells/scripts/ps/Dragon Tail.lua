dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Função para restaurar a velocidade
    local function rebackSpd(cid, sss)
        if not isCreature(cid) then return true end
        doChangeSpeed(cid, sss)
        setPlayerStorageValue(cid, 446, -1)
    end

    -- Reduz a velocidade e vira o Pokémon
    local currentSpeed = getCreatureSpeed(cid)
    doFaceOpposite(cid)
    doChangeSpeed(cid, -currentSpeed)
    addEvent(rebackSpd, 400, cid, currentSpeed)
    setPlayerStorageValue(cid, 446, 1)

    -- Corrige a posição do efeito
    local posTarget = getThingPosWithDebug(target)
    local posEffect = {x = posTarget.x + 1, y = posTarget.y, z = posTarget.z}

    doSendMagicEffect(posEffect, 492) -- efeito correto na posição ajustada
    doDanoWithProtect(cid, DRAGONDAMAGE, posTarget, 0, -min, -max, 0)

    return true
end
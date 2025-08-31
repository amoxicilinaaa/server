dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local target = spellData.target
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0
    local posT = spellData.posT

    -- Define efeito visual com base no nome do alvo
    local eff = 113
    local subName = getSubName(cid, target)
    if subName == "Shiny Hitmonlee" then
        eff = 651
    elseif subName == "Hitmonlee" then
        eff = 652
    end

    -- Dano inicial em área blaze com fogo
    doMoveInArea2(cid, 6, blaze, FIREDAMAGE, min, max, spell)
    doMoveInArea2(cid, eff, blaze, FIREDAMAGE, 0, 0, spell)

    -- Dano adicional com luta após 36ms
    addEvent(doMoveInArea2, 36, cid, 6, blaze, FIGHTINGDAMAGE, 0, 0, spell)
    addEvent(doMoveInArea2, 36, cid, eff, blaze, FIGHTINGDAMAGE, 0, 0, spell)

    -- Efeito visual no alvo
    doSendMagicEffect(posT, eff)

    -- Dano final em área kick com fogo após 200ms
    addEvent(doMoveInArea2, 200, cid, 6, kick, FIREDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 200, cid, eff, kick, FIREDAMAGE, 0, 0, spell)

    return true
end
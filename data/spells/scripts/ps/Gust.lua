function onCastSpell(cid, var)
    local spellData = applyStandardSpellLogic(cid, var)
    if not spellData then return false end

    local spell = spellData.spell
    local min = tonumber(spellData.min) or 0
    local max = tonumber(spellData.max) or 0

    -- Aplica dano tipo FLYING em área linear com efeito visual 42
    doMoveInArea2(cid, 42, reto5, FLYINGDAMAGE, min, max, spell)

    return true
end

--[[ 💥 FUTURO: Bônus contra tipo Grass ou Fighting
local target = spellData.target
if isCreature(target) and isInArray({"Grass", "Fighting"}, getPokemonTypeTable(target)) then
    local bonusMin = math.floor(min * 0.25)
    local bonusMax = math.floor(max * 0.25)
    addEvent(doMoveInArea2, 400, cid, 42, reto5, FLYINGDAMAGE, bonusMin, bonusMax, spell)
    doSendAnimatedText(getThingPosWithDebug(target), "Super Effective!", 215)
end
--]]

--[[ 🌀 FUTURO: Aplicar condição de "Flinch" por 2 segundos
local ret = {
    id = cid,
    cd = 2,
    eff = 0,
    check = 0,
    spell = spell,
    cond = "Flinch",
    first = true
}
doCondition2(ret)
--]]

--[[ 🦅 FUTURO: Variação de área por espécie
local pokeName = getCreatureName(cid)
local area = reto5
if pokeName == "Pidgeot" then
    area = reto6 -- área mais longa
elseif pokeName == "Tornadus" then
    area = BigArea1 -- explosão aérea
end
doMoveInArea2(cid, 42, area, FLYINGDAMAGE, min, max, spell)
--]]
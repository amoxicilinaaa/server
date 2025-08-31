dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
   local spellData = applyStandardSpellLogic(cid, var)
   if not spellData then return false end

   local spell = spellData.spell
   local target = spellData.target
   local min = tonumber(spellData.min) or 0
   local max = tonumber(spellData.max) or 0

   -- Posições já definidas pelo lib_spells
   local posCaster = spellData.posC
   local posTarget = spellData.posT
   local posTarget1 = spellData.posT1 -- posição deslocada (x+1, y+1)

   -- Verifica condição especial para Rapidash com storage ativo
   if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then
      doSendDistanceShoot(posCaster, posTarget, 57)
      doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, 302)
      addEvent(doSendMagicEffect, 60, posTarget1, 420) -- efeito visual deslocado
   else
      local isMegaX = isMega(cid) and getMegaID(cid) == "X"
      local shootEffect = isMegaX and 57 or 3
      local damageEffect = isMegaX and 302 or 15
      local magicEffect = isMegaX and 420 or 291

      doSendDistanceShoot(posCaster, posTarget, shootEffect)
      doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, damageEffect)
      addEvent(doSendMagicEffect, 60, posTarget1, magicEffect) -- efeito visual deslocado
   end
   -- Aplica Burn no alvo
   doBurnPoke(cid, target)
   return true
end
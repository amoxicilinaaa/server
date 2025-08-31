dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
   local spellData = applyStandardSpellLogic(cid, var)
   if not spellData then return false end

   local spell = spellData.spell
   local min = tonumber(spellData.min) or 0
   local max = tonumber(spellData.max) or 0

   -- Define o efeito visual com base no nome do spell
   local eff = (spell == "Aromateraphy") and 14 or 13

   -- Aplica o efeito visual e cura na área
   doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), bombWee3, 0, 0, eff)

   -- Cura o próprio status e o da Pokébola, se for um summon
   if isSummon(cid) then
      local master = getCreatureMaster(cid)
      local ball = getPlayerSlotItem(master, 8)
      doCureBallStatus(ball.uid, "all")
   end
   doCureStatus(cid, "all")

   -- Verifica criaturas na área e aplica cura condicional
   local uid = checkAreaUid(getThingPosWithDebug(cid), confusion, 1, 1)
   for _, pid in pairs(uid) do
      if isCreature(pid) and pid ~= cid then
         if ehMonstro(cid) and ehMonstro(pid) then
            doCureStatus(pid, "all")
         elseif isSummon(cid) then
            local canAttack = canAttackOther(cid, pid)
            if (isSummon(pid) and canAttack == "Can") or (isPlayer(pid) and canAttack ~= "Can") then
               if isSummon(pid) then
                  local ball = getPlayerSlotItem(getCreatureMaster(pid), 8)
                  doCureBallStatus(ball.uid, "all")
               end
               doCureStatus(pid, "all")
            end
         end
      end
   end
   return true
end

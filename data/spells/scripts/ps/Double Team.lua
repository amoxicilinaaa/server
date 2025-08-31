dofile("data/lib/lib_spells.lua")

function onCastSpell(cid, var)
   local spellData = applyStandardSpellLogic(cid, var)
   if not spellData then return false end

   local spell = spellData.spell
   local target = spellData.target

   local team = {
      ["Scyther"] = 3, ["Shiny Scyther"] = 3, ["Scizor"] = 4,
      ["Xatu"] = 2, ["Shiny Xatu"] = 3, ["Yanma"] = 2,
      ["Torchic"] = 2, ["Ludicolo"] = 2, ["Shiftry"] = 2,
      ["Altaria"] = 2, ["Snorunt"] = 2, ["Glalie"] = 2,
      ["Ninjask"] = 2, ["Gallade"] = 2, ["Pikachu"] = 2,
      ["Shiny Rattata"] = 2,
   }

   local function RemoveTeam(cid)
      if isCreature(cid) then
         doSendMagicEffect(getThingPosWithDebug(cid), 211)
         doRemoveCreature(cid)
      end
   end

   local function sendEff(cid, master, t)
      if isCreature(cid) and isCreature(master) and t > 0 and #getCreatureSummons(master) >= 2 then
         doSendMagicEffect(getThingPosWithDebug(cid), 86, master)
         addEvent(sendEff, 1000, cid, master, t - 1)
      end
   end

   if #getCreatureSummons(getCreatureMaster(cid)) > 1 then return true end
   if getPlayerStorageValue(cid, 637500) >= 1 then return true end

   local master = getCreatureMaster(cid)
   local item = getPlayerSlotItem(master, 8)
   local life, maxLife = getCreatureHealth(cid), getCreatureMaxHealth(cid)
   local name = doCorrectString(getCreatureName(cid))
   local pos = getThingPosWithDebug(cid)
   local time = 21

   doItemSetAttribute(item.uid, "hp", (life / maxLife))

   local num = team[name]
   local pk = {}

   local function doCreatureAddHealthWithSecurity(cid, heal)
      if not isCreature(cid) then return true end
      doCreatureAddHealth(cid, heal)
   end

   local function setStorage(cid)
      if not isCreature(cid) then return true end
      setPlayerStorageValue(cid, 63012, 1)
      addEvent(setStorage, 1000, cid)
   end

   if num then
      pk[1] = cid
      for b = 2, num do
         local pokeSourceCode = doSummonMonster(master, name)
         if pokeSourceCode == "Nao" then
            doSendMsg(master, "Não há espaço para seu Pokémon.")
            return true
         end

         pk[b] = getCreatureSummons(master)[b]
         setPlayerStorageValue(pk[b], 510, name)
         setStorage(pk[b])
         adjustStatus(pk[b], item.uid, true, true, true, true)
         doCreatureAddHealthWithSecurity(pk[b], -(maxLife - life))
      end

      for a = 1, num do
         addEvent(doTeleportThing, math.random(0, 5), pk[a], getClosestFreeTile(pk[a], pos), false)
         doSendMagicEffect(getThingPosWithDebug(pk[a]), 211)
         setPlayerStorageValue(pk[2], 637500, 1)
         doCreatureSetSkullType(pk[a], getCreatureSkullType(pk[1]))
         if a ~= 1 then
            addEvent(RemoveTeam, time * 1000, pk[a])
         end
      end

      sendEff(cid, master, time)
      setPlayerStorageValue(master, 637501, 1)
      addEvent(setPlayerStorageValue, time * 1000, master, 637501, -2)
   end

   return true
end
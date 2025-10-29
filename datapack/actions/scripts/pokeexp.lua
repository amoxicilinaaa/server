
function onDeath(cid, corpse, deathList, lastHit)




   if isNpcSummon(cid) then
          local master = getCreatureMaster(cid)
          doSendMagicEffect(getThingPos(cid), getPlayerStorageValue(cid, 10000))
          doCreatureSay(master, getPlayerStorageValue(cid, 10001), 1)
          doRemoveCreature(cid)
          return false
   end

   if corpse.itemid ~= 0 then --alterado v1.8
		  doItemSetAttribute(corpse.uid, "nick", getPokemonLevel(cid))
		  doItemSetAttribute(corpse.uid, "level", getPokeLevel(cid))
          doItemSetAttribute(corpse.uid, "gender", getPokemonGender(cid))
   end
return true
end
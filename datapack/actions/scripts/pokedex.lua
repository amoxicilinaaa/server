local rate = 20

function onUse(cid, item, fromPos, item2, toPos)
 
if not isCreature(item2.uid) then
return true
end

local poke = getCreatureName(item2.uid)

	if isMonster(item2.uid) then
       local this = newpokedex[getCreatureName(item2.uid)]
	   local myball = 0
	   if isSummon(item2.uid) then
	      myball = getPlayerSlotItem(getCreatureMaster(item2.uid), 8)
       end
       if not getPlayerInfoAboutPokemon(cid, poke).dex then
	      local exp = this.level * rate
          doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Parabéns, você desbloqueou ".. getCreatureName(item2.uid).." em sua Pokédex.")
	      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você ganhou "..exp.." pontos de experiência.")
          doSendMagicEffect(getThingPos(cid), 210)
          doPlayerAddExperience(cid, exp)
          doAddPokemonInDexList(cid, poke)
       else
          doShowPokedexRegistration(cid, item2, myball)
       end
	return true
	end

if not isPlayer(item2.uid) then return true end

	local kanto = 0
	local johto = 0
	local hoen = 0
	local sinooh = 0
                                                    --alterado v1.6

	local player = getRecorderPlayer(toPos, cid)


return true
end
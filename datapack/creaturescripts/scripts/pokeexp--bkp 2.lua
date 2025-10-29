local balls = {11826, 11828, 11829, 11831, 11832, 11834, 11835, 11837,
	       11737, 11739, 11740, 11742, 11743, 11745, 11746, 11748}
                                                                                  
local function playerAddExp(cid, exp)
   doPlayerAddExp(cid, exp)
   doSendAnimatedText(getThingPos(cid), exp, 215)
end

local function giveExpToPlayer(pk, expTotal, givenexp, expstring)      --alterado v2.7
playerAddExp(pk, expTotal)    

local firstball = getPlayerSlotItem(pk, 8)

if not isInParty(pk) and firstball and getItemAttribute(firstball.uid,  expstring) and getItemAttribute(firstball.uid,  expstring) > 0 then
   local percent = getItemAttribute(firstball.uid, expstring) <= 1 and getItemAttribute(firstball.uid, expstring) or 1
   local gainexp = math.ceil(percent * givenexp)
   doItemSetAttribute(firstball.uid, expstring, 0)
   givePokemonExp(pk, firstball, expTotal)  --alterado v2.7
elseif isInParty(pk) and firstball.uid ~= 0 then
   givePokemonExp(pk, firstball, expTotal*3)    --alterado v2.7
end

for b = 1, #balls do
    local pokes = getItemsInContainerById(getPlayerSlotItem(pk, 3).uid, balls[b])
    if #pokes >= 1 then
       for _, uid in pairs (pokes) do
           if not isInParty(pk) and getItemAttribute(uid,  expstring) and getItemAttribute(uid,  expstring) > 0 then
              local percent = getItemAttribute(uid, expstring) <= 1 and getItemAttribute(uid, expstring) or 1
              local gainexp = math.ceil(percent * givenexp)
              doItemSetAttribute(uid, expstring, 0)
              givePokemonExpInBp(pk, uid, gainexp, balls[b])                  --alterado v2.7
           elseif isInParty(pk) and getItemAttribute(uid,  expstring) and getItemAttribute(uid,  expstring) > 0 then
              givePokemonExpInBp(pk, uid, expTotal*3, balls[b])
           end
       end
    end
end
end

local Exps = {
{minL = 1, maxL = 51, multipler = 1.6},
{minL = 51, maxL = 150, multipler = 1.4},
{minL = 150, maxL = 199, multipler = 1.2},
{minL = 200, maxL = 249, multipler = 1.0},
{minL = 250, maxL = 299, multipler = 0.9},
}

local function calculaExp(cid, expTotal)
if not isPlayer(cid) then return 0 end
   local expFinal = expTotal
   local flag = false
   for _, TABLE in pairs(Exps) do
          if getPlayerLevel(cid) >= TABLE.minL and getPlayerLevel(cid) <= TABLE.maxL then
                 flag = true
                 expFinal = expFinal * TABLE.multipler
                 break
          end
   end
   if not flag then expFinal = expFinal * 0.1 end --lvl 300+
return math.floor(expFinal)
end

function onDeath(cid, corpse, deathList)

if isSummon(cid) or not deathList or getCreatureName(cid) == "Evolution" then return true end --alterado v1.8
-------------Edited Golden Arena-------------------------
   if getPlayerStorageValue(cid, 22546) == 1 then
          setGlobalStorageValue(22548, getGlobalStorageValue(22548)-1)
          if corpse.itemid ~= 0 then doItemSetAttribute(corpse.uid, "golden", 1) end --alterado v1.8
   end
   if getPlayerStorageValue(cid, 22546) == 1 and getGlobalStorageValue(22548) == 0 then
          local wave = getGlobalStorageValue(22547)
          for _, sid in ipairs(getPlayersOnline()) do
                 if isPlayer(sid) and getPlayerStorageValue(sid, 22545) == 1 then
                    if getGlobalStorageValue(22547) < #wavesGolden+1 then
                           doPlayerSendTextMessage(sid, 20, "Wave "..wave.." will begin in "..timeToWaves.."seconds!")
                           doPlayerSendTextMessage(sid, 28, "Wave "..wave.." will begin in "..timeToWaves.."seconds!")
                           addEvent(creaturesInGolden, 100, GoldenUpper, GoldenLower, false, true, true)
                           addEvent(doWave, timeToWaves*1000)
                    elseif getGlobalStorageValue(22547) == #wavesGolden+1 then
                           doPlayerSendTextMessage(sid, 20, "You have win the golden arena! Take your reward!")
                           doPlayerAddItem(sid, 2152, getPlayerStorageValue(sid, 22551)*2) --premio
                           setPlayerStorageValue(sid, 22545, -1)
                           doTeleportThing(sid, getClosestFreeTile(sid, posBackGolden), false)
                           setPlayerRecordWaves(sid)
                    end
                 end
          end
          if getGlobalStorageValue(22547) == #wavesGolden+1 then
                 endGoldenArena()
          end
   end
--------------------------------------------------- /\/\
   	local givenexp = getWildPokemonExp(cid)
	local expstring = ""..cid.."expEx" 

   if givenexp > 0 then
          for a = 1, #deathList do
                  local pk = deathList[a]
                  local list = getSpectators(getThingPosWithDebug(pk), 30, 30, false)
                  if isCreature(pk) then
                         local expTotal = math.floor(playerExperienceRate * givenexp / 1.9)
                                   expTotal = calculaExp(pk, expTotal)
                         local party = getPartyMembers(pk)
                         if isInParty(pk) and getPlayerStorageValue(pk, 4875498) <= -1 then
                            expTotal = math.floor(expTotal/#party)
                            for i = 1, #party do
                                    if isInArray(list, party[i]) then
                                           --playerAddExp(party[i], expTotal)
                                           giveExpToPlayer(party[i], expTotal, givenexp, expstring)
                                    end
                            end
                         else
                                 --playerAddExp(pk, expTotal)
                                 giveExpToPlayer(pk, expTotal, givenexp, expstring)
                         end
                  end
          end
   end

   if isNpcSummon(cid) then
          local master = getCreatureMaster(cid)
          doSendMagicEffect(getThingPos(cid), getPlayerStorageValue(cid, 10000))
          doCreatureSay(master, getPlayerStorageValue(cid, 10001), 1)
          doRemoveCreature(cid)
          return false
   end

   if corpse.itemid ~= 0 then --alterado v1.8
          doItemSetAttribute(corpse.uid, "level", getPokemonLevel(cid))
          doItemSetAttribute(corpse.uid, "gender", getPokemonGender(cid))
   end
return true
end
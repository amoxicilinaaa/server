local config = {
        lottery_hour = "5 hours", -- Tempo ate a proxima loteria (Esse tempo vai aparecer somente como broadcast message)
        rewards_id = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449},
        crystal_counts = 2, -- Usado somente se a rewards_id for crystal coin (ID: 2160).
        website = "no", -- Only if you have php scripts and table `lottery` in your database!
        }
function onTimer(interval, lastExecution)
if(getWorldCreatures(0) == 0)then
  return true
end

	local list = {}
	for i, tid in ipairs(getPlayersOnline()) do
  list[i] = tid
end

local winner = list[math.random(1, #list)]
local random_item = config.rewards_id[math.random(1, #config.rewards_id)]

if(random_item == 2152) then
  doPlayerAddItem(winner, random_item, config.crystal_counts)
  doBroadcastMessage("[LOTTERY SYSTEM] Parabens: " .. getCreatureName(winner) .. ", Ganhou: " .. config.crystal_counts .. " " .. getItemNameById(random_item) .. "s! Congratulations! (Next Lottery in " .. config.lottery_hour .. ")")
else
  doBroadcastMessage("[LOTTERY SYSTEM] Parabens: " .. getCreatureName(winner) .. ", Ganhou: " .. getItemNameById(random_item) .. "! Congratulations! (Next Lottery in " .. config.lottery_hour .. ")")
  doPlayerAddItem(winner, random_item, 1)
end

if(config.website == "yes") then
  db.executeQuery("INSERT INTO `lottery` (`name`, `item`) VALUES ('".. getCreatureName(winner) .."', '".. getItemNameById(random_item) .."');")
end
return true
end
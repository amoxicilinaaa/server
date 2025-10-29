--[[
  Sistema de Auto-loot
  
]]

al_config = {
  str = 55554, -- Storage para ativar/desativar o auto-loot.
  free_max_slot = 20, -- Caso queira fazer diferente, coloque valores maximos para premium e free.
  premium_max_slot = 40, -- Caso queira fazer diferente, coloque valores maximos para premium e free.
  opcode = 33, -- Escolha o opcode.
  money_ids = {2148,2152,2160}, -- Configure o id das suas moedas, notas, etc de dinheiro.
  types = {
    ["Stones"] = {11447,11442,11441,11453,11445,11443,11444,11446,11448,11450,11451,11452,12232,12244,11449,11454},  -- config, id dos items de cada categoria.
    ["Itend Hugh"] = {12276,12277,12268,12236,12211,12149,12151,12150,12289,12180,12342,12283,12142,12148,12154,12156,12158,12159,12160,12166,12167,12169,12172,12174,12178,12186,12187,12189,12191,12193,12194,12195,12197,12198,12199,12204,12205,12208,12209,12223,12226,12228,12229,12235,12240,12241,12243,12250,12270,12271,12272,12273,12274,12278,12279,12280,12284,12285,12341,12196,12203,12207,13782,13784,12141,12168,13862,13863,13864,13865,13866,13867,13868,13869,13870,13871,13872,13873,13874,13875,13876,13877,13878,13879,13880,13881,13882,13883,13884,13885,13886,13887,13888,13889,13890,13891,13892,13893,13894,13895,13897,13898,13899,13900,13901,12204,12196,13867,12175,12183,12157,12207,12185},
    ["Itens Mark"] = {12176,12177,12152,12179,12161,12181,12188,12162,12337,12171,12164,2694,12334,12175,12165,12200,12170,12200,12163,12155,12173,12173,12182,12286,12185,12184,12282,12288,12192,12201,12202,12745,13783,13785,13789,12206,12745,12240,12153},
	["Outros"] = {24148,24149,24150,20719,22051,22050,2151,20898,20899,20900,20901,20902,20903,20905,21079,21996,21996,21997,21998,21999,22000,22001,22002,22003},
  }
}

function isMoney(itemid)
  if isInArray(al_config.money_ids, itemid) then return true end
  return false
end

function doChangeItemInAL(cid, type, itemid)
  if not al_config.types[type] then return end
  local current, itemAlStr = getAllAlValue(cid), getPlayerStorageValue(cid, 101010+itemid)
  local max = isPremium(cid) and al_config.premium_max_slot or al_config.free_max_slot
  if itemAlStr <= 0 and current > max then
    return doPlayerPopupFYI(cid, "Atingiu o limite maximo de itens ("..max..").")
  end
  setPlayerStorageValue(cid, 101010+itemid, itemAlStr == 1 and 0 or 1)
  sendItemsAL(cid, type)
end

-- function doChangeItemInAL(cid, type, itemid)
  -- if not al_config.types[type] then return end
  -- local current = getAllAlValue(cid)
  -- local itemAlStr = getPlayerStorageValue(cid, 101010+itemid)
  -- local max = al_config.free_max_slot
  -- if isPremium(cid) then max = al_config.premium_max_slot end
  -- if itemAlStr <= 0 and current > max then
    -- doPlayerPopupFYI(cid, "Atingiu o limite máximo de itens("..max..").")
    -- return false
  -- end
  -- if itemAlStr == 1 then
    -- setPlayerStorageValue(cid, 101010+itemid, 0)
  -- else
    -- setPlayerStorageValue(cid, 101010+itemid, 1)
  -- end
  -- sendItemsAL(cid, type)
  -- return true
-- end

function getAllAlValue(cid)
  local current = 0
  for _type, index in pairs(al_config.types) do
	for v=1, #al_config.types[_type] do
	  local id = al_config.types[_type][v]
	  if getPlayerStorageValue(cid, 101010+id) > 0 then
	    current = current+1
	  end
	end
  end
  return current
end

function getAllItemsInAl(cid)
  local items = {}
  for type, index in pairs(al_config.types) do
    for v=1, #al_config.types[type] do
      local id = al_config.types[type][v]
      if getPlayerStorageValue(cid, 101010+id) > 0 then
        table.insert(items, id)
      end
    end
  end
  return items
end

function getAllItemsInAlByType(cid, type)
  local items = {}
  for v=1, #al_config.types[type] do
    local id = al_config.types[type][v]
    if getPlayerStorageValue(cid, 101010+id) > 0 then
      table.insert(items, id)
    end
  end
  return items
end

function sendItemsAL(cid, type)
  local protocol = Protocol_create("items")
  local types = {}
  local items = {}
  if not al_config.types[type] then return end
  for _type, index in pairs(al_config.types) do
    if type ~= _type then table.insert(types, _type) end
  end
  for v=1, #al_config.types[type] do
    local id = al_config.types[type][v]
    items[id] = {}
    items[id].name = getItemNameById(id)
    items[id].itemid = getItemInfo(id).clientId
  end
  local itemsInAl = {}
  local _i = getAllItemsInAl(cid)
  for a=1, #_i do
	itemsInAl[a] = {}
    itemsInAl[a].id = _i[a]
    itemsInAl[a].itemid = getItemInfo(_i[a]).clientId
  end
  Protocol_add(protocol, getPlayerStorageValue(cid, al_config.str))
  Protocol_add(protocol, type)
  Protocol_add(protocol, types)
  Protocol_add(protocol, items)
  Protocol_add(protocol, itemsInAl)
  doSendPlayerExtendedOpcode(cid, al_config.opcode, table.tostring(protocol))
end

local function doStack(cid, itemid, new)
	local count = getPlayerItemCount(cid, itemid)
	if (count >= 100) then
		count = count - math.floor(count / 100) * 100
	end
	local newCount = count + new
	if (count ~= 0) then
		local find = getPlayerItemById(cid, true, itemid, count).uid
		if (find > 0) then
			doRemoveItem(find)
		else
			newCount = new
		end
	end
	local item = doCreateItemEx(itemid, newCount)
	doPlayerAddItemEx(cid, item, true)
end

function doAutoLoot(cid, pos)
  if not isCreature(cid) then return false end
  local items_al = getAllItemsInAl(cid)
  for _=1, 255 do
    pos.stackpos = _
	local item = getTileThingByPos(pos)
	--if item.uid > 0 and isCorpse(item.uid) then
	if item.uid > 0 and isContainer(item.uid) and getContainerSize(item.uid) then
	  local items = getCorpseItems(item)
	  for _, it in pairs(items) do
	    local itemid = it.itemid
        if isItemMovable(itemid) then
          if isInArray(items_al, itemid) or isMoney(itemid) then
			if isItemStackable(itemid) and (getPlayerItemCount(cid, itemid) > 0) then
				doStack(cid, itemid, it.type)
			else
				local item = doCreateItemEx(itemid, it.type)
				doPlayerAddItemEx(cid, item, true)
			end
            doRemoveItem(it.uid)
          end
        end
	  end
	  break
	end
  end
end

function getCorpseItems(corpse) --*
  local items = {}
  local containers = {}
  -- if isContainer(corpse) and type(getContainerSize(corpse.uid)) ~= "number" then return {} end
  -- print("Itemname:" ..getItemNameById(corpse.itemid))
  for slot = 0, getContainerSize(corpse.uid)-1 do
    local item = getContainerItem(corpse.uid, slot)
	if item.itemid == 0 then break end
	if isContainer(item.uid) then table.insert(containers, item) end
	table.insert(items, item)
  end
  if #containers > 0 then
    for _, item in ipairs(getCorpseItems(containers[1])) do table.insert(items, item) end
	table.remove(containers, 1)
  end
  return items
end

-- Funções complementares --

function getItemsInContainerById(container, itemid) -- Function By Kydrai
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
			if isContainer(item.uid) then
				local itemsbag = getItemsInContainerById(item.uid, itemid)
				for i=0, #itemsbag do
					table.insert(items, itemsbag[i])
				end
			else
				if itemid == item.itemid then
					table.insert(items, item.uid)
				end
			end
		end
	end
	return items
end

function doPlayerAddItemStacking(cid, itemid, amount) --*
	local item, count = getItemsInContainerById(getPlayerSlotItem(cid, 3).uid, itemid), 0
	if #item > 0 then
		for _ ,x in pairs(item) do
			local ret = getThing(x)
			if ret.type < 100 then
				doTransformItem(ret.uid, itemid, ret.type+amount) 
				if ret.type+amount > 100 then
					doPlayerAddItem(cid, itemid, ret.type+amount-100)
				end
				break
			else
				count = count+1
			end
		end
		if count == #item then
			doPlayerAddItem(cid, itemid, amount)
		end
	else
		return doPlayerAddItem(cid, itemid, amount)
	end
end

killua_functions = 
{
  filtrateString = function(str) -- By Killua
      local tb, x, old, last = {}, 0, 0, 0
      local first, second, final = 0, 0, 0
      if type(str) ~= "string" then
          return tb
      end
      for i = 2, #str-1 do
        if string.byte(str:sub(i,i)) == string.byte(':') then
            x, second, last = x+1, i-1, i+2
            for t = last,#str-1 do
              if string.byte(str:sub(t,t)) == string.byte(',') then
                  first = x == 1 and 2 or old
                  old, final = t+2, t-1
                  local index, var = str:sub(first,second), str:sub(last,final)
                  tb[tonumber(index) or tostring(index)] = tonumber(var) or tostring(var)
                  break
              end
            end
        end
      end
      return tb
  end,
  
  translateIntoString = function(tb) -- By Killua
      local str = ""
      if type(tb) ~= "table" then
        return str
      end
      for i, t in pairs(tb) do
        str = str..i..": "..t..", "
      end
      str = "a"..str.."a"
      return tostring(str)
  end
}

function setPlayerTableStorage(cid, key, value)
  return doPlayerSetStorageValue(cid, key, killua_functions.translateIntoString(value))
end

function getPlayerTableStorage(cid, key)
  return killua_functions.filtrateString(getPlayerStorageValue(cid, key))
end
local helds = {
{ids = {
  15587,  -- Defense 1
  15559,  -- Attack 1
  15629,  -- Return 1
  15601,  -- Hellfire 1
  15622,  -- Poison 1
  15573,  -- Boost 1
  13976,  -- Agility 1
  17446,  -- Strafe 1
  17439,  -- Rage 1
  13983,  -- Harden 1
  15594,  -- Experience 1
  13962,  -- Elemental 1
  15580,  -- Critical 1
  15636,  -- Vitality 1
  15608,  -- Haste 1
  13990,  -- Accuracy 1
  15566,  -- X-Block 1
  15615,  -- X-Lucky 1
  13941,  -- Regeneration 1
  17409   -- Cure 1
}, price = 10000000}, --100k

{ids = {
  15588,  -- Defense 2
  15560,  -- Attack 2
  15630,  -- Return 2
  15602,  -- Hellfire 2
  15623,  -- Poison 2
  15574,  -- Boost 2
  13977,  -- Agility 2
  17447,  -- Strafe 2
  17440,  -- Rage 2
  13984,  -- Harden 2
  15595,  -- Experience 2
  13963,  -- Elemental 2
  15581,  -- Critical 2
  15637,  -- Vitality 2
  15609,  -- Haste 2
  13991,  -- Accuracy 2
  15567,  -- X-Block 2
  15616,  -- X-Lucky 2
  13942,  -- Regeneration 2
  17410   -- Cure 2
}, price = 22000000}, -- 220k

{ids = {
  15589,  -- Defense 3
  15561,  -- Attack 3
  15631,  -- Return 3
  15603,  -- Hellfire 3
  15624,  -- Poison 3
  15575,  -- Boost 3
  13978,  -- Agility 3
  17448,  -- Strafe 3
  17441,  -- Rage 3
  13985,  -- Harden 3
  15596,  -- Experience 3
  13964,  -- Elemental 3
  15582,  -- Critical 3
  15638,  -- Vitality 3
  15610,  -- Haste 3
  13992,  -- Accuracy 3
  15568,  -- X-Block 3
  15617,  -- X-Lucky 3
  13943,  -- Regeneration 3
  17411   -- Cure 3
}, price = 37000000}, -- 370k
{ids = {
  15590,  -- Defense 4
  15562,  -- Attack 4
  15632,  -- Return 4
  15604,  -- Hellfire 4
  15625,  -- Poison 4
  15576,  -- Boost 4
  13979,  -- Agility 4
  17449,  -- Strafe 4
  17442,  -- Rage 4
  13986,  -- Harden 4
  15597,  -- Experience 4
  13965,  -- Elemental 4
  15583,  -- Critical 4
  15639,  -- Vitality 4
  15611,  -- Haste 4
  13993,  -- Accuracy 4
  15569,  -- X-Block 4
  15618,  -- X-Lucky 4
  13944,  -- Regeneration 4
  17412   -- Cure 4
}, price = 100000000}, -- 1kk
{ids = {
  13980,  -- Agility 5
  17450,  -- Strafe 5
  17443,  -- Rage 5
  13987,  -- Harden 5
  15598,  -- Experience 5
  13966,  -- Elemental 5
  15584,  -- Critical 5
  15640,  -- Vitality 5
  15612,  -- Haste 5
  13994,  -- Accuracy 5
  15570,  -- X-Block 5
  15619,  -- X-Lucky 5
  13945,  -- Regeneration 5
  17413   -- Cure 5
}, price = 150000000}, -- 1.5kk
{ids = {
  15592,  -- Defense 6
  15564,  -- Attack 6
  15634,  -- Return 6
  15606,  -- Hellfire 6
  15627,  -- Poison 6
  15578,  -- Boost 6
  13981,  -- Agility 6
  17451,  -- Strafe 6
  17444,  -- Rage 6
  13988,  -- Harden 6
  15599,  -- Experience 6
  13967,  -- Elemental 6
  15585,  -- Critical 6
  15641,  -- Vitality 6
  15613,  -- Haste 6
  13995,  -- Accuracy 6
  15571,  -- X-Block 6
  15620,  -- X-Lucky 6
  13946,  -- Regeneration 6
  17414   -- Cure 6
}, price = 200000000}, -- 2kk
{ids = {
  15593,  -- Defense 7
  15565,  -- Attack 7
  15635,  -- Return 7
  15607,  -- Hellfire 7
  15628,  -- Poison 7
  15579,  -- Boost 7
  13982,  -- Agility 7
  17452,  -- Strafe 7
  17445,  -- Rage 7
  13989,  -- Harden 7
  15600,  -- Experience 7
  13968,  -- Elemental 7
  15586,  -- Critical 7
  15642,  -- Vitality 7
  15614,  -- Haste 7
  13996,  -- Accuracy 7
  15572,  -- X-Block 7
  15621,  -- X-Lucky 7
  13947,  -- Regeneration 7
  17415   -- Cure 7
}, price = 250000000}, -- 2.5kk
}

function onUse(cid, item, frompos, item2, topos) 
	
	local needDirection = getDirectionTo(getCreaturePosition(cid), frompos)
	doCreatureSetLookDir(cid, needDirection)
	local machine_pos = {x=frompos.x-1,y=frompos.y,z=frompos.z}
	local helds_ = {}
	local machine = getTileItemById(machine_pos, 16178)
	if machine and isContainer(machine.uid) then
		local held_item = getContainerItem(machine.uid, 0)
		local held_item1 = getContainerItem(machine.uid, 1)
		local held_item2 = getContainerItem(machine.uid, 2)
		if held_item.itemid > 0 and held_item1.itemid > 0 and held_item2.itemid > 0 then
			for p, h in pairs(helds) do
				local uids = {}
				for i=1,#h.ids do 
					if #uids < 3 then
						if held_item.itemid == h.ids[i] then
							table.insert(uids,held_item.uid)
						end
						if held_item1.itemid == h.ids[i] then
							table.insert(uids,held_item1.uid)
						end
						if held_item2.itemid == h.ids[i] then
							table.insert(uids,held_item2.uid)
						end
					end
					if #uids == 3 then
						table.insert(helds_,{tier=p,uid=uids,price=h.price})
						uids = {}
					end
				end
			end
		end
	end
	local sendMsg_fail = false
	local msg_fail = "Não foi possível fazer a fusão verifique os held's colocados."
	if #helds_ > 0 then
		for p, h in pairs(helds_) do
			if doPlayerRemoveMoney(cid,h.price) == true then
				local new_held = h.tier < 7 and h.tier+1 or 7
				local rheld = math.random(1, #helds[new_held].ids)
				doPlayerAddItem(cid,helds[new_held].ids[rheld])
				doSendMsg(cid, "Você criou um novo Held item.")
				for z, v in pairs(h.uid) do
					if v then
						doRemoveItem(v,1)
					end
				end
			else
				sendMsg_fail = true
				msg_fail = "Você precisa de $".. h.price/100 .."."
			end
		end
	end
	if #helds_ == 0 or sendMsg_fail then
		doPlayerSendCancel(cid,msg_fail)
		doSendMagicEffect(getThingPos(cid), 2)
	end
	
	return true
end
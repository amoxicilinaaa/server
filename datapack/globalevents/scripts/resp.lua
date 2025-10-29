local positions =	--Areas onde os monstros nascerão randomicamente..
{
{x = 1688, y = 1506, z = 7},
{x = 1664, y = 1186, z = 7},
{x = 1764, y = 1043, z = 7},
{x = 1658, y = 1014, z = 7},
{x = 1582, y = 1090, z = 7},
{x = 1032, y = 764, z = 8},
{x = 1026, y = 802, z = 9},
{x = 1659, y = 1197, z = 7},
{x = 1733, y = 1015, z = 7},
{x = 1906, y = 937, z = 7},
{x = 1976, y = 1566, z = 6},
{x = 2045, y = 1494, z = 6},
{x = 2133, y = 1397, z = 6},
{x = 2227, y = 1039, z = 7},
{x = 1790, y = 984, z = 7},
{x = 1619, y = 965, z = 7},
{x = 669, y = 1123, z = 7},

}

local m = {"Rocket Machine", "Zorua", "Snake", "Great Snake"} -- Coloque os monstros que quer que nasça nas areas

function onThink(interval, lastExecution, thinkInterval)
if(math.random(1, 100) < 900) then -- 1% de chance
local pos = positions[math.random(1, #positions)]
local monster = m[math.random(1,#m)]
if(type(doCreateMonster(m[math.random(1,#m)], {x=pos.x, y=pos.y, z=pos.z}, false)) == "number") then
end
end
return true
end
local condition = createConditionObject(CONDITION_LIGHT)
setConditionParam(condition, CONDITION_PARAM_LIGHT_LEVEL, 13)
setConditionParam(condition, CONDITION_PARAM_LIGHT_COLOR, 215)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1)

function onLogin(cid, var)
if getPlayerGroupId(cid) == 6 then
doAddCondition(cid, condition)
setPlayerStorageValue(cid, 54448, 1)
end
return TRUE
end
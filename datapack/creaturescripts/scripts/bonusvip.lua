function onLogin(cid)

	local rating = 1.5 -- 50%
	local config = 
	{
		welvip = "Você é um membro VIP, e por isso você tem um Bônus de EXP.",
		not_vip = "Players VIP tem um Bônus de EXP melhor do que os Free's.",
	}

	if isPremium(cid) then
		doPlayerSetExperienceRate(cid, rating)
		doPlayerSendTextMessage(cid, 26, config.welvip)
	else
		doPlayerSendTextMessage(cid, 26, config.not_vip)
	end
	
	return true
end
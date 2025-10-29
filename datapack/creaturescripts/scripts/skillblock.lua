function onAdvance(cid, skill, oldLevel, newLevel)
    if skill == SKILL_SWORD then
        if getPlayerSkillLevel(cid, SKILL_SWORD) >= 171 then
                doPlayerSetRate(cid, SKILL_SWORD, 0.0)
        end
    
    elseif skill == SKILL_SWORD then
        if getPlayerSkillLevel(cid, SKILL_FIST) >= 171 then
                doPlayerSetRate(cid, SKILL_FIST, 0.0)
        end    
    return false
    
    elseif skill == SKILL_AXE then
        if getPlayerSkillLevel(cid, SKILL_AXE) >= 171 then
                doPlayerSetRate(cid, SKILL_AXE, 0.0)
        end    
    return false
    
    elseif skill == SKILL_CLUB then
        if getPlayerSkillLevel(cid, SKILL_CLUB) >= 171 then
                doPlayerSetRate(cid, SKILL_CLUB, 0.0)
        end    
    return false
    
    elseif skill == SKILL_DISTANCE then
        if getPlayerSkillLevel(cid, SKILL_DISTANCE) >= 171 then
                doPlayerSetRate(cid, SKILL_DISTANCE, 0.0)
        end    
    return false
    
    elseif skill == SKILL_SHIELD then
        if getPlayerSkillLevel(cid, SKILL_FIST) >= 171 then
                doPlayerSetRate(cid, SKILL_FIST, 0.0)
        end    
    return false
    
    elseif skill == SKILL_FISH then
        if getPlayerSkillLevel(cid, SKILL_FISH) >= 171 then
                doPlayerSetRate(cid, SKILL_FISH, 0.0)
        end    
    return false
    
end
end
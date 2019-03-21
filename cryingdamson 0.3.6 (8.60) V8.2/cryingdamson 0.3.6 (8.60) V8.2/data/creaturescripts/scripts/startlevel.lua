function onLogin(cid)
    local actualLevel = getPlayerStorageValue(cid,8080)
    if actualLevel == -1 then
        setPlayerStorageValue(cid,8080,8)
        actualLevel = 8
    end
	
    if getPlayerStorageValue(cid, 8081) == -1 then
      setPlayerStorageValue(cid,8081, 1)
    end
	
    if getPlayerStorageValue(cid, 8082) == -1 then
      setPlayerStorageValue(cid,8082, 1)
    end	
	
	if getPlayerStorageValue(cid, 8083) == -1 then
      setPlayerStorageValue(cid,8083, 1)
    end	
	
	if getPlayerStorageValue(cid, 8084) == -1 then
      setPlayerStorageValue(cid,8084, 1)
    end	
	
	if getPlayerStorageValue(cid, 8085) == -1 then
      setPlayerStorageValue(cid,8085, 1)
    end	
	
	if getPlayerStorageValue(cid, 8086) == -1 then
      setPlayerStorageValue(cid,8086, 1)
    end	
	
    if getPlayerLevel(cid) > actualLevel then
	doPlayerAddExperience(cid, (getExperienceForLevel(actualLevel) - getPlayerExperience(cid)))
	doCreatureAddHealth(cid, 1)
	doCreatureAddMana(cid, 1)
        -- reduce level and heal health / give mana
    end
    
    if getPlayerLevel(cid) <= actualLevel then
	doCreatureAddHealth(cid, 9999)
	doCreatureAddMana(cid, 9999)
        -- add levels
        doPlayerAddExperience(cid, (getExperienceForLevel(actualLevel) - getPlayerExperience(cid)))
    end
return true
end
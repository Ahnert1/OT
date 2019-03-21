function onDeath(cid, corpse, deathList)
    for i = 1, #deathList do
        if isPlayer(deathList[i]) then
            if getPlayerIp(cid) == getPlayerIp(deathList[i]) then
                doPlayerSendTextMessage(deathList[i], MESSAGE_STATUS_CONSOLE_BLUE, "You have not been rewarded for killing a player with the same IP.")
				db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
            else
                doPlayerAddExp(deathList[i], getPlayerExperience(cid) / 40 / #deathList)
                doPlayerAddItem(deathList[i],2148,3)
                setPlayerStorageValue(deathList[i],19999,getPlayerStorageValue(deathList[i],19999)+1)
                doPlayerSendTextMessage(deathList[i],MESSAGE_EVENT_ORANGE,"You have "..(getPlayerStorageValue(deathList[i],19999) + 1).." frags.")
                doSendMagicEffect(getThingPos(deathList[i]), 22)
                doSendAnimatedText(getCreaturePosition(deathList[i]),"FRAG!",math.random(1,255))
				db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
            end
        end
    end
	return true
end
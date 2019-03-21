function onLogout(cid)
    if isPlayer(cid) then
		local actualLevel = getPlayerStorageValue(cid,8080)
        doPlayerAddExperience(cid, (getExperienceForLevel(actualLevel) - getPlayerExperience(cid)))
        db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
        doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
    end
    return true
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
local actualLevel = getPlayerStorageValue(cid, 8080)
	if item.itemid == 5809 then
		setPlayerStorageValue(cid, 8080, actualLevel + 1)
		doPlayerAddExperience(cid, (getExperienceForLevel(actualLevel + 1) - getExperienceForLevel(actualLevel)))
		doCreatureSay(cid, "+1 Starting level!", TALKTYPE_ORANGE_1)

	end
return true
end
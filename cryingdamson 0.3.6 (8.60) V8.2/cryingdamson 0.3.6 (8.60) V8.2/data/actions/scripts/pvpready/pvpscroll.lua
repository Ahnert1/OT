local storage = 1337
local paladinitems = {2520, 5803, 2195, 2470, 2466, 2498, 2120, 2420, 5710}
local mageitems = {2323, 8871, 7730, 2195, 8902, 2520, 8922, 8910, 2420, 2120, 5710}
local knightitems = {2514, 2498, 2195, 2470, 2472, 7429, 7390, 7434, 6528, 2453, 2431}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, storage) == 1 then
		doCreatureSay(cid, "You have already proven yourself!", TALKTYPE_ORANGE_1)
	else
	if item.itemid == 5785 and getPlayerVocation(cid) == 3 then
		if getPlayerStorageValue(cid,storage) <= 0 then
			setPlayerStorageValue(cid, 8080, 80)
			doPlayerAddExperience(cid, getExperienceForLevel(80))
			setPlayerPromotionLevel(cid, 1)
			for i = 1, 75 do
				doPlayerAddSkill(cid, 4)
			end
			for x = 1, 55 do
				doPlayerAddSkill(cid, 5)
			end
			local bp = doPlayerAddItem(cid, 12621, 1)
			for j = 1, #paladinitems do
				doAddContainerItem(bp, paladinitems[j], 1)
			end
			doPlayerAddMagLevel(cid, 12)
			doSendAnimatedText(getPlayerPosition(cid), "FIGHT!", TEXTCOLOR_RED)
			doCreatureSay(cid, "CONGRATULATIONS! You have proved you are ready for PVP! Get out there and become the best!", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, storage, 1)
			doRemoveItem(item.uid, 1)
		return true
		end
	end
	if item.itemid == 5785 and getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 then
		if getPlayerStorageValue(cid,storage) <= 0 then
			setPlayerStorageValue(cid, 8080, 80)
			doPlayerAddExperience(cid, getExperienceForLevel(80))
			setPlayerPromotionLevel(cid, 1)
			doPlayerAddMagLevel(cid, 45)
			for i = 1, 5 do
				doPlayerAddSkill(cid, 5)
			end
			local bp = doPlayerAddItem(cid, 12621, 1)
			for j = 1, #mageitems do
				doAddContainerItem(bp, mageitems[j], 1)
			end
			doSendAnimatedText(getPlayerPosition(cid), "FIGHT!", TEXTCOLOR_RED)
			doCreatureSay(cid, "CONGRATULATIONS! You have proved you are ready for PVP! Get out there and become the best!", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, storage, 1)
			doRemoveItem(item.uid, 1)
		return true
		end
	end
	if item.itemid == 5785 and getPlayerVocation(cid) == 4 then
		if getPlayerStorageValue(cid,storage) <= 0 then
			setPlayerStorageValue(cid, 8080, 80)
			doPlayerAddExperience(cid, getExperienceForLevel(80))
			setPlayerPromotionLevel(cid, 1)
			for i = 1, 65 do
				doPlayerAddSkill(cid, 5)
			end
			for x = 1, 70 do
				doPlayerAddSkill(cid, 3)
			end
			for f = 1, 70 do
				doPlayerAddSkill(cid, 2)
			end
			for m = 1, 70 do
				doPlayerAddSkill(cid, 1)
			end
			local bp = doPlayerAddItem(cid, 12621, 1)
			for j = 1, #knightitems do
				doAddContainerItem(bp, knightitems[j], 1)
			end
			doSendAnimatedText(getPlayerPosition(cid), "FIGHT!", TEXTCOLOR_RED)
			doCreatureSay(cid, "CONGRATULATIONS! You have proved you are ready for PVP! Get out there and become the best!", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, storage, 1)
			doRemoveItem(item.uid, 1)
			doRemoveCreature(cid)
		return true
		end
	end
end
end
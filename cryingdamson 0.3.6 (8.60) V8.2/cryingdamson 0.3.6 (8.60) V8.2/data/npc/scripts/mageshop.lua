local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end


local function getPlayerMoney(cid)
	return ((getPlayerItemCount(cid, 2160) * 10000) +
	(getPlayerItemCount(cid, 2152) * 100) +
	getPlayerItemCount(cid, 2148))
end


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	
	local levelupprice = ((getPlayerStorageValue(cid, 8080) - 79 ) * 50)
	local mlprice = (getPlayerStorageValue(cid, 8081) * 100)
	local shieldingprice = (getPlayerStorageValue(cid, 8082) * 300)
	
	
	if (isSorcerer(cid) or isDruid(cid)) then
		if(msgcontains(msg, 'level up') or msgcontains(msg, 'lvl')) then
			selfSay('You want to buy a level up for {' .. levelupprice .. '} gold?', cid)
			talkState[talkUser] = 1
		end
		
		if (msgcontains(msg, 'prices') or msgcontains(msg, 'upgrades'))then
			selfSay('\nYour prices for your next upgrades are: \n{Level up}: ' .. levelupprice .. '\n{Magic Level:} '.. mlprice .. '\n{Shielding:} ' ..shieldingprice ,cid)
			talkState[talkUser] = 0
		end

		if(msgcontains(msg, 'magic') or msgcontains(msg, 'ml')) then
			selfSay('You want to buy a magic level for {' .. mlprice .. '} gold?', cid)
			talkState[talkUser] = 2
		end
		
		if(msgcontains(msg, 'shielding') or msgcontains(msg, 'defense')) then
			selfSay('You want to buy a shielding upgrade for {' .. shieldingprice .. '} gold?', cid)
			talkState[talkUser] = 3
		end
		
		if(msgcontains(msg, 'yes')) and (talkState[talkUser] == 3) then
			if doPlayerRemoveMoney(cid, mlprice) then
					selfSay('Thanks! Enjoy your new power!', cid)
					doCreatureSay(cid, '+1 Shielding', TALKTYPE_ORANGE_1)
					doPlayerAddSkill(cid, 5)
					setPlayerStorageValue(cid, 8082, getPlayerStorageValue(cid, 8082) + 1)
					talkState[talkUser] = 0
			else
				selfSay('You don\'t have enough money.', cid)
				talkState[talkUser] = 0
			end
		end		
		
		if(msgcontains(msg, 'yes')) and (talkState[talkUser] == 2) then
			if doPlayerRemoveMoney(cid, mlprice) then
					selfSay('Thanks! Enjoy your new power!', cid)
					doCreatureSay(cid, '+1 Magic Level!', TALKTYPE_ORANGE_1)
					doPlayerAddMagLevel(cid, 1)
					setPlayerStorageValue(cid, 8081, getPlayerStorageValue(cid, 8081) + 1)
					talkState[talkUser] = 0
			else
				selfSay('You don\'t have enough money.', cid)
				talkState[talkUser] = 0
			end
		end		
		
		if(msgcontains(msg, 'yes')) and (talkState[talkUser] == 1) then
			if doPlayerRemoveMoney(cid, levelupprice) then
					selfSay('Thanks! Enjoy your new power!', cid)
					doCreatureSay(cid, '+1 Level!', TALKTYPE_ORANGE_1)
					doPlayerAddExperience(cid, (getExperienceForLevel(getPlayerStorageValue(cid, 8080) + 1) - getExperienceForLevel(getPlayerStorageValue(cid, 8080))))
					setPlayerStorageValue(cid, 8080, getPlayerStorageValue(cid, 8080) + 1)
					talkState[talkUser] = 0
			else
				selfSay('You don\'t have enough money.', cid)
				talkState[talkUser] = 0
			end
		end
		
		if msgcontains(msg, 'no') then
			selfSay('Ok then.', cid)
			talkState[talkUser] = 0
		end
	else
		npcHandler:say("I only help the mages here, go see {Borris} the knight or {Calvon} the paladin.", cid)
		npcHandler:releaseFocus(cid)
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

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

local function greetCallback(cid)
    local firstGreet = getPlayerStorageValue(cid, 123)
    if firstGreet < 1 then
        npcHandler:setMessage(MESSAGE_GREET, "Welcome to the knight shop. This is where you will advance your character to get the upperhand on your enemies. To see your next upgrade prices say {upgrades}. To level up a skill, say {level up}, {magic level}, {shielding}, {axing}, {swording}, {clubbing}.")
		setPlayerStorageValue(cid, 123, 1)
    else
        npcHandler:setMessage(MESSAGE_GREET, "Oh, you again. Did you forget how to talk? I can {help} you.")
    end
    return true
end


function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local levelupprice = ((getPlayerStorageValue(cid, 8080) - 79 ) * 50)
	local mlprice = (getPlayerStorageValue(cid, 8081) * 750)
	local shieldingprice = (getPlayerStorageValue(cid, 8082) * 35)
	local axingprice = (getPlayerStorageValue(cid, 8085) * 25)		--AXE
	local swordingprice = (getPlayerStorageValue(cid, 8084) * 25)	--Sword
	local clubbingprice = (getPlayerStorageValue(cid, 8083) * 25)	--CLUB
	
	if (isKnight(cid)) then
		if(msgcontains(msg, 'help') or msgcontains(msg, 'job') or msgcontains(msg, 'trade') or msgcontains(msg, 'offer')) then
			selfSay('This is where you will advance your character to get the upperhand on your enemies. To see your next upgrade prices say {upgrades}. To level up a skill, say {level up}, {magic level}, {shielding}, {axing}, {swording}, {clubbing}. ', cid)
			talkState[talkUser] = 0
		end
		if(msgcontains(msg, 'level up') or msgcontains(msg, 'lvl')) then
			selfSay('You want to buy a level up for {' .. levelupprice .. '} gold?', cid)
			talkState[talkUser] = 1
		end
		
		if (msgcontains(msg, 'prices') or msgcontains(msg, 'upgrades'))then
			selfSay('\nYour prices for your next upgrades are: \n{Level up}: ' .. levelupprice .. '\n{Magic Level:} '.. mlprice .. '\n{Shielding:} ' ..shieldingprice.. '\n{Axe:} '.. axingprice ..'\n{Sword:} '.. swordingprice .. '\n{Club:} '.. clubbingprice ,cid)
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
		
		if(msgcontains(msg, 'axing') or msgcontains(msg, 'axe')) then
			selfSay('You want to buy an axing upgrade for {' .. axingprice .. '} gold?', cid)
			talkState[talkUser] = 4
		end
		
		if(msgcontains(msg, 'swording') or msgcontains(msg, 'sword')) then
			selfSay('You want to buy a swording upgrade for {' .. swordingprice .. '} gold?', cid)
			talkState[talkUser] = 5
		end
		
		if(msgcontains(msg, 'clubbing') or msgcontains(msg, 'club')) then
			selfSay('You want to buy a clubbing upgrade for {' .. clubbingprice .. '} gold?', cid)
			talkState[talkUser] = 6
		end
		
		if(msgcontains(msg, 'yes')) and (talkState[talkUser] == 4) then		--AXE
			if doPlayerRemoveMoney(cid, mlprice) then
					selfSay('Thanks! Enjoy your new power!', cid)
					doCreatureSay(cid, '+1 Axe Fighting', TALKTYPE_ORANGE_1)
					doPlayerAddSkill(cid, 3)
					setPlayerStorageValue(cid, 8085, getPlayerStorageValue(cid, 8085) + 1)
					talkState[talkUser] = 0
			else
				selfSay('You don\'t have enough money.', cid)
				talkState[talkUser] = 0
			end
		end
		
		if(msgcontains(msg, 'yes')) and (talkState[talkUser] == 5) then		--SWORD
			if doPlayerRemoveMoney(cid, mlprice) then
					selfSay('Thanks! Enjoy your new power!', cid)
					doCreatureSay(cid, '+1 Sword Fighting', TALKTYPE_ORANGE_1)
					doPlayerAddSkill(cid, 2)
					setPlayerStorageValue(cid, 8084, getPlayerStorageValue(cid, 8084) + 1)
					talkState[talkUser] = 0
			else
				selfSay('You don\'t have enough money.', cid)
				talkState[talkUser] = 0
			end
		end
		
		if(msgcontains(msg, 'yes')) and (talkState[talkUser] == 6) then		--CLUB
			if doPlayerRemoveMoney(cid, mlprice) then
					selfSay('Thanks! Enjoy your new power!', cid)
					doCreatureSay(cid, '+1 Club Fighting', TALKTYPE_ORANGE_1)
					doPlayerAddSkill(cid, 1)
					setPlayerStorageValue(cid, 8083, getPlayerStorageValue(cid, 8083) + 1)
					talkState[talkUser] = 0
			else
				selfSay('You don\'t have enough money.', cid)
				talkState[talkUser] = 0
			end
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
		npcHandler:say("I only help the warriors here, go see {Bealda} the mage or {Calvo} the paladin.", cid)
		npcHandler:releaseFocus(cid)
	end
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())

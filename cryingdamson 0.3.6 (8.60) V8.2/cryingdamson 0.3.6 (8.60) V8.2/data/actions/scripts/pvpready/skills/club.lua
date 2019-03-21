function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerLevel(cid) >= 8 then
        doCreatureSay(cid, '+1 Club Fighting!', TALKTYPE_ORANGE_1)
        doPlayerAddSkill(cid, 1)  --doPlayerAddSkill(cid, SKILLTYPE) for axing etc. 0-7
        doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)

        return true
    end
end
 
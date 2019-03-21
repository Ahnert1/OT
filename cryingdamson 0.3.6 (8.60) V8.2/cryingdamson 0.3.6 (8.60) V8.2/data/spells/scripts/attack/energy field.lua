local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1495)

local spellStorageID = 65300
function onCastSpell(cid, var)
    if(exhaustion.check(cid, spellStorageID)) then
        doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getPlayerPosition(cid),2)
        return false
    end
    return doCombat(cid, combat, var) and (exhaustion.set(cid, spellStorageID, 1.5) or true)
end
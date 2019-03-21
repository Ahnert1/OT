local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -15, 5, 5, 1.8, 3, -20, -40)

local spellStorageID = 65300
function onCastSpell(cid, var)
    if(exhaustion.check(cid, spellStorageID)) then
        doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getPlayerPosition(cid),2)
        return false
    end
    return doCombat(cid, combat, var) and (exhaustion.set(cid, spellStorageID, 1.5) or true)
end
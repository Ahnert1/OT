local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 5, 5, 4, 7)

local spellStorageID = 65300
function onCastSpell(cid, var)
    if(exhaustion.check(cid, spellStorageID)) then
        doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getPlayerPosition(cid),2)
        return false
    end
    return doCombat(cid, combat, var) and (exhaustion.set(cid, spellStorageID, 1.5) or true)
end
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 3)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 0, 4.8)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

local spellStorageID = 65300
function onCastSpell(cid, var)
    if(exhaustion.check(cid, spellStorageID)) then
        doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getPlayerPosition(cid),2)
        return false
    end
    return doCombat(cid, combat, var) and (exhaustion.set(cid, spellStorageID, 1.5) or true)
end
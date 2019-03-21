local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local skillTotal, levelTotal = skill + attack, level / 5
	return -(skillTotal * 0.5 + levelTotal), -(skillTotal * 1.1 + levelTotal)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
local spellStorageID = 65300
function onCastSpell(cid, var)
    if(exhaustion.check(cid, spellStorageID)) then
        doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getPlayerPosition(cid),2)
        return false
    end
    return doCombat(cid, combat, var) and (exhaustion.set(cid, spellStorageID, 1.5) or true)
end
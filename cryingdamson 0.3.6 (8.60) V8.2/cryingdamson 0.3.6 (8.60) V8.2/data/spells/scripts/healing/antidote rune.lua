local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_POISON)

local spellStorageID = 65300
function onCastSpell(cid, var)
    if(exhaustion.check(cid, spellStorageID)) then
        doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getPlayerPosition(cid),2)
        return false
    end
    return doCombat(cid, combat, var) and (exhaustion.set(cid, spellStorageID, 1.5) or true)
end
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onTargetCreature(cid, target) return doChallengeCreature(cid, target) end
setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spellStorageID = 65300
function onCastSpell(cid, var)
    if(exhaustion.check(cid, spellStorageID)) then
        doPlayerSendCancel(cid, "You are exhausted.")
		doSendMagicEffect(getPlayerPosition(cid),2)
        return false
    end
    return doCombat(cid, combat, var) and (exhaustion.set(cid, spellStorageID, 1.5) or true)
end
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onGetFormulaValues(player, level, maglevel)--[[
	local min = (level / 5) + (maglevel * 1.8) + 12
	local max = (level / 5) + (maglevel * 3) + 17]]--
	local min = (((maglevel/9) * (maglevel/9))*2.2) + (level / 3)
	local max = (((maglevel/9) * (maglevel/9))*3) + (level / 3)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

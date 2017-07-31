local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STONES)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

function onGetFormulaValues(player, level, maglevel)
	--local min = (level / 5) + (maglevel * 0.8) + 5
	--local max = (level / 5) + (maglevel * 1.6) + 10
	local min = (((maglevel/9) * (maglevel/10))*1) + (level / 3)
	local max = (((maglevel/9) * (maglevel/10))*1.8) + (level / 3)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

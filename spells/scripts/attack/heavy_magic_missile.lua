local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, maglevel)
	--local min = (level / 5) + (maglevel * 0.8) + 5
	--local max = (level / 5) + (maglevel * 1.6) + 10
	local min = (((maglevel/9) * (maglevel/10))*1.1) + (level / 3)
	local max = (((maglevel/9) * (maglevel/10))*1.6) + (level / 3)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

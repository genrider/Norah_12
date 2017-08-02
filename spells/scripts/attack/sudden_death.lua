local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues(player, level, maglevel)
	--local min = (level / 5) + (maglevel * 4.3) + 32
	--local max = (level / 5) + (maglevel * 7.4) + 48
	local min = (((maglevel/9) * (maglevel/9))*5.4) + (level / 3)
	local max = (((maglevel/9) * (maglevel/9))*7.4) + (level / 3)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

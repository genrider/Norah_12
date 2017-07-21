local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 50000)
condition:setFormula(0.7, -56, 0.7, -56)
combat:setCondition(condition)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addCondition(condition)
	item:remove(1)
	return true
end
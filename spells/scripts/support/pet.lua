function onCastSpell(creature, variant)
		
	vocationid = creature:getVocation():getId()
	        if vocationid == 1 or vocationid == 5 then
				pet = "Thundergiant"
			elseif vocationid == 2 or vocationid == 6 then
				pet = "Grovebeast"
			elseif vocationid == 3 or vocationid == 7 then
				pet = "Emberwing"
			elseif vocationid == 4 or vocationid == 8 then
				pet = "Skullfrost"
    end
	local monsterType = MonsterType(pet)
	
		if not monsterType:isPet() then
			creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			
		if #creature:getSummons() >= 1 then
			creature:sendCancelMessage("You cannot summon more creatures.")
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end
	end


	local position = creature:getPosition()
	local summonpet = Game.createMonster(pet, position, true)
	if not summonpet then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	creature:addSummon(summonpet)
	position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	
	function removepet(summonpet)
    doRemoveCreature(summonpet)
    end
	addEvent(removepet, 15*60*1000, summonpet.uid)
	return true
	
end
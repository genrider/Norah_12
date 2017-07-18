local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	-- GRAD GÓRA
local player = Player(cid)
	if msgcontains(msg, "surroundings") then
		npcHandler:say("In the surroundings you can find {goblin}, {troll}, {arena}, {nilfgaard} and other.", cid)
		return true
	elseif msgcontains(msg, "cyclop") or msgcontains(msg, "minotaur") or msgcontains(msg, "elf") then
		npcHandler:say("I don't know, ask {Dromel}", cid)
		return true
	elseif msgcontains(msg, "lizard") or msgcontains(msg, "hydra") or msgcontains(msg, "mutated human") then
		npcHandler:say("I don't know, ask {Pusten}", cid)
		return true
	elseif msgcontains(msg, "dwarf") or msgcontains(msg, "nightmare") or msgcontains(msg, "werewolf") or msgcontains(msg, "udead dragon") or msgcontains(msg,"serpent spawn") then
		npcHandler:say("I don\'t know where they are, but if think, that {Morila}", cid)
		return true
		
		
		
	elseif msgcontains(msg, "goblin") then
	--	npcHandler:say("ich oboz znajduje się na pagórku na wprost bramy", cid)
 npcHandler:say("Their camp is located on the hill in front of the gate.", cid)
		return true	
	elseif msgcontains(msg, "troll") then
--		npcHandler:say("idąc drogą na zachód natrafisz na zejście w podziemiach, tam są trolle", cid)
 npcHandler:say("Walking down the road heading west, you'll find a way to the underground, trolls are there.", cid)
		return true	
	elseif msgcontains(msg, "arena") then
	--	npcHandler:say("by móc walczyc jako gladiator na arenach i dostac specjalne nagrody udaj sie na polnocny wschod wzdrol drogi, po lewej stronie drogi znajdziesz duza górę w której mieści się arena", cid)
 npcHandler:say("To fight as a gladiator and gain special awards, head north-east along the road, you'll find an enormous mountain, inside which arena is, on the left side of the road.", cid)
		return true
	elseif msgcontains(msg, "nilfgaard") then
	--	npcHandler:say("By dotrzeć do tego miasta udaj się na północny zachód od pont vanis", cid)
 npcHandler:say("To get to the city from Pont Vanis, head north-west.", cid)
		return true
	elseif msgcontains(msg, "ghoul") or msgcontains(msg, "vampire") then
	--	npcHandler:say("idz za droga na polnocny wschód, gdy dotrzesz do dużej góry na północy skieruj się na wschód do kolejnej góry", cid)
 npcHandler:say("Follow the road heading north-east, when you get to the big mountain on the north, head east to the next mountain.", cid)
		return true
	
	
	
	elseif msgcontains(msg, "Dromel") then
		npcHandler:say("His house is located near east city gate.", cid)
		return true
	elseif msgcontains(msg, "Pusten") then
		npcHandler:say("His house is located near west city gate.", cid)
		return true
	elseif msgcontains(msg, "Morila") then
		npcHandler:say("His house is located near south city gate.", cid)
		return true
		
		
	elseif msgcontains(msg, "stampor") then
		npcHandler:say("Bring me 30 Hollow Stampor Hoof, 50 Stampor Horn and 100 Stampor Talons. Have you got it?",cid)
		npcHandler.topic[cid] = 1
		return true
	elseif msgcontains(msg, "yes") then
		if player:hasMount(11) then
			player:say('You already have a Stampor', TALKTYPE_MONSTER_SAY)
			return true
		end
		if npcHandler.topic[cid] == 1 then
			if getPlayerItemCount(cid,13301) >= 30 and getPlayerItemCount(cid,13299) >=50 and getPlayerItemCount(cid,13300) >=100 then
				player:removeItem(13301, 30)
				player:removeItem(13299, 50)
				player:removeItem(13300, 100)
				npcHandler:say("There is your private stampor", cid)
				player:addMount(11)
			else
				npcHandler:say("You do not have so many items.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end	
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
--npcHandler:setMessage(MESSAGE_GREET, "Witaj wedrowcze, w czym ci moge pomoc?. Meaby, you want hear about {surroundings}.")
 npcHandler:setMessage(MESSAGE_GREET, "Hello wanderer, how can I help you? Maybe you want to hear about {surroundings}.")
npcHandler:addModule(FocusModule:new())  
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
		npcHandler:say("In the surroundings you can find {goblin}, {troll}, {arena}, {nilfgaard} and other.")
		return true
	elseif msgcontains(msg, "cyclops") or msgcontains(msg, "minotaurs") or msgcontains(msg, "elfs") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Dromel}", cid)
		return true
	elseif msgcontains(msg, "lizard") or msgcontains(msg, "hydra") or msgcontains(msg, "mutated human") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Pusten}", cid)
		return true
	elseif msgcontains(msg, "dwarf") or msgcontains(msg, "nightmare") or msgcontains(msg, "werewolf") or msgcontains(msg, "udead dragon") or msgcontains(msg,"serpent spawn") then
		npcHandler:say("I don\'t know where they are, but if think, that {Morila}", cid)
		return true
		
		
		
	elseif msgcontains(msg, "goblin") then
		npcHandler:say("ich oboz znajduje się na pagórku na wprost bramy", cid)
		return true	
	elseif msgcontains(msg, "troll") then
		npcHandler:say("idąc drogą na zachód natrafisz na zejście w podziemiach, tam są trolle", cid)
		return true	
	elseif msgcontains(msg, "arena") then
		npcHandler:say("by móc walczyc jako gladiator na arenach i dostac specjalne nagrody udaj sie na polnocny wschod wzdrol drogi, po lewej stronie drogi znajdziesz duza górę w której mieści się arena", cid)
		return true
	elseif msgcontains(msg, "nilfgaard") then
		npcHandler:say("By dotrzeć do tego miasta udaj się na północny zachód od pont vanis", cid)
		return true
	elseif msgcontains(msg, "ghoul") or msgcontains(msg, "vampire") then
		npcHandler:say("idz za droga na polnocny wschód, gdy dotrzesz do dużej góry na północy skieruj się na wschód do kolejnej góry", cid)
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
	end	
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Witaj wedrowcze, w czym ci moge pomoc?. Meaby, you want hear about {surroundings}.")
npcHandler:addModule(FocusModule:new())  
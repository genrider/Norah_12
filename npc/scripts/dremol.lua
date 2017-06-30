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
	-- DREMOL Prawo
local player = Player(cid)
	if msgcontains(msg, "surroundings") then
		npcHandler:say("In the surroundings you can find {smugglers}, {minotaurs}, {cyclops}, {dragons} and other.")
		return true
	elseif msgcontains(msg, "dwarf") or msgcontains(msg, "nightmare") or msgcontains(msg, "werewolf") or msgcontains(msg, "udead dragon") or msgcontains(msg,"serpent spawn") then
		npcHandler:say("I don\'t know where they are, but if think, that {Morila}", cid)
		return true
	elseif msgcontains(msg, "goblins") or msgcontains(msg, "trolls") or msgcontains(msg, "arena") or msgcontains(msg, "nilfgaard") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Grad}", cid)
		return true
	elseif msgcontains(msg, "lizard") or msgcontains(msg, "hydra") or msgcontains(msg, "mutated human") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Pusten}", cid)
		return true
		
		
		
	elseif msgcontains(msg, "dragon") then
		npcHandler:say("Dragons occupy the mountain in front of the bridge. Be carefull, on highter parts of the mountain you will meet Dragon Lords.", cid)
		return true
	elseif msgcontains(msg, "smuggler") or msgcontains(msg, "bandit") or msgcontains(msg, "wild warrior") then
		npcHandler:say("They are just in front of the bridge", cid)
		return true
	elseif msgcontains(msg, "cyclop") then
		npcHandler:say("Hmm cyclops... One-eyed, big, muscular giants. They lives in south part of mountains in front of bridge. They have two camps.", cid)
		return true
	elseif msgcontains(msg, "minotaur") then
		npcHandler:say("Ugh! Stinking cows resembling people, live along the river. At once, when you left the bridge just head north. I hear that they hide a special knife, what help you rip their skin.", cid)
		return true
	elseif msgcontains(msg, "bonebeast") or msgcontains(msg, "gargoyle") then
		npcHandler:say("idz wzdluz rzeki na poludnie, znajdz jaskienie z skeletonami i wsrod nich znajdz zejscie nizej",cid)
		return true
	elseif msgcontains(msg, "zombie") then
		npcHandler:say("przejdz przez oboz bandytow kierunjac sie na góry, znajdziesz tam mały budynek z schodami w dół",cid)
	
	
	elseif msgcontains(msg, "Morila") then
		npcHandler:say("His house is located near south city gate.", cid)
		return true
	elseif msgcontains(msg, "Pusten") then
		npcHandler:say("His house is located near west city gate.", cid)
		return true
	elseif msgcontains(msg, "Grad") then
		npcHandler:say("His house is located near north city gate.", cid)
		return true
		
		
	elseif msgcontains(msg, "your trophy") then
		npcHandler:say("Fuck off! Never come here again!", cid)	
		return true
	
	elseif msgcontains(msg, "pannier backpack") then
		npcHandler:say("Bring me 100 {fern} and 50 {bamboo stick}. Have you got it?",cid)
		npcHandler.topic[cid] = 1
		return true
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if getPlayerItemCount(cid,2801) >= 100 and getPlayerItemCount(cid,12401) >=50 then
				player:removeItem(2801, 100)
				player:removeItem(12401, 50)
				npcHandler:say("There is your pannier backpack", cid)
				player:addItem(21475, 1)
			else
				npcHandler:say("You do not have so many items.", cid)
			end
		end
	end	
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hi, what brigs you here? Want to know something about monsters? Say who you are interested in? Meaby, you want hear about {surroundings}.")
npcHandler:addModule(FocusModule:new())  
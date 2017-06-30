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
	-- MORILA DÓŁ
local player = Player(cid)
	if msgcontains(msg, "surroundings") then
		npcHandler:say("In the surroundings you can find {dwarfs}, {dragons}, {dragon lords}, {nightmares}, {tarantulas} and other.")
		return true
	elseif msgcontains(msg, "cyclops") or msgcontains(msg, "minotaurs") or msgcontains(msg, "elfs") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Dromel}", cid)
		return true
	elseif msgcontains(msg, "goblins") or msgcontains(msg, "trolls") or msgcontains(msg, "arena") or msgcontains(msg, "nilfgaard") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Grad}", cid)
		return true
	elseif msgcontains(msg, "lizard") or msgcontains(msg, "hydra") or msgcontains(msg, "mutated human") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Pusten}", cid)
		return true
		
		
		
	elseif msgcontains(msg, "dwarfs") then
		npcHandler:say("idz na poludnie, dotrzesz do gory. podążaj wzdłóż niej na zachód a dotrzesz do schodów które doprowadza cię do celu, bądż uważny możesz trafić na ich potężnych przodków", cid)
		return true
	elseif msgcontains(msg, "dragon lord") then
		npcHandler:say("w poludniowych gorach w wyzszych partiach i podziemiach znajdziesz duzo tych potworow", cid)
		return true
	elseif msgcontains(msg, "dragon") then
		npcHandler:say("na nizszych partiach poludniowych gór spotkasz ich wiele", cid)
		return true
	elseif msgcontains(msg, "nightmare") then
		npcHandler:say("musisz przedostac sie przez smoki na poludniowej gorze i dotrzec do mostu w ich wschodniej części", cid)
		return true
	elseif msgcontains(msg, "tarantulas") then
		npcHandler:say("idz wzdłóż południowej góry na zachód aż dotrzesz do końca londu", cid)
		return true
	elseif msgcontains(msg, "serpent spawn") or msgcontains(msg, "giant spider") or msgcontains(msg, "medusa") then
		npcHandler:say("gdy tylko miniesz brame miasta skierój się na wschód, dotrzesz do małej górki z zejściem pod nią, tam znajdziesz te potwory", cid)
		return true
	elseif msgcontains(msg, "pits of inferno") then
		npcHandler:say("w poludniowej gorze znajdziesz zejscie w podziemia, kieruj się coraz głębiej wśród dragon lors a dotrzesz do celu", cid)
		return true
	elseif msgcontains(msg, "smuggler") or msgcontains(msg, "bandit") or msgcontains(msg, "wild warrior") then
		npcHandler:say("gdy tylko opuscisz mury, natkniesz sie na nie", cid)
		return true
	
	
	elseif msgcontains(msg, "Dromel") then
		npcHandler:say("His house is located near east city gate.", cid)
		return true
	elseif msgcontains(msg, "Pusten") then
		npcHandler:say("His house is located near west city gate.", cid)
		return true
	elseif msgcontains(msg, "Grad") then
		npcHandler:say("His house is located near north city gate.", cid)
	
	end	
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Witaj wedrowcze, w czym ci moge pomoc?. Meaby, you want hear about {surroundings}.")
npcHandler:addModule(FocusModule:new())  
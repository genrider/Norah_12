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
	-- PUSTEN PRAWO
local player = Player(cid)
	if msgcontains(msg, "surroundings") then
		npcHandler:say("In the surroundings you can find {lizards}, {mutated humans}, {cyclops}, {hydras} and other.")
		return true
	elseif msgcontains(msg, "dragon") or msgcontains(msg, "minotaurs") or msgcontains(msg, "elfs") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Dromel}", cid)
		return true
	elseif msgcontains(msg, "goblins") or msgcontains(msg, "trolls") or msgcontains(msg, "arena") or msgcontains(msg, "nilfgaard") then
		npcHandler:say("nie wiem, zapytaj goscia o imieniu {Grad}", cid)
		return true
	elseif msgcontains(msg, "dwarf") or msgcontains(msg, "nightmare") or msgcontains(msg, "werewolf") or msgcontains(msg, "undead dragon") or msgcontains(msg,"serpent spawn") then
		npcHandler:say("I don\'t know where they are, but if think, that {Morila}", cid)
		return true
		
		
		
	elseif msgcontains(msg, "lizard") then
		npcHandler:say("idz za drogą w kierunku zachodu aż dotrzesz do schodów prowadzących do wielkiego obozu lizardów high class", cid)
		return true
	elseif msgcontains(msg, "mutated human") then
		npcHandler:say("idz na południowy zachód od miasta a dotrzesz do celu", cid)
		return true
	elseif msgcontains(msg, "cyclops") then
		npcHandler:say("na poczatku zachodnich gor znajdziesz wejscie do nich", cid)
		return true
	elseif msgcontains(msg, "hydra") then
		npcHandler:say("znajdziesz je w gorach pomiedzy cyclopami a lizardami", cid)
		return true
	elseif msgcontains(msg, "stronghold") then
		npcHandler:say("zabudowa wraz z ogromnymi podziemiami skrywajacymi najwikesze niebezpieczenstwa tego swiata, znajduje sie na wschód od miast poniżej gór", cid)
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
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
		npcHandler:say("In the surroundings you can find {dwarfs}, {dragons}, {dragon lords}, {nightmares}, {tarantulas} and other.", cid)
		return true
	elseif msgcontains(msg, "cyclop") or msgcontains(msg, "minotaur") or msgcontains(msg, "elf") then
		npcHandler:say("I don't know, ask {Dromel}", cid)
		return true
	elseif msgcontains(msg, "goblin") or msgcontains(msg, "troll") or msgcontains(msg, "arena") or msgcontains(msg, "nilfgaard") then
		npcHandler:say("I don't know, ask {Grad}", cid)
		return true
	elseif msgcontains(msg, "lizard") or msgcontains(msg, "hydra") or msgcontains(msg, "mutated human") then
		npcHandler:say("I don't know, ask {Pusten}", cid)
		return true
		
		
		
	elseif msgcontains(msg, "dwarf") then
	--	npcHandler:say("idz na poludnie, dotrzesz do gory. podążaj wzdłóż niej na zachód a dotrzesz do schodów które doprowadza cię do celu, bądż uważny możesz trafić na ich potężnych przodków", cid)
 npcHandler:say("Head south, you'll get to the mountain. Follow along it heading west until you find stairs - they will lead you to your target. Be careful, you may find its powerful ancestors.", cid)
		return true
	elseif msgcontains(msg, "dragon lord") then
	--	npcHandler:say("w poludniowych gorach w wyzszych partiach i podziemiach znajdziesz duzo tych potworow", cid)
 npcHandler:say("In the southern mountains in the upper parts, but also in the underground, you'll find a lot of these monsters.", cid)
		return true
	elseif msgcontains(msg, "dragon") then
--		npcHandler:say("na nizszych partiach poludniowych gór spotkasz ich wiele", cid)
 npcHandler:say("In the lower parts of the southern mountains you'll find a lot of them.", cid)
		return true
	elseif msgcontains(msg, "nightmare") then
--		npcHandler:say("musisz przedostac sie przez smoki na poludniowej gorze i dotrzec do mostu w ich wschodniej części", cid)
 npcHandler:say("You have to pass through the dragons on the southern hill and get to the brigde in the eastern part.", cid)
		return true
	elseif msgcontains(msg, "tarantula") then
	--	npcHandler:say("idz wzdłóż południowej góry na zachód aż dotrzesz do końca londu", cid)
 npcHandler:say("Go along the southern mountain heading west till you get to the end of the land.", cid)
		return true
	elseif msgcontains(msg, "serpent spawn") or msgcontains(msg, "giant spider") or msgcontains(msg, "medusa") then
--		npcHandler:say("gdy tylko miniesz brame miasta skierój się na wschód, dotrzesz do małej górki z zejściem pod nią, tam znajdziesz te potwory", cid)
 npcHandler:say("Right after you pass the gate, head east - you'll get to the small mountain with the descent. There you'll find the monsters.", cid)
		return true
	elseif msgcontains(msg, "pits of inferno") then
--		npcHandler:say("w poludniowej gorze znajdziesz zejscie w podziemia, kieruj się coraz głębiej wśród dragon lors a dotrzesz do celu", cid)
 npcHandler:say("In the southern mountain you'll find a way down to the underground - go deeper and deeper among the dragon lords till you hit your target.", cid)
		return true
	elseif msgcontains(msg, "smuggler") or msgcontains(msg, "bandit") or msgcontains(msg, "wild warrior") then
--		npcHandler:say("gdy tylko opuscisz mury, natkniesz sie na nie", cid)
 npcHandler:say("Right after you leave the walls, you'll come across them.", cid)
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
npcHandler:setMessage(MESSAGE_GREET, "Hello wanderer, how I can help you?. Maybe, you want to hear about {surroundings}.")
npcHandler:addModule(FocusModule:new())  
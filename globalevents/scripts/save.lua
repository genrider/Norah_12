function onThink(interval)
	--saveServer()
	doBroadcastMessage("Server save within 60 seconds!")
	addEvent(executeSave, 60000)
	return true
end

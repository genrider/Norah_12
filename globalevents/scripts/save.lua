function onThink(interval)
	--saveServer()
	BroadcastMessage("Server save within 30 seconds!", MESSAGE_STATUS_WARNIN)
	addEvent(saveServer, 30000)
	return true
end

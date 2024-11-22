printTbl = {
	modName = g_currentModName
}

function printTbl:loadMap(name)
	getmetatable(_G).__index[printTbl.modName].loadstring = nil
	addConsoleCommand("_gsPrintTable", "", "consoleCommandPrintTable", self)
end

function printTbl:deleteMap()
	removeConsoleCommand("_gsPrintTable")
end

function printTbl:consoleCommandPrintTable(inputTable, depth, maxDepth)
	if inputTable ~= nil then
		depth = depth or 0
		maxDepth = maxDepth or 0

		print("")
		print("")
		print("")
		print("===================================================")
		loadstring(string.format("DebugUtil.printTableRecursively(%s, '-', %d ,%d)", inputTable, depth, maxDepth))()
		print("===================================================")
	else
		return "Usage: _gsPrintTable <table> <depth> <maxDepth>"
	end
end

addModEventListener(printTbl)
-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--DIFFERENT

local json = require( "json" )
 
local dataTable = {}
 
local filePath = system.pathForFile( "dialog.json", system.DocumentsDirectory ) 	--Specify path of interaction

local contents

local function loadData()
 
    local file = io.open( filePath, "r" )
 
    if file then
        print(" File Exists! ")
        contents = file:read( "*a" )
        io.close( file )
        dataTable = json.decode( contents )
    else
        print(" File Does Not Exist! ")
    end
end

loadData() 		-- Function Call

local jsonData = json.encode(dataTable)
print(jsonData)


local Dialogue = json.decode(jsonData)
print(Dialogue.Kamali[3])
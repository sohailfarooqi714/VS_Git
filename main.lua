-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

--DIFFERENT

--[[local dialogues = { "String1", "String2" } --Initilize table of array
for i = 1, 10 do
    dialogues[i] = " "
    print ( dialogues [i] )
end ]]

--Read Contents

-- Path for the file to read
--[[local path = system.pathForFile("hello.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    print( "Contents of " .. path .. "\n" .. contents )
    -- Close the file handle
    io.close( file )
end
 
file = nil]]

--Recognize File


local path = system.pathForFile("hello.txt", system.DocumentsDirectory )
local fhd = io.open( path )
  
-- Determine if file exists
if fhd then
   print( "File exists" )
   fhd:close()
else
    print( "File does not exist!" )
end

local path = system.pathForFile( nil, system.DocumentsDirectory )
print( path )
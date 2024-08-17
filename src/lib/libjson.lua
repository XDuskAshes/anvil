--[[
   Copyright 2024 XDuskAshes & Anvil Contributor(s)

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
]]

--[[
    Description: A JSON parser lib. Contains functions primarily for getting specific data.
    Contributor: XDuskAshes
    Part of the Anvil toolkit for ComputerCraft. <https://github.com/XDuskAshes/anvil/>
]]

local core = require("/src/anvilcore") -- Change as needed.

local ljson = {}

-- Open a JSON file and return the contents.
-- Returns boolean false or a string.
function ljson.unserializeFromFile(file)
    if not fs.exists(shell.resolve(file)) then
        return false
    elseif core.isEmpty(file) then
        return false
    end

    local handle = fs.open(shell.resolve(file),"r")
    local data = textutils.unserialiseJSON(handle.readAll())
    handle.close()
    return data
end

-- Opens a JSON file and returns a specific data point.
-- Returns a boolean false or the value of the data requested.
function ljson.dataFromFile(file,data)
    if not fs.exists(shell.resolve(file)) then
        return false
    elseif core.isEmpty(file) or core.isEmpty(data) then
        return false
    end

    local rawData = ljson.unserializeFromFile(file) -- Using functions in the file for clarity and code repetition reduction. ~ Dusk, Aug. 2024
    if not type(rawData) == "table" then
        return false
    end
    
    return rawData[data] -- "Need check nil" - But it works? ~ Dusk, Aug. 2024
end

return ljson
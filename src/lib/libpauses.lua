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
    Description: A collection of pauses for things such as yes/no, "Press any key to continue", etc.
    Contributor: XDuskAshes
    Part of the Anvil toolkit for ComputerCraft. <https://github.com/XDuskAshes/anvil/>
]]

local core = require("/src/anvilcore") -- Change as needed.

local anvilPauses = {}

-- Wait for any keypress before continuing.
function anvilPauses.waitForAny()
    print("Press any key to continue...")
    while true do
        local event = {os.pullEvent()}

        if event[1] == "key" then
            break
        end
    end
end

-- Wait for a specific key before continuing.
function anvilPauses.waitForKey(whatKey)
    local keyName = keys.getName(whatKey)

    print("Press "..keyName.." to continue...")
    while true do
        local event = {os.pullEvent()}

        if event[1] == "key" and event[2] == whatKey then
            break
        end
    end
end

return anvilPauses
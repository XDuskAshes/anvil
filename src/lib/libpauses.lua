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
-- No parameters.
function anvilPauses.waitForAny(prompt)
    if core.isEmpty(prompt) then
        print("Press any key to continue...")
    else
        print(prompt)
    end

    while true do
        local event = {os.pullEvent()}

        if event[1] == "key" then
            break
        end
    end
end

-- Wait for a specific key before continuing.
-- Only parameter is "whatKey", being the key to wait for.
-- Any key under "keys" is fair game, like keys.space
function anvilPauses.waitForKey(whatKey)
    if core.isEmpty(whatKey) then
        return false
    end

    local keyName = keys.getName(whatKey)

    print("Press "..keyName.." to continue...")
    while true do
        local event = {os.pullEvent()}

        if event[1] == "key" and event[2] == whatKey then
            break
        end
    end
end

-- Y/N prompt.
-- Only parameter is "prompt", being what text to display.
-- Returns true or false.
function anvilPauses.promptYesOrNo(prompt)
    if core.isEmpty(prompt) then
        write("[Y/N]: ")
    else
        write(prompt.." [Y/N]: ")
    end

    while true do
        local event = {os.pullEvent()}
    
        if event[1] == "key" then
            if event[2] == keys.y then
                print("Y")
                return true
            elseif event[2] == keys.n then
                print("N")
                return false
            end
        end
    end
end

-- Just a prompt for up to 30 seconds. Glorified and slightly neutered "sleep()".
-- One parameter, an amount of seconds up to 30.
function anvilPauses.pauseFor(seconds)
    if seconds > 30 then
        print("Waiting for 30 seconds...")
        sleep(30)
    else
        print("Waiting for "..seconds.." seconds...")
        sleep(seconds)
    end
end

return anvilPauses
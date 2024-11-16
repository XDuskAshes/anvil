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
    Description: A core file to hold common functions for Anvil.
    Contributor: XDuskAshes
    Part of the Anvil toolkit for ComputerCraft. <https://github.com/XDuskAshes/anvil/>
]]

--[[
    VERY SPECIFIC DEVELOPER INSTRUCTIONS FOR THIS FILE!!!1!1!1!!!!!
    ( These are mentioned in /resources/doc/anvilcore-instructions.txt )
    
    This file is to be modified only in these cases:

    1. Rewrites or tweaks of functions that make them better.
    2. New functions to improve the core.

    Don't add things Anvil doesn't need.
]]

local core = {}

core.anvilVer = "1.0a"

-- Check if any item is empty, such as a variable.
-- @param item any The thing to check for emptiness.
-- @return boolean If 'item' is empty or not.
-- @return any The type of 'item' if not empty.
function core.isEmpty(item)
    local itemType = type(item)

    if itemType == "nil" then
        return true
    else
        return false, itemType
    end
end

-- xpcall() wrapper. Because safely calling functions is cool.
-- @param func function What function to call.
-- @param args table (optional) Table of args to pass to the function.
-- @return boolean True if success, false if error.
-- @return any Returns the output of the function or the error message.
function core.safeCall(func,args)
    if not type(func) == "function" then
        return false, "[anvil]: cannot safeCall "..func..": not a function"
    end

    local function errorHandle(errormsg)
        return false, "[anvil]: exec error: "..errormsg
    end

    local status, result = xpcall(function() return func(table.unpack(args or {})) end, errorHandle)
    return status, result
end

return core
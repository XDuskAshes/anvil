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
    Description: A file for testing Anvil. This file should only be run within the repo, as it assumes such structure.
    Contributor: XDuskAshes
    Part of the Anvil toolkit for ComputerCraft. <https://github.com/XDuskAshes/anvil/>
]]

local libjson = require("/src/lib/libjson")
local libpauses = require("/src/lib/libpauses")

-- Testing libpauses. Latest change: 08/10/2024

libpauses.waitForAny()
libpauses.waitForKey(keys.space)

-- Testing libjson. Latest change: 08/10/2024

local jsonFileName = "Bob.json" -- Any JSON in /src/tools/json_examples/ ~ Dusk, Aug. 2024
local dataToGet = "Name" -- Any data in the JSON file above. ~ Dusk, Aug. 2024
local jsonFile = "/"..shell.resolve("json_examples/"..jsonFileName) -- Needs the "/" preface. Possible issue with libjson, not sure. ~ Dusk, Aug. 2024

local rawData = libjson.unserializeFromFile(jsonFile)
print(rawData)
local dataPoint = libjson.dataFromFile(jsonFile,dataToGet)
print(dataPoint)
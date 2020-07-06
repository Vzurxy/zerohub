--Assert checks
assert(isfolder)
assert(listfiles)
assert(newcclosure)
assert(loadfile)
assert(loadstring)
assert(game.HttpGet)
--Variables
local http = game:GetService("HttpService")
local dependency_folder = "dependencies/";
local url = "https://raw.githubusercontent.com/Vzurxy/zerohub/master/dependencies/packages.json"
local packages = http:JSONDecode(game:HttpGet(url));
--Initialization
if isfolder(dependency_folder) then
    for i,v in pairs(listfiles(dependency_folder)) do
        --print("Found package", v:match(dependency_folder .. "(%w+).%w+$"), "in local storage.")
        packages[v:match(dependency_folder .. "(%w+).%w+$")] = "local"
    end
end
--Main function definition
getgenv().import = function(package) --Can't wrap it in a c closure..
    --Error handling.
    if type(package) ~= "string" then error("bad argument #1 to 'import' (string expected, got " .. type(package) .. ")") end
    if not packages[package] then error("Invalid package") end
    --If the function has already been loaded, calls the function in memory.
    if type(packages[package]) == "function" then
        --print("Loading package",package,"from memory.")
        return packages[package]()
    elseif packages[package] == "local" then --If the file is already locally stored, loads the file from local storage.
        --print("Loading package", package, "from local storage.")
        packages[package] = loadfile(dependency_folder..package..".lua")
        return packages[package]()
    else --Loads the package from the interwebs.
        --print("Loading package", package, "from the web.")
        local err, ret = pcall(game.HttpGet, game.HttpGet, packages[package])
        if not err then error("Couldn't fetch the package.") end
        return loadstring(ret)()
    end
end

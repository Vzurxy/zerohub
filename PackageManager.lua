--Assert checks.
assert(isfolder);
assert(listfiles);
assert(newcclosure);
assert(loadfile);
assert(loadstring);
assert(game.HttpGet);
--Variables.
local http = game:GetService("HttpService");
local dependency_folder = "dependencies/";
local url = "https://raw.githubusercontent.com/Vzurxy/zerohub/master/dependencies/packages.json";
local packages_json = "packages.json";
local local_packages = {};
local packages = {};
--Package json decoding.
local function fetch_packages()
    local err, ret = pcall(game.HttpGet, game.HttpGet, url);
    if not err then error("Couldn't fetch the packages.json file."); end;
    local err, json = pcall(http.JSONDecode, http, ret);
    if not err then error("Can't parse packages.json."); end; packages = json;
end; fetch_packages();
--Initialization.
if isfolder(dependency_folder) then
    --Error handling.
    if not isfile(dependency_folder..packages_json) then writefile(dependency_folder..packages_json,"{}"); end;
    local err, ret = pcall(http.JSONDecode, http, readfile(dependency_folder..packages_json));
    if not err then error("Can't parse local packages.json."..ret); end; local_packages = ret;
    --Looping through local dependencies.
    for i, file in pairs(listfiles(dependency_folder)) do
        if not isfolder(file) then
            --Getting the package name.
            local package = file:match(dependency_folder .. "(%w+).lua$");
            --Checking if the packge has been recorded into the local packages.json.
            if local_packages[package] then
                ---Cheking if the local version matches the version on the server.
                if packages[package] and local_packages[package].version ~= packages[package].version then
                    local_packages[package] = nil;
                    delfile(file); --Deleting the file because its outdated.
                end;
            elseif package then --Checks if its .lua file.
                --Recording the package version to the local packages.json file.
                local_packages[package] = {version = 1.0};
            end;
        end;
    end;
    --Checking if all files in local package.json exist.
    for i,v in pairs(local_packages) do
        if not isfile(dependency_folder..i..".lua") then
            local_packages[i] = nil;
        end;
    end;
    --Updating the local packages.json file.
    writefile(dependency_folder..packages_json, http:JSONEncode(local_packages))
else
    --Adding needed files
    makefolder(dependency_folder);
    writefile(dependency_folder..packages_json,"{}");
end;
--Main function definition
getgenv().import = function(package) --Can't wrap it in a c closure.
    --Error handling.
    if type(package) ~= "string" then error("bad argument #1 to 'import' (string expected, got " .. type(package) .. ")") end
    if not packages[package] and not local_packages[package] then error("Invalid package") end
    --If the function has already been loaded, calls the function in memory.
    if type(packages[package]) == "function" then
        return packages[package]()
    elseif local_packages[package] then --If the file is already locally stored, loads the file from local storage.
        if not isfile(dependency_folder..package..".lua") then error("File in local storage was deleted.") end
        packages[package] = loadfile(dependency_folder..package..".lua")
        return packages[package]()
    else --Loads the package from the interwebs.
        --Error hnadling.
        local err, ret = pcall(game.HttpGet, game, packages[package].url)
        if not err then error("Couldn't fetch the package."..ret) end
        --Refresing the packages.json file. 
        fetch_packages()
        --Adding the package version to the local package.json file.
        local_packages[package] = {version = packages[package].version}
        --Saving the package.
        writefile(dependency_folder..package..".lua", ret)
        --Updating the local packages.json file.
        writefile(dependency_folder..packages_json, http:JSONEncode(local_packages))
        return loadstring(ret)()
    end
end

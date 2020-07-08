local package = {};
local set_thread_identity = syn.set_thread_identity or set_thread_context or setthreadcontext --idk what sirhurt has and frankly idc

--Package class
local index_list = {};
local newindex_list = {};
local namecall_list = {};

function package.indexhook(object, callback)
    if index_list[object] then
        error("Same object hooked by multiple functions!");
    end
    index_list[object] = callback;
end;

function package.newindexhook(object, callback)
    if newindex_list[object] then
        error("Same object hooked by multiple functions!");
    end;
    newindex_list[object] = callback;
end;

function package.namecallhook(method, callback)
    if namecall_list[method] then
        error("Same method hooked by multiple functions!");
    end;
    namecall_list[method] = callback;
end;

--Hooks
local mt = getrawmetatable(game);
local index, newindex, namecall = mt.__index, mt.__newindex, mt.__namecall;
setreadonly(mt, false);
--Index hook
mt.__index = newcclosure(function(t,k)
    if not checkcaller() then
        if index_list[t] then
            return index_list[t](index,t,k);
        end;
    end;
    return index(t,k);
end);
--Newindex hook
mt.__newindex = newcclosure(function(t,...)
    if not checkcaller() then
        if newindex_list[t] then
            return newindex_list[t](newindex,t,...);
        end;
    end;
    return newindex(t,...);
end);
--Namecall hook
mt.__namecall = function(...)
    if not checkcaller() then
        local method = getnamecallmethod();
        if namecall_list[method] then
            return namecall_list[method](namecall,...);
        end;
    end;
    return namecall(...);
end;

--Returing the class
return package;

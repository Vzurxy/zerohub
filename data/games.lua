local BASE_SCRIPTS = "https://raw.githubusercontent.com/Vzurxy/zerohub/master/scripts/"

local function GetScript(Name)
  return BASE_SCRIPTS .. Name .. ".lua"
end

return {
  ["000000000"] = {
    Timestamp = "2020-00-00T0:00:00.00Z",
    Script = GetScript("example")
  }
}

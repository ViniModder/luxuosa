local Proxy = module("vrp","lib/Proxy")
local vRP = Proxy.getInterface("vRP")

local listQuerys = {}
local debugmode = false

local function blob2string(blob)
  for i,c in pairs(blob) do
    blob[i] = string.char(c)
  end

  return table.concat(blob)
end

-- METHODS
local queries = {}
local API = exports["oxmysql"]

local function on_init(cfg)
  return API ~= nil
end

local function on_prepare(name, query)
    queries[name] = query
end

local function on_query(name, params, mode)
  local query = queries[name]
  local _params = {_ = true}

  if not listQuerys[name] then listQuerys[name] = 0 end
  listQuerys[name] = (listQuerys[name] + 1)
  if debugmode then
    print(name, listQuerys[name])
  end
  
  for k,v in pairs(params) do _params[k] = v end
  local r = async()
  if mode == "execute" then
    API:execute(query, _params, function(data)
      r(data or 0)
    end)
  elseif mode == "scalar" then
    API:scalar(query, _params, function(scalar)
      r(scalar)
    end)
  else
    API:fetch(query,_params, function(rows)
      for _,row in pairs(rows) do
        if type(row) == "table" then
          for k,v in pairs(row) do
            if type(v) == "table" then
              row[k] = blob2string(v)
            end
          end
        end
      end
      r(rows, #rows)
    end)
  end
  return r:wait()
end

async(function()
	Wait(1000)
	vRP.registerDBDriver("oxmysql", on_init, on_prepare, on_query)
end)

RegisterCommand('resetquerys', function(source,args)
  if source > 0 then return end
  
  listQuerys = {}
  print("Querys Resetadas.")
end)

RegisterCommand('listquerys', function(source,args)
  if source > 0 then return end

  print(json.encode(listQuerys, { indent = true }))
end)

RegisterCommand('debugquerys', function(source,args)
  if source > 0 then return end

  if debugmode then
    debugmode = false
    print("Debug Querys: Off")
  else
    debugmode = true
    print("Debug Querys: On")
  end
end)


http = require("socket.http") --luasocket
ltn12 = require("ltn12")
json = require("json") -- luajson

response = {}
save = ltn12.sink.table(response)

ok, code, headers = http.request{url = "", sink = save}

--- show that we got a valid response
print(code) -- should be 201 for POST success 
saveditem = response[1]; -- kinvey appdata responses return arrays (which are tables in Lua)
print(saveditem)

objAsTable = json.decode(table.concat(response))
for k,v in pairs(objAsTable) do print(k,v) end

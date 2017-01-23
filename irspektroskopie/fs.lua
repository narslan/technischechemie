local fs = {}

local function isempty(s)
  return s == nil or s == ''
end

function fs.readcsv( file , strip)

  local lines,xvalues,yvalues={},{},{}

  for line in assert(io.lines(file)) do

    table.insert(lines, line)

  end

  for i, line in ipairs(lines) do

    if (i>strip and not isempty(line) ) then

      local s, e = line:find("%s+", 1)
      local y=tonumber(line:sub(e))
      local x=tonumber(line:sub(1,e))
      table.insert(xvalues,x)
      table.insert(yvalues,y)


    end

  end

  return xvalues,yvalues

end


function fs.readcsv2( file , strip,strip2)

  local lines,xvalues,yvalues={},{},{}

  for line in assert(io.lines(file)) do

    table.insert(lines, line)

  end
  for i, line in ipairs(lines) do

    if (i>strip and i<strip2 and not isempty(line)) then 

      local s, e = line:find("%s+", 1)
      local y=tonumber(line:sub(e))
      local x=tonumber(line:sub(1,e))
      table.insert(xvalues,x)
      table.insert(yvalues,y)


    end

  end

  return xvalues,yvalues

end



function fs.readvektordata( file )

  local lines,vektors={},{}

  table.insert(vektors,{})
  table.insert(vektors,{})
  table.insert(vektors,{})
  for line in assert(io.lines(file)) do

    table.insert(lines, line)

  end


  for i, line in ipairs(lines) do

    if i>1 then
      local values={}
      for i in string.gmatch(line, "%S+") do
        table.insert(values,tonumber(i))
      end
      table.insert(vektors[1],values[1])
      table.insert(vektors[2],values[2])
      table.insert(vektors[3],values[3])
    end
  end

  return vektors

end

function fs.split(str, pat)
  local t = {}  -- NOTE: use {n = 0} in Lua-5.0
  local fpat = "(.-)" .. pat
  local last_end = 1
  local s, e, cap = str:find(fpat, 1)
  while s do
    if s ~= 1 or cap ~= "" then
      table.insert(t,cap)
    end
    last_end = e+1
    s, e, cap = str:find(fpat, last_end)
  end
  if last_end <= #str then
    cap = str:sub(last_end)
    table.insert(t, cap)
  end
  return t
end

return fs

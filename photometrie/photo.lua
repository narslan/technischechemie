 --local files = {'H2O.TXT','1.TXT','2.TXT','3.TXT','MAX.TXT','H2OA.TXT','1A.TXT','2A.TXT','3A.TXT'}

 --local files = {'H2O.TXT','H2OA.TXT'}
 --local files = {'1.TXT'}
       --local files = {'450.TXT', '450A.TXT','450B.TXT','450C.TXT'}
       --local files1 = {'451.TXT','451A.TXT','451B.TXT','451C.TXT'}
       --local files2 = {'452.TXT','452A.TXT','452B.TXT','452C.TXT'}
       --local files3 = {'453.TXT','453A.TXT','453B.TXT','453C.TXT'}
       local files = {'M.TXT','M2.TXT','M3.TXT','M4.TXT'}
--local files3 = {'453.TXT','453A.TXT','453B.TXT','453C.TXT'}
--local files3 = {'453.TXT','453A.TXT','453B.TXT','453C.TXT'}
function findmax( t )
  local tmp = {}
  for i=1,#t do
    table.insert(tmp,tonumber(t[i][2]))
  end
  local max_val, key = -math.huge
    for k, v in pairs(tmp) do
    if v > max_val then
        max_val, key = v, k
    end
end
return t[key][1], t[key][2]

end

function findmin( t )
  local tmp = {}
  for i=1,#t do
    table.insert(tmp,tonumber(t[i][2]))
  end
  local min_val, key = math.huge
    for k, v in pairs(tmp) do
    if v < min_val then
        min_val, key = v, k
    end
end
--print(t[key][1], t[key][2])

end

for filei=1,#files do
    local werte={}
    local x = 0
    for line in io.lines(files[filei]) do
        if type(line)  then

          table.insert(werte,{400+x,line})

    if tostring(x) == tostring(202.3) then
            --   print(files[filei],400+x,line)
     end
        x = x + 0.85
        end
    end
    print(findmax(werte))
  end


--function sa(x)
--  return 0.0035218 * x + 0.0593770
--end
--print(sa(-0.012810))
--print(sa(-0.012904))

--for i=1,4 do
--  print(sa(i))
--end
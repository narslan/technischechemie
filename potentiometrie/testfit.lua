local fs = dofile( "fs.lua" )
local pl = require 'pl.pretty'

function nernst( v )
  local vc = v / 1000
  return math.pow(10,vc/0.05916)
end

function mean( t )
  local sum = 0
  local count= 0

  for k,v in pairs(t) do
    if type(v) == 'number' then
      sum = sum + v
      count = count + 1
    end
  end

  return (sum / count)
end

function standardDeviation( t )

  local sum = 0
  local count = 0
  local result

 local  m = mean( t )

  for k,v in pairs(t) do
    if type(v) == 'number' then
      local vm = (v - m)^2
      print(vm)
      sum = sum + vm
      count = count + 1
    end
  end
    result = math.sqrt(sum / (count-1))
math.sqrt(sum / (count-1))
  print(string.format("sum: %.2f count:%.2f, deltav: %.5f fehler=%.5f mean:  %.f5",sum,count, result, result/(math.sqrt(count)), mean(t)))

  return result
end



a,b=fs.readcsv("fallung.csv")

print(standardDeviation(a))
--print(pl.dump(zweite_ableitung))

--pl.dump(a[1])
--print(findmittel("dortmund.txt") )

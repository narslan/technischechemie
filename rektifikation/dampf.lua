unpack=table.unpack
-- Code to write PGFplots data as coordinates
local string = string
local lines = {}
-- Table to hold statistical functions
stats={}

function stats.mean( t )
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


function string:split(sep)
        local sep, fields = sep or "%s", {}
        local pattern = string.format("([^%s]+)", sep)
        self:gsub(pattern, function(c) fields[#fields+1] = c end)
        return fields
end

function printHyperbola(t)

    local lines={}

    local summex=0
    local summey=0
    local xwerte={}
    local ywerte={}
    local xmalx={}      --x^2
    local xmaly={}      --x*y
    local ymaly={}      --x*y
    local summexy=0    --Σx*y
    local summexx=0    --Σx*x
    local summeyy=0    --Σy*y
    local summexy=0
    local summexxx=0
    local summexxxx=0
    local summeyxx=0

for line in io.lines("dampf.csv") do
  table.insert(lines, line)
end

for i, line in ipairs(lines) do
  if i>1 then
     local s, e = line:find("%s+", 1)
     local y=tonumber(line:sub(e))
     local x=tonumber(line:sub(1,e))
     summex=summex+x
     summey=summey+y
     table.insert(xwerte,x)
     table.insert(ywerte,y)
     table.insert(xmalx,x^2)
     table.insert(xmaly,x*y)
     table.insert(ymaly,y*y)
        summexx=summexx+x^2
        summexy=summexy+x*y
        summeyy=summeyy+y*y
        summexxx=summexxx+x^3
        summexxxx=summexxxx+x^4
        summeyxx=summeyxx+y*x*x
   end
end

    local n = #lines-1
    local xsumme2=summex^2

    local m= (n*summexy-summex*summey)/(n*summexx-xsumme2)
    local b= (summexx*summey-summex*summexy)/(n*summexx-xsumme2)
    local syx=math.sqrt((summeyy-b*summey-m*summexy)/(n-2))
    local xmean=summex/n
    local ymean=summey/n

    local quad={}

quad.xy=(summexy/n)
quad.xx=(summexx/n)
quad.xxx=(summexxx/n)
quad.xxxx=(summexxxx/n)
quad.yxx=(summeyxx/n)
quad.a=( (  (quad.yxx-ymean*quad.xx ) * (quad.xx - math.pow(quad.xx,2))
-(quad.xy-ymean*xmean)* (quad.xxx-xmean*quad.xx)   ) /
((  quad.xxxx- math.pow (quad.xx,2))* (quad.xx- math.pow (quad.xx,2)  )-
math.pow((quad.xxx-xmean*quad.xx),2)))
quad.b=((quad.xy-xmean*ymean-quad.a*(quad.xxx-xmean*quad.xx) )/(quad.xx- math.pow (quad.xx,2) ) )
quad.c= ymean-quad.a*quad.xx-quad.b*xmean


  return quad.a*t^2+quad.b*t+quad.c

end
print(printHyperbola(0.40))
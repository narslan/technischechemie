unpack=table.unpack
-- Code to write PGFplots data as coordinates
local string = string
local lines = {}
-- Table to hold statistical functions
stats={}

-- Get the mean value of a table
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


--- SMDE,
for line in io.lines("coffein.csv") do
  table.insert(lines, line)
end
local summex=0
local summey=0
local xwerte={}
local ywerte={}
local xmalx={}   --x^2
local xmaly={}      --x*y
local ymaly={}      --x*y
local summexy=0    --Σx*y
local summexx=0    --Σx*x
local summeyy=0    --Σy*y
local tsummeyy= {}
local summexy=0
local summexxx=0
local summexxxx=0
local summeyxx=0


for i, line in ipairs(lines) do
  if i>1 then
     local s, e = line:find("%s+", 1)
     local y=tonumber(line:sub(e))
     local x=tonumber(line:sub(1,e))
     summex=summex+x
     summey=summey+y
     table.insert(tsummeyy,summey)
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

----m
local n = #lines-1
local xsumme2=summex^2

local m= (n*summexy-summex*summey)/(n*summexx-xsumme2)
local b= (summexx*summey-summex*summexy)/(n*summexx-xsumme2)
local syx=math.sqrt((summeyy-b*summey-m*summexy)/(n-2))
local xmean=summex/n
local ymean=summey/n
-------
--Σ(x-x)^2
local xminxmean=0
local covaryance=0
for j=1,n do
  xminxmean=xminxmean+(xwerte[j]-xmean)^2
  --Korrelationkoeffizient
  covaryance=covaryance+((xwerte[j]-xmean)*(ywerte[j]-ymean))/n

end


local sb=syx*math.sqrt((1/n)+(xmean^2/xminxmean))
local sm=math.sqrt(syx^2/xminxmean)
local sx0=syx/m  --- Verfahrungsstandartabweichung
local Vxo=sx0*100/xmean ---die relative Verfahrungsstandartabweichung
print(m)
print(b)
print(sb)
print(sx0)
print(Vxo)
print(xmean)

---
function mess(messwert)
  local c = (messwert-b)/m
  return string.format('%.3f',c)
end
function operator(t)
 local c = m*t+b
  return string.format('%.3f',c)
end


function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

-----Nachweisgrenze
--

local twert_ein_seitig=2.13  --- tabellierter t-Wert
local npm=5 ---- n parallel Messung
local quadratsumme=summexx-(summex^2/n)
local nwg = (twert_ein_seitig*syx/m)*math.sqrt((1/npm)+(1/n)+(xmean^2/quadratsumme)) ---
--local nwg = 0.69

----Bestimmungsgrenze
--
local k=3   -----empfohlener Faktor
local twert_zwei_seitig=2.57  --- tabellierter t-Wert
local xbg= (k*twert_zwei_seitig*syx/m)*math.sqrt((1/npm)+(1/n)+((k*nwg-xmean)^2)/quadratsumme)
--local xbg = 3.65
local minx=math.min(unpack(xwerte))-xmean
local maxx=math.max(unpack(xwerte))+xmean

-----Quadratisch
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


function ydach(t)
  return quad.a*t^2+quad.b*t+quad.c
end

local summy=0
for i=1,n do
  summy=summy+math.pow(ywerte[i]-ydach(xwerte[i]),2)
end





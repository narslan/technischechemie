local fs = dofile( "fs.lua" )
local pl = require 'pl.pretty'

--function nernst( v )
--  local vc = v / 1000
--  return math.pow(10,(vc-0.141)/0.05916)
--end

a,b=fs.readcsv("ag.txt")
--print(pl.dump(b))
--a1,summe1=stat.mean(a[1])
--a2,summe2=stat.mean(a[2])
--a3,summe3=stat.mean(a[3])
--mq1, sa1, mf1=stat.standardDeviation(a[1])
--mq2, sa2, mf2=stat.standardDeviation(a[2])
--mq3, sa3, mf3=stat.standardDeviation(a[3])
--sprint("%.0 ")
--print(string.format("%s    = %s  = %s    = %s    = %s",  "Summe", "Mittelwert", "Mittlere Quadrat ","Standartabweichung ", "Fehler"   ))
--print(string.format("%3.5f = %3.5f = %3.5f = %3.5f = %3.5f", summe1, a1, mq1, sa1, mf1))
--print(string.format("%3.5f = %3.5f = %3.5f = %3.5f = %3.5f", summe2, a2, mq2, sa2, mf2))
--print(string.format("%3.5f = %3.5f = %3.5f = %3.5f = %3.5f", summe3, a3, mq3, sa3, mf3))
--tabelle={}
erste_ableitung = {}
for i=1,#a do
  if i%2 == 0 then
   dif = (b[i] - b[i-1])/(a[i] - a[i-1])
  table.insert(erste_ableitung, {(a[i] + a[i-1])/2,dif})
  end
end

zweite_ableitung = {}
for i=1,#erste_ableitung do
   if i%2 == 0 then
   dif = (erste_ableitung[i][2]-erste_ableitung[i-1][2])/((erste_ableitung[i][1]-erste_ableitung[i-1][1]))
  table.insert(zweite_ableitung,{(erste_ableitung[i][1]+erste_ableitung[i-1][1])/2,dif})
  end
end
local dumpableitung = "X Y \n"

for i=1,#erste_ableitung do
  --print(erste_ableitung[i][1],erste_ableitung[i][2])
  dumpableitung = dumpableitung .. string.format("%.5f %.5f \n",erste_ableitung[i][1],erste_ableitung[i][2])
end

local dumpzweiteableitung = "X Y \n"

for i=1,#zweite_ableitung do
  --print(zweite_ableitung[i][1],zweite_ableitung[i][2])
    dumpzweiteableitung = dumpzweiteableitung .. string.format("%.5f %.5f \n",zweite_ableitung[i][1],zweite_ableitung[i][2])
end

--local f = assert(io.open(naohpdsss.txt, "w"))
local f = io.open("agd.txt", "w")

f:write(dumpableitung)
local fd = io.open("agdd.txt", "w")
fd:write(dumpzweiteableitung)




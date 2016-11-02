local fs = dofile( "fs.lua" )
local pl = require 'pl.pretty'



a=fs.readcsv("fallung.csv")
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
print(pl.dump(a))

--pl.dump(a[1])
--print(findmittel("dortmund.txt") )

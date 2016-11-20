function ph( V )
 print (2.5 - 0.01*V,50+(0.1*V),(2.5 - 0.01*V)  / (50+(0.1*V)) , math.log10((2.5 - 0.01*V)  / (50+(0.1*V))))
  return -math.log10((2.5 - 0.01*V)  / (50+(0.1*V)))
end
function ph2( V )

  return 14+math.log10((0.01*(V-250))  / (75+0.1*(V-250)))
end


local f = io.open("naoht.txt", "w")

local dumpableitung = "X Y \n"

for i=1,249 do
 dumpableitung = dumpableitung.. i/10 .." ".. ph(i) .. "\n"
end
 dumpableitung =  dumpableitung.. 25.0 .." ".. 7 .. "\n"

for i=251,300 do
dumpableitung = dumpableitung.. i/10 .." ".. ph2(i) .. "\n"
 -- print(i+25,ph2(i))
end
f:write(dumpableitung)

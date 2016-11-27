function ph( V )
  return string.format("%.3f",(-math.log10((2.5 - 0.1*(V-50)) / V)))
end
function ph2( V )
  return string.format("%.3f",14+math.log10(((V-75)/10) / V))
end
--
--local f = io.open("naoht.txt", "w")
local f = io.open("tho.txt", "w")

local dumpableitung = "X Y \n"

for i=1,24 do
 dumpableitung = dumpableitung.. i .. " & ".. i/10 .." & " .. (i+50) .. " & " .. (2.5 - 0.1*i) .." & "..string.format("%.3f",(2.5 - 0.1*i)/(i+50)) .." & "..  ph(i+50) .. "\\\\\n"
 --dumpableitung = dumpableitung..  i .." "..  ph(i+50) .. "\n"

end
 dumpableitung = dumpableitung.. 25 .. " & ".. 2.5 .." & " .. 75 .. " & " .. 0 .." & ".. 0 .." & "..  7 .. "\\\\\n"
--dumpableitung = dumpableitung..  25 .. " ".. 7 .. "\n"

for i=26,50 do
 dumpableitung = dumpableitung.. i .. " & ".. i/10 .." & " .. (i+50) .. " & " .. ( 0.1*(i-25)) .." & "..string.format("%.3f",(0.1*(i-25))/(i+50)) .." & "..  ph2(i+50) .. "\\\\\n"
 --dumpableitung = dumpableitung..  i .. " ".. ph2(i+50) .. "\n"

 -- print(i+25,ph2(i))
end
f:write(dumpableitung)

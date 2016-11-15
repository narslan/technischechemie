local fs = dofile( "fs.lua" )
local pl = require 'pl.pretty'

a,b=fs.readcsv("daten/1.txt")

function abschneiden( t , b, s )
local tt = {}
  for i=b,s do
    table.insert(tt,t[i])
  end
  return tt
  -- body
end

--local c = abschnitt(a,70 ,40)
local h1 = {415.110, 344.317, 291.154, 242.777}
local h2 = {382.940, 315.957, 264.972, 218.245}
local h3 = {422.583, 349.583, 295.628, 245.888}
local h4 = {426.132, 357.975, 305.318, 256.129}

local tw1h1 = {5.489,6.495,8.140,10.694}
local tw2h1 = {5.760,6.813,8.524,11.174}


local tw1h2 = {5.664,6.645,8.288,10.838}
local tw2h2 = {5.886,6.935,8.640,11.289}


local tw1h3 = {7.356,8.696,10.890,14.289}
local tw2h3 = {7.713, 9.121,11.396,14.921}

local tw1h4 = {7.373,8.723,10.924,14.346}
local tw2h4 = {7.711,9.112,11.390,14.921}

local tr1={ 5.607 ,   6.637 ,   8.316 ,   10.917}
local tm1 = 2.991
local tr2 = {5.748,6.777,8.448,11.045}
local tm2 = 3.108
local tr3 = { 7.516 , 8.893 , 11.128,14.591}
local tm3 = 3.981
local tr4 = {7.516 , 8.892 , 11.128, 14.601}
local tm4 = 4.004

for i=1,#h1 do

--print((tr1[i]-tm1)/tm1)
--print((tr2[i]-tm2)/tm2)
--print((tr3[i]-tm3)/tm3)
 print((tr4[i]-tm4)/tm4)
 -- print((tr2[i]-tm2)/tm4)
  --print(h4[i]/2)
 -- print((tw2h1[i]-tw1h1[i])/2.354)
 -- print((tw2h2[i]-tw1h2[i])/2.354)
  --print((tw2h3[i]-tw1h3[i])/2.354)
 -- print((tw2h4[i]-tw1h4[i])/2.354)

end
--pl.dump()

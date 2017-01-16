fit=require "fit"
see=require "see"
function hh360 (intensity) 
   intbas = 1.86e5
	 return -math.log(intensity/(intbas-intensity))
end
function hh320 (intensity) 
   intbas = 1.5964e5
	 return -math.log(intensity/(intbas-intensity))
end



function Each(p,int,f)
  return coroutine.wrap(function()
    for _, x in ipairs(p) do
      local wert = f(int[_]) 
        if not (wert~=wert)  then
          coroutine.yield(x,wert)
        end  
    end
  end)
end

local ph = { 2.0, 4.0 , 6.0 , 8.2, 10.0, 12.2} 
local int360 = {1.779e2,1.9123e2,2.42999e2,8.87501e3,1.2253e5,1.86032e5}

local int320 = {  1.7145e4,   4.75454e4,  4.9373e4,  5.589716e4,  1.12899375e5,  1.59646828e5}


local k360x = {}
local k360y = {}
local k320x = {}
local k320y = {}

for y,z in Each(ph,int360,hh360) do
  table.insert(k360x,y)
  table.insert(k360y,z)
end


for y,z in Each(ph,int320,hh320) do
  table.insert(k320x,y)
  table.insert(k320y,z)
end

local t36  = fit.linearmitr(k360x,k360y)
local t32  = fit.linearmitr(k320x,k320y)

print(see(t36))
print(see(t32))
for i=1,#k360x do
  print(k360x[i],k360y[i])
end

--for i=1,#k320x do
--  print(k320x[i],k320y[i])
--end




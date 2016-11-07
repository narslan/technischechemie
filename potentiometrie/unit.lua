local fs = dofile( "fs.lua" )
a,b=fs.readcsv("data.csv")



local c = 3e8
local h = 6.626e-34
local A = 6.022e23
local ev = 1.602e-19

function wztonm( cm )
  return 1e7 / cm
end
function nmtowz( lambda )
  return 1 / (lambda * 1e-7)
end

function nmtofr( lambda )
  return c / (lambda * 1e-9)
end

function nmtoe( lambda )
  return ((h*c / (lambda * 1e-9))*A)/1000
end

function nmtoev( lambda )
  return (h*c / (lambda * 1e-9)) / ev
end

local table = {1e6,5e5,5e4,2500,800,400,100,200,10,3,5e-4}
for i,v in ipairs(table) do
 -- print(v, nmtowz(v), nmtofr(v),nmtoe(v),nmtoev(v))
end
for i=1,#a do
  print(a[i],b[i],wztonm(a[i]),nmtoev(wztonm(a[i])),nmtofr(wztonm(a[i])))
end
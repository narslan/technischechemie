--///////////////////--
--// Curve Fitting //--
--///////////////////--

-- v 0.2

-- Lua 5.1 compatible

-- little add-on to the matrix module, to show some curve fitting

-- http://luaforge.net/projects/LuaMatrix
-- http://lua-users.org/wiki/SimpleFit

-- Licensed under the same terms as Lua itself.

-- requires matrix module
local seq = require "pl.seq"
local pretty = require "pl.pretty"
local matrix = require "matrix"

-- The Fit Table
local fit = {}

-- Note all these Algos use the Gauss-Jordan Method to caculate equation systems

-- function to get the results
local function getresults( mtx )
   assert( #mtx+1 == #mtx[1], "Cannot calculate Results" )
   mtx:dogauss()
   -- tresults
   local cols = #mtx[1]
   local tres = {}
   for i = 1,#mtx do
      tres[i] = mtx[i][cols]
   end
   return table.unpack( tres )
end

-- fit.linear ( x_values, y_values )
-- fit a straight line
-- model (  y = a + b * x  )
-- returns a, b
function fit.linear( x_values,y_values )
   -- x_values = { x1,x2,x3,...,xn }
   -- y_values = { y1,y2,y3,...,yn }

   -- values for A matrix
   local a_vals = {}
   -- values for Y vector
   local y_vals = {}

   for i,v in ipairs( x_values ) do
      a_vals[i] = { 1, v }
      y_vals[i] = { y_values[i] }
   end

   -- create both Matrixes
   local A = matrix:new( a_vals )
   local Y = matrix:new( y_vals )

   local ATA = matrix.mul( matrix.transpose(A), A )
   local ATY = matrix.mul( matrix.transpose(A), Y )
   matrix.print(ATA) 
   local ATAATY = matrix.concath(ATA,ATY)
   
   return getresults( ATAATY )
end

-- fit.parabola ( x_values, y_values )
-- Fit a parabola
-- model (  y = a + b * x + c * x² )
-- returns a, b, c
function fit.parabola( x_values,y_values )
   -- x_values = { x1,x2,x3,...,xn }
   -- y_values = { y1,y2,y3,...,yn }

   -- values for A matrix
   local a_vals = {}
   -- values for Y vector
   local y_vals = {}

   for i,v in ipairs( x_values ) do
      a_vals[i] = { 1, v, v*v }
      y_vals[i] = { y_values[i] }
   end

   -- create both Matrixes
   local A = matrix:new( a_vals )
   local Y = matrix:new( y_vals )

   local ATA = matrix.mul( matrix.transpose(A), A )
   local ATY = matrix.mul( matrix.transpose(A), Y )

   local ATAATY = matrix.concath(ATA,ATY)
   return getresults( ATAATY )
end

-- fit.exponential ( x_values, y_values )
-- Fit exponential
-- model (  y = a * x^b )
-- returns a, b
function fit.exponential( x_values,y_values )
   -- convert to linear problem
   -- ln(y) = ln(a) + b * ln(x)
   for i,v in ipairs( x_values ) do
      x_values[i] = math.log( v )
      y_values[i] = math.log( y_values[i] )
   end

   local a,b = fit.linear( x_values,y_values )

   return math.exp(a), b
end

-- fit.linear ( x_values, y_values )
-- fit a straight line
-- model (  y = a + b * x  )
-- returns a, b
function fit.linearmitr( xval, yval )
   -- x_values = { x1,x2,x3,...,xn }
   -- y_values = { y1,y2,y3,...,yn }
 -- for i,v in seq.enum(x_values) do print(i..' '..v) end
    local sumx, sumy, sumxx, sumyy, sumxy = 0, 0 , 0 , 0, 0
    local n = #xval
        for i=1,n do
       sumx = sumx + xval[i]  
       sumy = sumy + yval[i]  
       sumxx = sumxx + xval[i]^2  
       sumyy = sumyy + yval[i]^2  
       sumxy = sumxy + (xval[i] * yval[i])  
      end
     local sumSqDevx = sumxx - sumx ^2 / n
    local sumSqDevy = sumyy - sumy ^2 / n
    local sumSqDevxy = sumxy - sumx * sumy / n
    local slope = sumSqDevxy / sumSqDevx  
    local intercept = (sumy - slope * sumx ) /n
  
 local sumSqErrors = sumSqDevy - (sumSqDevx * slope ^ 2)
 local stdev = math.sqrt(sumSqErrors/(n-2))
--r 
    local denom = sumSqDevx * sumSqDevy
    local rSquared = sumSqDevxy^2/ denom

 
--   pretty.dump(rSquared)
 return slope,intercept,rSquared,stdev
end 

function fit.adiab(xval,yval,kappa)
  local R = 8.314
  local sumx, sumy = 0, 0 
  
  local n = #xval
  for i=1,n do
    sumy = sumy + ( yval[i] - kappa * xval[i] )^2
    sumx = sumx + xval[i]^2
  --  print(sumy,sumx)
  end
  local fehl = math.sqrt(sumy/((n-1)*sumx))
  local cvf = math.sqrt((-1*R*fehl/(kappa-1)^2)^2)
  local cv= R/(kappa-1)
  local cp= R*kappa/(kappa-1)

  return fehl,cvf,cv,cp

end

function fit.split(str, pat)
  local t = {}  -- NOTE: use {n = 0} in Lua-5.0
  local fpat = "(.-)" .. pat
  local last_end = 1
  local s, e, cap = str:find(fpat, 1)
  while s do
    if s ~= 1 or cap ~= "" then
      table.insert(t,cap)
    end
    last_end = e+1
    s, e, cap = str:find(fpat, last_end)
  end
  if last_end <= #str then
    cap = str:sub(last_end)
    table.insert(t, cap)
  end
  return t
end



return fit

--///////////////--
--// chillcode //--
--///////////////--

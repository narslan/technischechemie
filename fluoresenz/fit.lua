local fit = {}

function fit.mittelwert( vector )
  local sum = 0
  local n = #vector
  for i=1,n do
    sum = sum + vector[i]
  end
  return sum, sum/n
end
function mittelwert( vector )
  local sum = 0
  local n = #vector
  for i=1,n do
    sum = sum + vector[i]
  end
  return sum, sum/n
end

-- function to get the results
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


  local bigs = 0
  for i=1,n do
      bigs = bigs + (intercept + slope*xval[i] -yval[i] )^2
  end
  local sig = math.sqrt(bigs/(n-2))
  local max = sig * math.sqrt(sumxx/((n*sumxx)-(sumx^2)))
  local mbx = sig * math.sqrt(n/((n*sumxx)-(sumx^2)))

   local ma = stdev * math.sqrt(sumxx/((n*sumxx)-(sumx^2)))

  --r
  local denom = sumSqDevx * sumSqDevy
  local rSquared = sumSqDevxy^2/ denom



  local report = {}
  report.slope = slope
  report.intercept = intercept
  report.rSquared = rSquared
  report.stdev = stdev
  report.sig = sig
  
  return report
  --return report
end

function fit.fehlerDerSteigung( xval, yval )
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
  local fehler = 0
  local aa = 0
  local sum,mitt=mittelwert(xval)
  for i=1,n do
      fehler = fehler + (intercept + slope*xval[i] -yval[i] )^2
      aa = aa + (xval[i] - mitt)^2
  end
  local aae = math.sqrt((stdev^2)/aa)
  --- Fehler der Steigung ^delta^ a

  return sum,mitt,fehler,n, stdev, aa, aae

end


function fit.tempfehler(xval)
  local sumx, sumy = 0, 0

  local n = #xval
  for i=1,n do
    sumy = sumy + ( yval[i] - kappa * xval[i] )^2
    sumx = sumx + xval[i]^2
  --  print(sumy,sumx)
  end
  local fehl = math.sqrt(sumy/((n-1)*sumx))


  return fehl

end

return fit

--///////////////--
--// chillcode //--
--///////////////--

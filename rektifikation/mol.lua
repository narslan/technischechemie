function volumentomol (v)
     return (v*0.7694/98.19)/((v*0.7694/98.19)+((50-v)*0.8669/92.15))
end


--for i=0,55,0 do
--  print(i,volumentomol(i))
--end
function cp (t)
     return -3.4e-9*t^4 - 8.323e-7*t^3+7.966e-5*t^2 - 3.049e-3*t + 4.217
end
function vis (t)
     return -2.597e-6*t^3 + 5.939e-4*t^2 - 4.853e-2 * t + 1.789
end
function ubergangs(t)
     return 0.100 + 1.66e-3*t
end
tbad = {40.0,40.1,40.1,40.1,39.8,38.9,38.3}

local d = 0.12
for i=1,#tbad do
  local cpw = cp(tbad[i])
  local visw = vis(tbad[i])
  local lambda = ubergangs(tbad[i]+273.15)
  local pr = visw * cpw / lambda
  local nu = 3.6 * math.pow(850,0.6666666)*math.pow(pr,0.3333333)
  local alpha = nu*lambda/d
 -- print(string.format("%.2f %.6f %.5f %.4f %.4f %.4f %.2f",tbad[i]+273.15,cpw,visw,lambda,pr,nu,alpha))
end

----Auf genomene wärme
geschwindigkeit={120,170,220,270,320,370,420}
taus= {20.2,19.8,19.6,19.5,19.4,19.4,19.4}
tein= {32.1,30.6,29.2,27.9,26.9,25.8,25.1}
dichte = {0.9922204,0.99218,0.99218,0.99218,0.99229,0.99263,0.99286}

function warme( v,dr,c,t1,t2)
  return v*dr*c*(t2-t1)
  -- body
end
for i=1,#tbad do
  --print(string.format("%g %.1f %.1f %.4f %.5f %.2f",volume[i],tein[i],taus[i],cp(tbad[i]),dichte[i],warme(volume[i],dichte[i],cp(tbad[i]),taus[i],tein[i])))
end

---- Kw
function mittemp(tt,t1,t2)
  return (math.abs(tt-t1)-math.abs(tt-t2))/math.log((math.abs(tt-t1)+273.15)/(math.abs(tt-t2)+273.15))
end

for i=1,#tbad do
  local cpw = cp(tbad[i])
  local visw = vis(tbad[i])
  local lambda = ubergangs(tbad[i]+273.15)
  local pr = visw * cpw / lambda
  local nu = 3.6 * math.pow(850,0.6666666)*math.pow(pr,0.3333333)
  local alpha = nu*lambda/d
  local m = mittemp(tbad[i],tein[i],taus[i])
  local w = warme(geschwindigkeit[i]*1000/3600,dichte[i],cpw,taus[i],tein[i])
  local A = 6.9e-2
 local kw = w/(m*A)
 local z = 0.001
 local dnu2=0.006
 local alpha2 = 1 / ((1/kw)-(1/alpha)-(z/lambda))
 local nu2 = alpha2 * dnu2 / lambda
 --print(string.format("%.2f %.1f %.1f %.2f %.4f %.4f",volume[i]*1000/3600,math.abs(tbad[i]-tein[i]),math.abs(tbad[i]-taus[i]),m,w,kw))
--print(string.format("%.2f %.4f %.2f %.2f ",alpha, kw, alpha2,nu))

---re2
local vr = 0.0777 * 0.001
local u = 2.75 * (geschwindigkeit[i]/(3600*1000))/ vr
local re2 = u * dichte[i]*2.75/(0.001*visw)
--print(string.format("%.6f %.4f %.6f %.4f ",u, dichte[i], visw/1000,re2))
--print(string.format("%.6f %.4f",u, re2))
print(string.format("%.6f %.4f %.4f %.3f %.2f %.2f", nu2, re2,pr, math.log(nu2), math.log(re2),math.log(pr) ))
end





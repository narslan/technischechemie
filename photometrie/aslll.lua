--y1 = {-0.075126,-0.040223,0.015565,0.075279,0.153527 }
--y2 = {-0.075132, 0.040661, 0.015389, 0.075220,0.153527 }
--y3 = {-0.075398, -0.040852, 0.015438, 0.074893,0.153389}
--y4 = {-0.075585,-0.040569,0.016336,0.074960,0.153601}


x={0,1,2,4}
y = {0.0122, 0.1284, 0.23679, 0.38613}


summex = 0
summey = 0
summexx = 0
summeyy = 0
summexy = 0

for i=1,4 do
  print(string.format("%.6f %.6f %.6f",x[i]^2,y[i]^2,x[i]*y[i]))
  summex =  summex + x[i]
  summey = summey + y[i]
  summexx = summexx + x[i]^2
  summeyy = summeyy + y[i]^2
  summexy = summexy+x[i]*y[i]
end


print(string.format("sumx:%.6f summey:%.6f  summexx: %.6f summeyy: %.6f summexy:%.6f",summex,summey,summexx,summeyy,summexy))
n = 4
ndach= 4
nodach=1
m = ((n*summexy) - (summex * summey))/((n* summexx) - summex^2)
b = ((summexx*summey)-(summex*summexy))/((n* summexx) - summex^2)

print(string.format("m:%.6f b:%.6f", m,b))
for i=1,4 do
  print(m*x[i]+b)
end
syx = math.sqrt(math.abs((summeyy-(b*summey)-(m*summexy)))/(n-2))
sxo = syx / m
qxx= summexx - (summex^2/n)
meanx = summex/n
meany = summey/n
xng = 2.92*(syx/m)*(math.sqrt((1/ndach)+(1/nodach)+((meanx^2)/qxx)))
xbg = 3*4.3*(syx/m)*(math.sqrt((1/ndach)+(1/nodach)+((3*xng -meanx^2)/qxx)))
print(string.format("syx: %.6f sxo: %.6f xmean: %.6f ymean: %.6f qxx: %.6f xng: %.6f xbg: %.6f",syx, sxo, meanx, meany, qxx,xng, xbg))

--for i=1,4 do
 -- print(string.format("ydach: %.6f",m * x[i] + b))
--end
y1 = {-0.075126,-0.040223,0.015565,0.075279,0.153527 }
y2 = {-0.075132, -0.040661, 0.015389, 0.075220,0.153527 }
y3 = {-0.075398, -0.040852, 0.015438, 0.074893,0.153389}
y4 = {-0.075585,-0.040569,0.016336,0.074960,0.153601}


x={0,0.25,0.5,1,2}


  --print(string.format("%s %s %s %s %s %s %s %s %s %s %s %s %s",'y1^2','y2^2','y3^2','y4^2','x^2','xy_1','xy_2','xy_3','xy_4','x*y_1','x*y_2','x*y_3','x*y_4'))

summex = 0
summey = 0
summexx = 0
summeyy = 0
summexy = 0

for i=1,5 do
  print(string.format("%.2f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f %.6f",x[i], y1[i], y2[i], y3[i], y4[i], y1[i]^2,y2[i]^2,y3[i]^2,y4[i]^2,x[i]^2,x[i]*y1[i],x[i]*y2[i],x[i]*y3[i],x[i]*y4[i]))
  summex =  summex + x[i]
  summey = summey + y1[i] +y2[i]+y3[i]+y4[i]
  summexx = summexx + x[i]^2
  summeyy = summey + y1[i]^2 +y2[i]^2+y3[i]^2+y4[i]^2
  summexy = summexy+x[i]*y1[i]+x[i]*y2[i]+x[i]*y3[i]+x[i]*y4[i]
end


print(string.format("sumx:%.6f summey:%.6f  summexx: %.6f summeyy: %.6f summexy:%.6f",summex,summey,summexx,summeyy,summexy))
n = 20
ndach= 4
nodach=5
m = ((n*summexy) - (summex * summey))/((n* summexx) - summex^2)
b = ((summexx*summey)-(summex*summexy))/((n* summexx) - summex^2)

print(string.format("m:%.6f b:%.6f", m,b))

syx = math.sqrt(math.abs((summeyy-(b*summey)-(m*summexy)))/(n-2))
sxo = syx / m
qxx= summexx - (summex^2/n)
meanx = summex/n
meany = summey/n
xng = 2.35*(syx/m)*(math.sqrt((1/ndach)+(1/nodach)+((meanx^2)/qxx)))
xbg = 3*3.18*(syx/m)*(math.sqrt((1/ndach)+(1/nodach)+(((3*xng -meanx)^2)/qxx)))
print(string.format("syx: %.6f sxo: %.6f xmean: %.6f ymean: %.6f qxx: %.6f xng: %.6f xbg: %.6f",syx, sxo, meanx, meany, qxx,xng, xbg))

--for i=1,4 do
 -- print(string.format("ydach: %.6f",m * x[i] + b))
--end
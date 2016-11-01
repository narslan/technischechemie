function ph( V )
  return -math.log10((2.5 - 0.1*V)  / (50+V))
end
function ph2( V )
  return 14+math.log10((0.1*V)  / (75+V))
end
for i=1,24 do
--  print(i,ph(i))
end
for i=1,24 do
  print(i+25,ph2(i))
end

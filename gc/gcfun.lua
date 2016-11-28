function ph( V )
  return string.format("%.3f",((V-326.5)/23216.8))
end
--
--local f = io.open("naoht.txt", "w")
print(ph(729.677)) --blind
print(ph(15751.9))  ---wf
print(ph(9232.71))  ---wp1
print(ph(17498.5))  ---wp2
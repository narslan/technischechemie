function eichkurve(x )
    return 46.191*x^2-148.271*x+118.453
end

function ttox(t)
 return "T to x: "..0.009125 * t ^2 -2.024605*t + 112.325890
end
function ttoy(t)
 return "T to y: ".. -1.040e-03*t^3 + 3.356e-01*t^2 -3.614e+01*t + 1.300e+03
end
--print(eichkurve(1.4860))
--print(eichkurve(1.4851))
--print(eichkurve(1.4855))
function taukurve(x )
    return -5.64*x^3 + 17.14*x^2 - 21.22*x + 110.55
end
function siedekurve(x )
    return 2.54*x^3 + 2.34*x^2 - 14.61*x + 110.60
end
function gleichgewicht(x )
  return -0.25221*x^2+1.21531*x+0.0199
  -- body
end

local bk = {106.9,106.2,104.4,102.4}
local fkk = {104.1,103.9,103.6,103.2}
for j=1,4 do
   for i=0,1,0.00001 do
     if(string.format("%.3f",taukurve(i))==string.format("%.3f",fkk[j])) then
        print(i,taukurve(i),gleichgewicht(i))
        break
      end
    end
end



--print(ttox(110.6))


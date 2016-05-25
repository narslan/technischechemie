function volumentomol (v)
      local sum = 0
      sum=((v*0.7694/98.19)/((v*0.7694/98.19)+((50-v)*0.8669/92.15)))
      return sum
end

print(volumentomol(10))

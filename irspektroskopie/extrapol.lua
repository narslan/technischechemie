fs = dofile("fs.lua")

ph12ax,ph12ay = fs.readcsv("data/zustande.txt",0)

for i=1,#ph12ax do
  print("("..ph12ax[i]..","..ph12ay[i]..")")
end




